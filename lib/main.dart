import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/plant_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const PaudheApp());
}

class PaudheApp extends StatelessWidget {
  const PaudheApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PlantProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Paudhe',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}