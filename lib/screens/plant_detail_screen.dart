import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/plant_provider.dart';

class PlantDetailScreen extends StatelessWidget {
  final String plantId;

  const PlantDetailScreen({required this.plantId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final plant = Provider.of<PlantProvider>(context, listen: false).findById(plantId);

    return Scaffold(
      appBar: AppBar(
        title: Text(plant.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              plant.imageUrl,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              plant.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              plant.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              '₹${plant.price.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}