
import 'package:flutter/material.dart';
import 'main.dart' show Product, products, cartItems, orange, ProductImage;

final List<Product> wishlistItems = [];

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Wishlist')),
      body: wishlistItems.isEmpty
          ? const Center(child: Text('Your wishlist is empty'))
          : ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: wishlistItems.length,
        itemBuilder: (context, index) {
          final product = wishlistItems[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 15),
            child: ListTile(
              leading: SizedBox(
                width: 65,
                height: 65,
                child: ProductImage(
                  url: product.image,
                  size: 65,
                ),
              ),
              title: Text(product.name),
              subtitle: Text('Rs. ${product.price}'),
              trailing: PopupMenuButton<String>(
                onSelected: (value) {
                  setState(() {
                    if (value == 'cart') {
                      cartItems.add(product);
                    }
                    wishlistItems.remove(product);
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        value == 'cart'
                            ? 'Added to cart!'
                            : 'Removed from wishlist',
                      ),
                    ),
                  );
                },
                itemBuilder: (_) => const [
                  PopupMenuItem(
                    value: 'cart',
                    child: Text('Add to Cart'),
                  ),
                  PopupMenuItem(
                    value: 'remove',
                    child: Text('Remove'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
