import 'package:flutter/material.dart';
import 'package:ministore_pro/contants/radii.dart';
import 'package:ministore_pro/contants/spacing.dart';
import 'package:ministore_pro/models/product.dart';

class CartScreen extends StatefulWidget {
  final Map<Product, int> cart;
  final void Function(Product product) onIncrease;
  final void Function(Product product) onDecrease;
  final double total;
  const CartScreen({
    super.key,
    required this.cart,
    required this.onIncrease,
    required this.onDecrease,
    required this.total,
  });

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
          child: Column(
            children: [
              Expanded(
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
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () => widget.onDecrease(product),
                                    icon: const Icon(
                                      Icons.remove_circle_outline,
                                    ),
                                  ),
                                  Text('$quantity'),
                                  IconButton(
                                    onPressed: () => widget.onIncrease(product),
                                    icon: const Icon(Icons.add_circle_outline),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
              SizedBox(height: Spacing.md),
              Container(
                padding: const EdgeInsets.all(Spacing.md),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(Radii.md),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '\$${widget.total.toStringAsFixed(2)}',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    if (widget.total > 1) SizedBox(height: Spacing.md),
                    if (widget.total > 1)
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: () {},
                          child: const Text('Checkout'),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
