import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'add_new_clothes_screen.dart';

class CategoryScreen extends StatefulWidget {
  final String categoryName;

  const CategoryScreen({super.key, required this.categoryName});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Map<String, dynamic>> clothes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.categoryName)),
      body: clothes.isEmpty
          ? const Center(child: Text('No clothes added yet'))
          : GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: clothes.length,
              itemBuilder: (context, index) {
                final XFile image = clothes[index]['image'];

                return Image.file(File(image.path), fit: BoxFit.cover);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newClothes = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNewClothesScreen()),
          );

          if (newClothes != null) {
            setState(() {
              clothes.add(newClothes);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
