import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Widget Flutter', home: const ProfileCardPage());
  }
}

class ProfileCardPage extends StatefulWidget {
  const ProfileCardPage({super.key});
  @override
  State<ProfileCardPage> createState() => _ProfileCardPageState();
}

class _ProfileCardPageState extends State<ProfileCardPage> {
  bool isFavorite = false;
  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kartu Profil Siswa')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Container(
                width: 300,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.teal.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text("revantyo@gmail.com Absen 30"),
                        Container(
                          child: Icon(
                            Icons.person,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Revantyo',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text('Siswa Kelas XI RPL'),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: toggleFavorite,
                                child: Text(
                                  isFavorite ? 'Favorit' : 'TambahFavorit',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: const Color.fromARGB(255, 244, 54, 82),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Container(
                width: 300,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.teal.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text("revantyo@gmail.com Absen 30"),
                        Container(
                          child: Icon(
                            Icons.person,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Revantyo',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text('Siswa Kelas XI RPL'),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: toggleFavorite,
                                child: Text(
                                  isFavorite ? 'Favorit' : 'TambahFavorit',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: const Color.fromARGB(255, 244, 54, 82),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
