import 'package:flutter/material.dart';
import 'package:ministore_pro/contants/form_styles.dart';
import 'package:ministore_pro/contants/spacing.dart';
import 'package:ministore_pro/data/products.dart';
import 'package:ministore_pro/models/product.dart';
import 'package:ministore_pro/widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> _filteredProducts = products;
  final TextEditingController _searchController = TextEditingController();

  void _searchProducts() {
    final query = _searchController.text.trim().toLowerCase();

    setState(() {
      _filteredProducts = products.where((product) {
        return product.title.toLowerCase().contains(query);
      }).toList();
    });
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
                        return ProductCard(product: _filteredProducts[index]);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
