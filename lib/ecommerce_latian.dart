import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini E-commerce',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        fontFamily: 'Roboto',
      ),
      home: const FlashSalePage(),
    );
  }
}

class Product {
  final String name;
  final int originalPrice;
  final int discountPrice;
  final int discountPercent;
  final IconData icon;
  bool isWishlisted;

  Product({
    required this.name,
    required this.originalPrice,
    required this.discountPrice,
    required this.discountPercent,
    required this.icon,
    this.isWishlisted = false,
  });
}

class FlashSalePage extends StatefulWidget {
  const FlashSalePage({super.key});

  @override
  State<FlashSalePage> createState() => _FlashSalePageState();
}

class _FlashSalePageState extends State<FlashSalePage> {
  int cartCount = 3;
  Duration remaining = const Duration(hours: 2, minutes: 15, seconds: 40);
  Timer? _timer;

  final List<Product> products = [
    Product(
      name: 'Sepatu Sneaker',
      originalPrice: 150000,
      discountPrice: 75000,
      discountPercent: 50,
      icon: Icons.sports_baseball_outlined,
    ),
    Product(
      name: 'Jam Tangan Digital',
      originalPrice: 300000,
      discountPrice: 210000,
      discountPercent: 30,
      icon: Icons.watch_outlined,
    ),
    Product(
      name: 'Tas Ransel',
      originalPrice: 200000,
      discountPrice: 120000,
      discountPercent: 40,
      icon: Icons.backpack_outlined,
    ),
    Product(
      name: 'Kacamata Hitam',
      originalPrice: 100000,
      discountPrice: 65000,
      discountPercent: 35,
      icon: Icons.remove_red_eye_outlined,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (remaining.inSeconds > 0) {
          remaining = remaining - const Duration(seconds: 1);
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get _formattedTime {
    final h = remaining.inHours.toString().padLeft(2, '0');
    final m = (remaining.inMinutes % 60).toString().padLeft(2, '0');
    final s = (remaining.inSeconds % 60).toString().padLeft(2, '0');
    return '$h:$m:$s';
  }

  String _formatRupiah(int value) {
    final str = value.toString();
    final buffer = StringBuffer();
    for (int i = 0; i < str.length; i++) {
      final posFromRight = str.length - i;
      buffer.write(str[i]);
      if (posFromRight > 1 && posFromRight % 3 == 1) {
        buffer.write('.');
      }
    }
    return 'Rp $buffer';
  }

  void _addToCart(Product product) {
    setState(() {
      cartCount++;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.name} ditambahkan ke keranjang'),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: const Text(
          'Flash Sale',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                IconButton(
                  icon: const Icon(Icons.shopping_cart_outlined),
                  onPressed: () {},
                ),
                if (cartCount > 0)
                  Positioned(
                    right: 4,
                    top: 4,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 18,
                        minHeight: 18,
                      ),
                      child: Text(
                        '$cartCount',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner promo
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFFF4B4B), Color(0xFFFF7A45)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '⚡ FLASH SALE 9.9',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Berakhir dalam $_formattedTime',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.bolt,
                    color: Colors.white,
                    size: 40,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Judul daftar produk
            const Text(
              'Daftar Produk',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            // Grid produk
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.62,
              ),
              itemBuilder: (context, index) {
                final product = products[index];
                return _ProductCard(
                  product: product,
                  formatRupiah: _formatRupiah,
                  onAddToCart: () => _addToCart(product),
                  onToggleWishlist: () {
                    setState(() {
                      product.isWishlisted = !product.isWishlisted;
                    });
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final Product product;
  final String Function(int) formatRupiah;
  final VoidCallback onAddToCart;
  final VoidCallback onToggleWishlist;

  const _ProductCard({
    required this.product,
    required this.formatRupiah,
    required this.onAddToCart,
    required this.onToggleWishlist,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar + badge diskon + wishlist
          Stack(
            children: [
              Container(
                height: 110,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFFF0F0F0),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: Icon(
                  product.icon,
                  size: 48,
                  color: Colors.grey[400],
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    '${product.discountPercent}% OFF',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 4,
                right: 4,
                child: IconButton(
                  icon: Icon(
                    product.isWishlisted
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: product.isWishlisted ? Colors.red : Colors.grey,
                    size: 20,
                  ),
                  onPressed: onToggleWishlist,
                ),
              ),
            ],
          ),

          // Info produk
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  formatRupiah(product.originalPrice),
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                Text(
                  formatRupiah(product.discountPrice),
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const Spacer(),

          // Tombol keranjang
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: onAddToCart,
                icon: const Icon(Icons.add_shopping_cart, size: 16),
                label: const Text(
                  'Keranjang',
                  style: TextStyle(fontSize: 12),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}