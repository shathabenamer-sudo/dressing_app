import 'package:flutter/material.dart';

class ClosetScreen extends StatelessWidget {
  const ClosetScreen({super.key});

  final List<String> categories = [
    'Hijabs',
    'Undershirts',
    'Shirts',
    'Pants',
    'Skirts',
    'Dresses',
    'Jackets',
    'Shoes',
    'Bags',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Closet')),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Card(child: Center(child: Text(categories[index])));
        },
      ),
    );
  }
}
