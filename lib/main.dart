
import 'package:flutter/material.dart';
import 'wishlist_screen.dart';
import 'profile_screen.dart';

void main() {
  runApp(const EcommerceApp());
}

const orange = Color(0xFFFF6900);

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: orange),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}

// SCREEN 1: WELCOME

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: orange,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Icon(
              Icons.shopping_cart,
              size: 110,
              color: Colors.white,
            ),
            const SizedBox(height: 20),
            const Text(
              'E-COMMERCE',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 2,
              ),
            ),
            const Text(
              'Everything you need, in one place!',
              style: TextStyle(color: Colors.white),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(30),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: orange,
                    padding: const EdgeInsets.all(15),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const LoginScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Welcome',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// SCREEN 2: LOGIN / SIGN UP

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              const SizedBox(height: 45),
              const Icon(
                Icons.shopping_bag,
                color: orange,
                size: 65,
              ),
              const SizedBox(height: 15),
              const Text(
                'Welcome Back!',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text('Continue to shopping'),
              const SizedBox(height: 35),
              const TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  hintText: 'Email / Phone',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 18),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline),
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(color: orange),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: orangeButton(),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const HomeScreen(),
                      ),
                    );
                  },
                  child: const Text('Log In'),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Sign up feature coming soon'),
                      ),
                    );
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(color: orange),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Or connect with'),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialIcon(icon: Icons.facebook),
                  SizedBox(width: 25),
                  SocialIcon(icon: Icons.g_mobiledata),
                  SizedBox(width: 25),
                  SocialIcon(icon: Icons.apple),
                ],
              ),
              const SizedBox(height: 25),
              const Text("Don't have an account? Sign Up"),
            ],
          ),
        ),
      ),
    );
  }
}

class SocialIcon extends StatelessWidget {
  final IconData icon;

  const SocialIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, size: 30),
    );
  }
}

// SAMPLE PRODUCTS

class Product {
  final String name;
  final String price;
  final String image;
  final double rating;

  const Product({
    required this.name,
    required this.price,
    required this.image,
    this.rating = 4.5,
  });
}

const products = [
  Product(
    name: 'Smart Watch',
    price: '4500',
    image:
    'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=500',
  ),
  Product(
    name: 'Wireless Headphones',
    price: '2800',
    image:
    'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=500',
  ),
  Product(
    name: 'Running Shoes',
    price: '3500',
    image:
    'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500',
  ),
  Product(
    name: 'Travel Backpack',
    price: '2200',
    image:
    'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=500',
  ),
];

final List<Product> cartItems = [products[0], products[1]];

ButtonStyle orangeButton() {
  return ElevatedButton.styleFrom(
    backgroundColor: orange,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(vertical: 15),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}

// SCREEN 3: MY CART

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final Map<Product, int> quantities = {};

  @override
  void initState() {
    super.initState();
    for (final product in cartItems) {
      quantities[product] = quantities[product] == null
          ? 1
          : quantities[product]! + 1;
    }
  }

  int get total {
    int amount = 0;
    quantities.forEach((product, quantity) {
      amount += int.parse(product.price) * quantity;
    });
    return amount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Cart')),
      body: Column(
        children: [
          Expanded(
            child: quantities.isEmpty
                ? const Center(child: Text('Your cart is empty'))
                : ListView(
              padding: const EdgeInsets.all(15),
              children: quantities.keys.map((product) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        ProductImage(
                          url: product.image,
                          size: 85,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text('Rs. ${product.price}'),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (quantities[product]! > 1) {
                                          quantities[product] =
                                              quantities[product]! - 1;
                                        } else {
                                          quantities.remove(product);
                                        }
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.remove_circle_outline,
                                    ),
                                  ),
                                  Text(
                                    '${quantities[product] ?? 0}',
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        quantities[product] =
                                            (quantities[product] ?? 0) + 1;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.add_circle_outline,
                                      color: orange,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey.shade300),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Rs. $total',
                      style: const TextStyle(
                        color: orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: orangeButton(),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const CheckoutScreen(),
                        ),
                      );
                    },
                    child: const Text('Checkout'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// SCREEN 4: HOME

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hello Daraz',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),

        actions: [
          // Wishlist button
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const WishlistScreen(),
                ),
              );
            },
          ),

          // Profile button
          IconButton(
            icon: const Icon(Icons.person_outline),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ProfileScreen(),
                ),
              );
            },
          ),

          // Existing cart button
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const CartScreen(),
                ),
              );
            },
          ),
        ],

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search products...',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 130,
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: orange,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SPECIAL OFFER',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Up to 50% OFF',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              const Text(
                'Top Categories',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CategoryItem(
                    icon: Icons.watch,
                    name: 'Watches',
                  ),
                  CategoryItem(
                    icon: Icons.headphones,
                    name: 'Audio',
                  ),
                  CategoryItem(
                    icon: Icons.checkroom,
                    name: 'Fashion',
                  ),
                  CategoryItem(
                    icon: Icons.shopping_bag,
                    name: 'Bags',
                  ),
                ],
              ),
              const SizedBox(height: 25),
              const Text(
                'Popular Products',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.70,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProductDetailsScreen(
                            product: product,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: double.infinity,
                              child: ProductImage(
                                url: product.image,
                                size: double.infinity,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Rs. ${product.price}',
                                  style: const TextStyle(
                                    color: orange,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                    Text(' 4.5'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String name;

  const CategoryItem({
    super.key,
    required this.icon,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 27,
          backgroundColor: const Color(0xFFFFE8D9),
          child: Icon(icon, color: orange, size: 27),
        ),
        const SizedBox(height: 7),
        Text(name, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

// SCREEN 5: PRODUCT DETAILS

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),

        actions: [
          // Add to Wishlist
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              if (!wishlistItems.contains(product)) {
                wishlistItems.add(product);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Added to Wishlist!'),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Already in Wishlist!'),
                  ),
                );
              }
            },
          ),

          // Existing Cart button
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const CartScreen(),
                ),
              );
            },
          ),
        ],

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Center(
              child: ProductImage(
                url: product.image,
                size: double.infinity,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      Text(' ${product.rating}'),
                      const Spacer(),
                      const Text(
                        'Available in stock',
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Rs. ${product.price}',
                    style: const TextStyle(
                      fontSize: 24,
                      color: orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'About',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'A stylish and quality product for your everyday needs.',
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: orangeButton(),
                          onPressed: () {
                            if (!cartItems.contains(product)) {
                              cartItems.add(product);
                            }
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Product added to cart!'),
                              ),
                            );
                          },
                          child: const Text('Add to Cart'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// REUSABLE PRODUCT IMAGE

class ProductImage extends StatelessWidget {
  final String url;
  final double size;

  const ProductImage({
    super.key,
    required this.url,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      width: size,
      height: size,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: size,
          height: size,
          color: Colors.grey.shade100,
          child: const Icon(
            Icons.shopping_bag_outlined,
            size: 60,
            color: orange,
          ),
        );
      },
    );
  }
}

// SIMPLE CHECKOUT DESTINATION FOR THE CART BUTTON

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_outline,
              size: 80,
              color: orange,
            ),
            const SizedBox(height: 15),
            const Text(
              'Checkout Screen',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text('Connect your address and payment here.'),
            const SizedBox(height: 20),
            ElevatedButton(
              style: orangeButton(),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
