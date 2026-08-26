import 'package:flutter/material.dart';

void main() => runApp(const MyCookpad());

class MyCookpad extends StatelessWidget {
  const MyCookpad({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(
          255,
          255,
          255,
          255,
        ), // Warna background krem muda khas MyCookpad
        primaryColor: const Color.fromARGB(
          255,
          34,
          242,
          218,
        ), // Warna orange MyCookpad
      ),
      home: const CookpadHomePage(),
    );
  }
}

class CookpadHomePage extends StatelessWidget {
  const CookpadHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //  DATA UTAMA: Daftar 6 menu makanan populer beserta path gambarnya
    final List<Map<String, String>> menuPopuler = [
      {
        'title': 'ayam bakar',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCCzR310If9NCBmHlgKn5LvdqLrsEPU9WdhwBA6xKqOA&s=10',
      },
      {
        'title': 'bolu pisang kukus takaran sendok',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNFzfhUHdT1fI81qc3mfCIH28Su0S7kiN3VnJSwnMWgg&s=10',
      },
      {
        'title': 'capcay',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXOtXonS5Pp03LGDUrJIZ1zN0PK3B92x6_n6aAiJ90Cg&s=10',
      },
      {
        'title': 'bolu pisang',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNwAVo5TFDfKg36BDSn_1Tt9emw9JGqYqmNxmf92AQFA&s=10',
      },
      {
        'title': 'soto ayam',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVVmQsDet2PTE6ZfOmSc-RXYYhTl6SQbDV1H0g22t_zA&s=10',
      },
      {
        'title': 'brownies kukus',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShWvngry289UGApcbhLXU_gkNLuJvzDqE0cvVesAcvmg&s=10',
      },
    ];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. SECTION: Top Bar (Logo, Profile, Notification)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Brand Logo Area
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            color: Color(0xFFF26722),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.restaurant_menu,
                            color: Colors.white,
                            size: 24,
                          ), // Placeholder icon topi koki
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'cookpad',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Color(
                              0xFF4A2306,
                            ), // Warna cokelat teks MyCookpad
                          ),
                        ),
                      ],
                    ),
                    // Profile & Notification Icon Container
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.grey,
                            child: Icon(
                              Icons.person,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            Icons.notifications_none_outlined,
                            color: Colors.grey[600],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // 2. SECTION: Search Bar
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Ketik bahan-bahan...',
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Colors.grey[300]!,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Colors.grey[300]!,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // 3. SECTION: Banner Aneka Gorengan
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: const Image(
                      image: AssetImage('assets/Banner.png'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),

              // 4. SECTION: Judul Pencarian Populer
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Pencarian Populer',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4A2306),
                      ),
                    ),
                    Text(
                      'Diperbarui 04.30',
                      style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                    ),
                  ],
                ),
              ),

              // 5. SECTION: Grid 6 Foto Pencarian Populer
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 Kolom ke samping
                    crossAxisSpacing: 12.0, // Jarak horizontal antar kotak
                    mainAxisSpacing: 12.0, // Jarak vertikal antar kotak
                    childAspectRatio: 1.4, // Rasio bentuk persegi panjang
                  ),
                  itemCount: menuPopuler.length, // Berjumlah 6 item otomatis
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        image: DecorationImage(
                          image: NetworkImage(menuPopuler[index]['image']!),
                          fit: BoxFit
                              .cover, // Memenuhi seluruh kotak tanpa gepeng
                        ),
                      ),
                      child: Container(
                        // Efek gradasi hitam transparan dari atas ke bawah
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              const Color.fromARGB(
                                255,
                                0,
                                0,
                                0,
                              ).withOpacity(0.0),
                              const Color.fromARGB(
                                255,
                                0,
                                0,
                                0,
                              ).withOpacity(0.6),
                            ],
                          ),
                        ),
                        padding: const EdgeInsets.all(12.0),
                        alignment:
                            Alignment.bottomLeft, // Posisi teks di kiri bawah
                        child: Text(
                          menuPopuler[index]['title']!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 24,
              ), // Memberi ruang kosong di paling bawah halaman
            ],
          ),
        ),
      ),
    );
  }
}
