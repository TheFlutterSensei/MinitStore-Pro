import 'package:flutter/material.dart';
import 'package:ministore_pro/contants/form_styles.dart';
import 'package:ministore_pro/contants/spacing.dart';
import 'package:ministore_pro/data/products.dart';
import 'package:ministore_pro/models/product.dart';
import 'package:ministore_pro/widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  final void Function(Product product) onAddToCart;
  const HomeScreen({super.key, required this.onAddToCart});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedCategory = 'All';
  bool _inStockOnly = false;

  List<String> get _categories => [
    'All',
    ...products.map((product) => product.category).toSet(),
  ];

  List<Product> _filteredProducts = products;
  final TextEditingController _searchController = TextEditingController();

  void _applyFilters() {
    final query = _searchController.text.trim().toLowerCase();

    setState(() {
      _filteredProducts = products.where((product) {
        final matchesSearch = product.title.toLowerCase().contains(query);
        final matchesCategory =
            _selectedCategory == 'All' || product.category == _selectedCategory;
        final matchesStock = !_inStockOnly || product.inStock;

        return matchesSearch && matchesCategory && matchesStock;
      }).toList();
    });
  }

  void _searchProducts() {
    _applyFilters();
  }

  @override
  void dispose() {
    _searchController.removeListener(_searchProducts);
    _searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_searchProducts);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(Spacing.md),
              child: TextField(
                controller: _searchController,
                decoration: FormStyles.textFieldStyle.copyWith(
                  labelText: 'Search Products',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Spacing.md),
              child: _buildCategoryFilters(),
            ),
            SizedBox(height: Spacing.md),
            Expanded(
              child: _filteredProducts.isEmpty
                  ? const Center(child: Text('No Products Available'))
                  : GridView.builder(
                      padding: const EdgeInsets.all(Spacing.md),
                      itemCount: _filteredProducts.length,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        childAspectRatio: 0.6,
                        maxCrossAxisExtent: 250,
                        mainAxisSpacing: Spacing.md,
                        crossAxisSpacing: Spacing.md,
                      ),
                      itemBuilder: (context, index) {
                        return ProductCard(
                          product: _filteredProducts[index],
                          onAddToCart: widget.onAddToCart,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryFilters() {
    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ..._categories.map(
            (category) => Padding(
              padding: const EdgeInsets.only(right: Spacing.sm),
              child: ChoiceChip(
                label: Text(category),
                selected: _selectedCategory == category,
                onSelected: (_) {
                  setState(() {
                    _selectedCategory = category;
                  });
                  _applyFilters();
                },
              ),
            ),
          ),
          FilterChip(
            label: const Text('In Stock'),
            selected: _inStockOnly,
            onSelected: (selected) {
              setState(() {
                _inStockOnly = selected;
              });
              _applyFilters();
            },
          ),
        ],
      ),
    );
  }
}
