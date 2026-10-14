import 'package:flutter/material.dart';
import 'package:ministore_pro/contants/radii.dart';
import 'package:ministore_pro/contants/spacing.dart';
import 'package:ministore_pro/models/product.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product Details',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        insetPadding: EdgeInsets.zero,
                        child: InteractiveViewer(
                          panEnabled: true,
                          minScale: 1,
                          maxScale: 3,
                          boundaryMargin: EdgeInsets.zero,
                          child: Image.network(
                            widget.product.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Image.network(
                  widget.product.image,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(Spacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.category,
                      style: theme.textTheme.labelMedium,
                    ),
                    SizedBox(height: Spacing.sm),
                    Text(
                      widget.product.title,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: Spacing.sm),
                    Text(
                      widget.product.shortDescription,
                      style: theme.textTheme.bodyMedium,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: Spacing.md,
                        bottom: Spacing.sm,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${widget.product.price.toStringAsFixed(2)}',
                            style: theme.textTheme.headlineLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.star, size: 20, color: Colors.orange),
                              SizedBox(width: Spacing.xs),
                              Text(
                                widget.product.rating.toStringAsFixed(1),
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Text(
                      widget.product.inStock ? 'In Stock' : 'Out of Stock',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: widget.product.inStock
                            ? Colors.green
                            : theme.colorScheme.error,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: Spacing.md),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(Spacing.md),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surfaceContainer,
                          borderRadius: BorderRadius.circular(Radii.md),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Description',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: Spacing.xs),
                            Text(widget.product.detailedDescription),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Spacing.md),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: SizedBox(
                  height: 60,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.orange.shade900,
                    ),
                    onPressed: widget.product.inStock
                        ? () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Cart Functionality Coming Soon'),
                              ),
                            );
                          }
                        : null,
                    child: const Text('Buy Now'),
                  ),
                ),
              ),
              SizedBox(width: Spacing.sm),
              IconButton.filled(
                style: IconButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.all(Spacing.md),
                ),
                onPressed: widget.product.inStock
                    ? () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Cart Functionality Coming Soon'),
                          ),
                        );
                      }
                    : null,
                icon: Icon(Icons.shopping_cart),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
