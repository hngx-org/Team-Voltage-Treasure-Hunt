import 'package:flutter/material.dart';

import 'category_grid.dart';

List<String> categories = [
  'Arcade',
  'Adventure',
  'Casual',
  'Fantasy',
  'Action',
  'Conquest',
];

List<String> categoryGifImages = [
  'assets/gif/arcade.gif',
  'assets/gif/adventure.gif',
  'assets/gif/casual.gif',
  'assets/gif/fantasy.gif',
  'assets/gif/action.gif',
  'assets/gif/conquest.gif',
];

class CategoryGridList extends StatelessWidget {
  const CategoryGridList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        return CategoryGrid(
            category: categories[index], imageUrl: categoryGifImages[index]);
      },
      itemCount: categories.length,
    );
  }
}
