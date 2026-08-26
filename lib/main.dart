import 'package:flutter/material.dart';
import 'package:flutter_application_1/materi_text.dart';

import 'materi_image.dart';

void main() {
  runApp(const MyImage());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Praktikum Bu Amal 1',
      home: const DartDemoPage(),
    );
  }
}

class DartDemoPage extends StatefulWidget {
  const DartDemoPage({super.key});

  @override
  State<DartDemoPage> createState() => _DartDemoPageState();
}

class _DartDemoPageState extends State<DartDemoPage> {
  int angka = 7;
  String? hasilData;
  bool loading = false;
  
  String cekGanjilGenap(int nilai) {
    return nilai % 2 == 0 ? "Even" : "Odd";
  }

  Future<void> fetchData() async {
    setState(() {
      loading = true;
    });
    
    // Simulasi delay
    await Future.delayed(const Duration(seconds: 2));
    
    setState(() {
      loading = false;
      hasilData = "Data berhasil dimuat!";
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Praktikum Bu Amal 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Angka $angka adalah ${cekGanjilGenap(angka)}'),
            const SizedBox(height: 20),
            loading ? const CircularProgressIndicator() : Text(hasilData ?? 'Data Belum Dimuat'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: fetchData,
              child: const Text('Load Data'),
            ),
          ],

        )
      )
    );
  }
}