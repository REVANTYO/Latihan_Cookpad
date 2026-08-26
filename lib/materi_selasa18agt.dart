import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
  debugShowCheckedModeBanner: false,
  home: HomePage(),
));

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final foods = const [
    ['ayam bakar', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS849dYGfJ7xT3WHg0McoNPVssaDqW-xc5PtS2o69b5xEeT5_3E_YNo2RF2&s=10'],
    ['bolu pisang kukus', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrLFzQFnhnvBgqFb3uFHojQdPfS9FB0bLiu3VQXBRVcP8TMOlrz-PhJeI&s=10'],
    ['capcay', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeR2Mkt02d8fEJjCIeImVLwcWhkeNQIchRRZUlyhuSQA&s=10'],
    ['bolu pisang', 'https://i0.wp.com/resepkoki.id/wp-content/uploads/2022/06/Resep-Bolu-Coklat-Pisang-Kukus.jpg?fit=450%2C600&ssl=1'],
    ['soto ayam', 'https://o-cdf.oramiland.com/unsafe/cnc-magazine.oramiland.com/parenting/original_images/soto_ayam_bumbu_kuning.jpg'],
    ['brownies kukus', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlYwL8t3tp_lYNiObGEh1XtCfKClhIvE_dgVGouq61qw&s=10'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(25),
          children: [
            const Text('👨‍🍳 cookpad',
                style: TextStyle(fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown)),

            const SizedBox(height: 20),

            TextField(
              decoration: InputDecoration(
                hintText: 'Ketik bahan-bahan...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Container(
              height: 180,
              color: const Color(0xfffff8e5),
              child: const Center(
                child: Text('ANEKA GORENGAN\n10–16 Agt 2026',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange)),
              ),
            ),

            const SizedBox(height: 20),

            const Text('Pencarian Populer',
                style: TextStyle(fontSize: 30,
                    fontWeight: FontWeight.bold)),

            const SizedBox(height: 15),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: foods.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (_, i) => Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    foods[i][1],
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        foods[i][0],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}