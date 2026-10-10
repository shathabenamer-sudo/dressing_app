import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class AddNewClothesScreen extends StatefulWidget {
  const AddNewClothesScreen({super.key});

  @override
  State<AddNewClothesScreen> createState() => _AddNewClothesScreenState();
}

class _AddNewClothesScreenState extends State<AddNewClothesScreen> {
  // This will store the picture chosen by the user.
  XFile? _image;

  String _color = '';
  String? _style;
  String? _season;

  // This function opens the gallery.
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    // Check if the user actually chose a picture.
    if (image != null) {
      setState(() {
        _image = image;
      });
    }
  }

  Future<String?> _saveImage() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    final fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';

    final savedImage = await File(_image!.path).copy('$path/$fileName');
    return savedImage.path;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Clothes')),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // PHOTO BOX
            GestureDetector(
              onTap: _pickImage,

              child: Container(
                height: 250,
                width: double.infinity,

                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(12),
                ),

                child: _image == null
                    ? const Center(child: Icon(Icons.add_a_photo, size: 50))
                    : Image.file(File(_image!.path), fit: BoxFit.cover),
              ),
            ),

            const SizedBox(height: 20),

            // COLOR
            TextField(
              onChanged: (value) {
                _color = value;
              },
              decoration: const InputDecoration(
                labelText: 'Color',
                hintText: 'Enter the color of the item',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            // STYLE
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Style',
                border: OutlineInputBorder(),
              ),

              items: const [
                DropdownMenuItem(value: 'Casual', child: Text('Casual')),
                DropdownMenuItem(value: 'Formal', child: Text('Formal')),
                DropdownMenuItem(value: 'Dressy', child: Text('Dressy')),
                DropdownMenuItem(value: 'Party', child: Text('Party')),
              ],

              onChanged: (value) {
                _style = value;
              },
            ),

            const SizedBox(height: 20),

            // SEASON
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Season',
                border: OutlineInputBorder(),
              ),

              items: const [
                DropdownMenuItem(value: 'Spring', child: Text('Spring')),
                DropdownMenuItem(value: 'Summer', child: Text('Summer')),
                DropdownMenuItem(value: 'Autumn', child: Text('Autumn')),
                DropdownMenuItem(value: 'Winter', child: Text('Winter')),
                DropdownMenuItem(
                  value: 'All Seasons',
                  child: Text('All Seasons'),
                ),
              ],

              onChanged: (value) {
                _season = value;
              },
            ),

            //save button
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () async {
                String? imagePath;

                if (_image != null) {
                  imagePath = await _saveImage();
                }

                Navigator.pop(context, {
                  'image': imagePath,
                  'color': _color,
                  'style': _style,
                  'season': _season,
                });
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
