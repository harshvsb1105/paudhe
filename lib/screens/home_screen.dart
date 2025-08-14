import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/plant_provider.dart';
import 'plant_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final plantData = Provider.of<PlantProvider>(context);
    final plants = plantData.plants;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Paudhe'),
      ),
      body: ListView.builder(
        itemCount: plants.length,
        itemBuilder: (ctx, i) => Card(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: ListTile(
            leading: Image.network(
              plants[i].imageUrl,
              width: 60,
              fit: BoxFit.cover,
            ),
            title: Text(plants[i].name),
            subtitle: Text('₹${plants[i].price.toStringAsFixed(2)}'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) =>
                      PlantDetailScreen(plantId: plants[i].id),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}