import 'package:flutter/material.dart';
import 'add_new_clothes_screen.dart';

class CategoryScreen extends StatelessWidget {
  final String categoryName;

  const CategoryScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //basic structure of the screen
      appBar: AppBar(title: Text(categoryName)),
      body: Center(child: Text('No clothes added yet')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         Navigator.push(context, MaterialPageRoute(builder:(context)=>AddNewClothesScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
