import 'package:flutter/material.dart';

import '../widgets/car_card.dart';

class CarListScreen extends StatelessWidget {
  const CarListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> carList = [
      {'name': 'Toyota Avanza', 'status': 'Tersedia'},
      {'name': 'Honda Brio', 'status': 'Disewa'},
      {'name': 'Daihatsu Xenia', 'status': 'Tersedia'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Mobil Rental')),
      body: ListView.builder(
        itemCount: carList.length,
        itemBuilder: (context, index) {
          final car = carList[index];
          return CarCard(
            carName: car['name']!,
            carStatus: car['status']!,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Anda memilih ${car['name']}')),
              );
            },
          );
        },
      ),
    );
  }
}
