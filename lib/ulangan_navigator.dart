import 'package:flutter/material.dart';

void main() {
  runApp(const TechExpressApp());
}

class TechExpressApp extends StatelessWidget {
  const TechExpressApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TechExpress',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/main': (context) => const MainPage(),
        '/voucher': (context) => const VoucherPage(),
      },
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login - Revantyo'), // Ganti dengan nama Anda
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FlutterLogo(size: 80),
              const SizedBox(height: 24),
              const Text(
                'Selamat datang di TechExpress',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  // Navigator.pushReplacementNamed sesuai instruksi
                  Navigator.pushReplacementNamed(context, '/main');
                },
                child: const Text('Masuk ke Aplikasi'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const KatalogPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Store',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

// Halaman Katalog (Bagian dari No. 2)
class KatalogPage extends StatelessWidget {
  const KatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Contoh data gadget
    final List<Map<String, dynamic>> gadgets = [
      {'nama': 'Iphone30pro', 'harga': '5.000.000'},
      {'nama': 'Laptop Asus ROG', 'harga': '12.000.000'},
      {'nama': 'Jam Tangan ROLEX', 'harga': '1.500.000'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('TechExpress - Katalog'),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: gadgets.length,
        itemBuilder: (context, index) {
          final gadget = gadgets[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: GestureDetector(
              onTap: () {
                // Navigasi push ke DetailPage menggunakan MaterialPageRoute
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      namaGadget: gadget['RVN Galagher']!,
                      hargaGadget: gadget['12.000.000.']!,
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Icon(Icons.phone_android, size: 40, color: Colors.blue),
                    const SizedBox(height: 16, width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          gadget['RVN MYPHONE']!,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text('Rp ${gadget['harga']}'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Halaman Profil (Bagian dari No. 3)
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TechExpress Profile'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.account_circle, size: 100, color: Colors.grey),
              const SizedBox(height: 16),
              const Text(
                'Kode member: [KODE_MEMBER]',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  // pushNamedAndRemoveUntil sesuai instruksi agar kembali ke login & hapus riwayat
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/',
                    (route) => false,
                  );
                },
                child: const Text('Keluar / Logout', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==========================================
// 4. HALAMAN DETAIL GADGET
// ==========================================
class DetailPage extends StatefulWidget {
  final String namaGadget;
  final String namaGadget;

  const DetailPage({
    super.key,
    required this.namaGadget,
    required this.namaGadget,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String voucherTerpilih = 'Belum ada voucher dipilih';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Gadget ${widget.namaGadget}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Icon(Icons.devices, size: 120, color: Colors.blueAccent),
            ),
            const SizedBox(height: 24),
            Text(
              'Nama : Gadget ${widget.namaGadget}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Harga: Rp ${widget.hargaGadget}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Text(
              'Voucher terpilih -> $voucherTerpilih',
              style: const TextStyle(fontSize: 16, color: Colors.green),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  final result = await Navigator.pushNamed(context, '/voucher');
                  
                  if (result != null) {
                    setState(() {
                      voucherTerpilih = result.toString();
                    });
                  }
                },
                child: const Text('Klaim Voucher Diskon'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 5. HALAMAN PILIH VOUCHER
// ==========================================
class VoucherPage extends StatelessWidget {
  const VoucherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilih Voucher'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: const Icon(Icons.local_offer, color: Colors.orange),
            title: const Text('Diskon 10%'),
            onTap: () {
              Navigator.pop(context, 'Diskon 10%');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.local_offer, color: Colors.orange),
            title: const Text('Diskon 20%'),
            onTap: () {
              Navigator.pop(context, 'Diskon 20%');
            },
          ),
        ],
      ),
    );
  }
}