import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/plant_provider.dart';

class PlantDetailScreen extends StatelessWidget {
  final String plantId;

  const PlantDetailScreen({Key? key, required this.plantId}) : super(key: key);

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
          children: [
            Image.network(
              plant.imageUrl,
              height: 220,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              plant.name,
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 8),
            Text(
              plant.description,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const SizedBox(height: 12),
            Text(
              '\₹
${plant.price.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}