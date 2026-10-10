import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  void initState() {
    super.initState();
    loadClothes();
  }

  Future<void> loadClothes() async {
    final prefs = await SharedPreferences.getInstance();

    final savedClothes = prefs.getString(widget.categoryName);

    if (savedClothes != null) {
      setState(() {
        clothes = List<Map<String, dynamic>>.from(jsonDecode(savedClothes));
      });
    }
  }

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
                final String imagePath = clothes[index]['image'];

                return Image.file(File(imagePath), fit: BoxFit.cover);
              },
            ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newClothes = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddNewClothesScreen(),
            ),
          );

          if (newClothes != null && newClothes['image'] != null) {
            setState(() {
              clothes.add(newClothes);
            });

            final prefs = await SharedPreferences.getInstance();

            await prefs.setString(widget.categoryName, jsonEncode(clothes));
          }
        },

        child: const Icon(Icons.add),
      ),
    );
  }
}
