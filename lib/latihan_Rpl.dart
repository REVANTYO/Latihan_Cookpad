import 'package:flutter/material.dart';

Future<void> main() async => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cookpad UI',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFAF9F6), // Background agak krem soft
        fontFamily: 'sans-serif',
      ),
      home: const CookpadHomeScreen(),
    );
  }
}

class CookpadHomeScreen extends StatelessWidget {
  const CookpadHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Data dummy untuk Pencarian Populer
    final List<Map<String, String>> popularSearches = [
      {
        'title': 'ayam bakar',
        'imageUrl': 'https://images.unsplash.com/photo-1598515214211-89d3c73ae83b?q=80&w=500',
      },
      {
        'title': 'bolu pisang\nkukus takaran\nsendok',
        'imageUrl': 'https://images.unsplash.com/photo-1603532648955-039310d9ed75?q=80&w=500',
      },
      {
        'title': 'capcay',
        'imageUrl': 'https://images.unsplash.com/photo-1540420773420-3366772f4999?q=80&w=500',
      },
      {
        'title': 'bolu pisang',
        'imageUrl': 'https://images.unsplash.com/photo-1586985289688-ca3cf47d3e6e?q=80&w=500',
      },
      {
        'title': 'soto ayam',
        'imageUrl': 'https://images.unsplash.com/photo-1572656631137-7935297eff55?q=80&w=500',
      },
      {
        'title': 'brownies kukus',
        'imageUrl': 'https://images.unsplash.com/photo-1606313564200-e75d5e30476c?q=80&w=500',
      },
    ];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAlignment.start,
            children: [
              // 1. Header (Logo & Profil/Notifikasi)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      // Icon Logo Cookpad
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.orange.shade800,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.soup_kitchen,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Teks Logo
                      Text(
                        'cookpad',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ],
                  ),
                  // Profil & Notifikasi Badge
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 16,
                          backgroundImage: NetworkImage('https://i.pravatar.cc/100'),
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          constraints: const BoxConstraints(),
                          padding: EdgeInsets.zero,
                          icon: const Icon(Icons.notifications_none_outlined, size: 22),
                          onPressed: () {},
                        ),
                        const SizedBox(width: 4),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // 2. Search Bar
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Ketik bahan-bahan...',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // 3. Banner Campaign (Aneka Gorengan)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF8E7), // Warna krem kemerahan hangat
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.amber.shade200),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.soup_kitchen, size: 16, color: Colors.orange.shade800),
                        const SizedBox(width: 4),
                        const Text(
                          'cookpad',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'ANEKA GORENGAN',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.black,
                        color: Color(0xFFB85D13),
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        '10-16 Agt 2026',
                        style: TextStyle(fontSize: 10, color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      '#CookpadApron2026  #AnekaGorengan',
                      style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Colors.black87),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // 4. Title Section "Pencarian Populer"
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Pencarian Populer',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Diperbarui 04.30',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // 5. Grid View Gambar Resep
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.25,
                ),
                itemCount: popularSearches.length,
                itemBuilder: (context, index) {
                  final item = popularSearches[index];
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: NetworkImage(item['imageUrl']!),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        // Overlay gelap agar teks terbaca jelas
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.1),
                            Colors.black.withOpacity(0.6),
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.all(12),
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        item['title']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          shadows: [
                            Shadow(
                              blurRadius: 4,
                              color: Colors.black,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
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