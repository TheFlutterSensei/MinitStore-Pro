import 'package:flutter/material.dart';
import 'package:ministore_pro/contants/spacing.dart';
import 'package:ministore_pro/data/products.dart';
import 'package:ministore_pro/widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(Spacing.md),
              child: TextField(controller: _searchController),
            ),
            Expanded(
              child: products.isEmpty
                  ? const Center(child: Text('No Products Available'))
                  : GridView.builder(
                      padding: const EdgeInsets.all(Spacing.md),
                      itemCount: products.length,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        childAspectRatio: 0.6,
                        maxCrossAxisExtent: 250,
                        mainAxisSpacing: Spacing.md,
                        crossAxisSpacing: Spacing.md,
                      ),
                      itemBuilder: (context, index) {
                        return ProductCard(product: products[index]);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
