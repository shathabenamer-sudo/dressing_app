import 'package:flutter/material.dart';

class AddNewClothesScreen extends StatelessWidget {
  const AddNewClothesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Clothes')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(child: Icon(Icons.add_a_photo, size: 50)),
            ),

            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Color',
                hintText: 'Enter the color of the item',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Style',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: 'Casual', child: Text('Casual')),
                DropdownMenuItem(value: 'Formal', child: Text('Formal')),
                DropdownMenuItem(value: 'Dressy', child: Text('Dressy')),
                DropdownMenuItem(value: 'Party', child: Text('Party')),
              ],
              onChanged: (value) {},
            ),

            const SizedBox(height: 20),

            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Season',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: 'Spring', child: Text('Spring')),
                DropdownMenuItem(value: 'Summer', child: Text('Summer')),
                DropdownMenuItem(value: 'Autumn', child: Text('Autumn')),
                DropdownMenuItem(value: 'Winter', child: Text('Winter')),
                DropdownMenuItem(value: 'All Seasons', child: Text('All Seasons')),

              ],
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
