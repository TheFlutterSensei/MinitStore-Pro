import 'package:flutter/material.dart';
import 'package:ministore_pro/contants/radii.dart';
import 'package:ministore_pro/contants/spacing.dart';
import 'package:ministore_pro/models/product.dart';

class CartScreen extends StatefulWidget {
  final Map<Product, int> cart;
  const CartScreen({super.key, required this.cart});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Spacing.md),
          child: widget.cart.isEmpty
              ? const Center(child: Text('Your cart is empty.'))
              : ListView.builder(
                  itemCount: widget.cart.length,
                  itemBuilder: (context, index) {
                    final product = widget.cart.keys.elementAt(index);
                    final quantity = widget.cart[product];

                    return Card(
                      elevation: 0,
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(Radii.md),
                        ),
                        tileColor: theme.colorScheme.surfaceContainer,
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(product.image),
                        ),
                        title: Text(
                          product.title,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: theme.textTheme.bodySmall,
                        ),
                        trailing: Text('Qty: $quantity'),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
