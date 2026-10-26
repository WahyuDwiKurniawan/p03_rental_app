import 'package:flutter/material.dart';

class CarCard extends StatelessWidget {
  final String carName;
  final String carStatus;
  final VoidCallback onTap;

  const CarCard({
    super.key,
    required this.carName,
    required this.carStatus,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      child: ListTile(
        leading: const Icon(Icons.directions_car, size: 40, color: Colors.blue),
        title: Text(
          carName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('Status: $carStatus'),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
