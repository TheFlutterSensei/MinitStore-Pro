import 'package:flutter/material.dart';
import 'package:ministore_pro/data/products.dart';
import 'package:ministore_pro/screens/main_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadProducts();

  for (final product in products) {
    print(product.title);
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MiniStore pro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
        brightness: Brightness.light,
      ),
      home: const MainScreen(),
    );
  }
}

/**
 * Prompt:
 * 
We are building a Flutter e-commerce app called MiniStore Pro.

Create a reusable ProductCard widget in:

lib/widgets/product_card.dart

Use the existing Product model from:

lib/models/product.dart

The ProductCard should:

- Accept a Product object.
- Use a rounded Card with rounded corners.
- Display the product image using the Product.image URL.
- Display the product title.
- Display the product price at the bottom.
- Use Flutter's default Material typography through Theme.of(context).textTheme.
- Keep the design simple and clean.
- Use existing project constants such as Spacing and Radii where appropriate.
- Do not create a new design system.
- Do not modify any other files.
- Do not add any packages.

Return the complete ProductCard code.
 */
