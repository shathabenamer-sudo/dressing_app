import 'package:flutter/material.dart';
import 'category_screen.dart';

class ClosetScreen extends StatelessWidget {
  const ClosetScreen({super.key});

  final List<String> categories = const [
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
          return Card(
            child: InkWell(
              onTap: () {
                Navigator.push( 
                  context,
                  MaterialPageRoute(  builder: (context) => CategoryScreen(categoryName: categories[index]),),
                );
              },
              child: Center(child: Text(categories[index])),
            ),
          );
        },
      ),
    );
  }
}
