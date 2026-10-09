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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MiniStore Pro')),
      body: SafeArea(
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
    );
  }
}
