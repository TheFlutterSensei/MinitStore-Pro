import 'package:flutter/material.dart';
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
            ],
          ),
        ),
      ),
    );
  }
}
