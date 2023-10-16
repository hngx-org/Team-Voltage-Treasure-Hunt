import 'package:flutter/material.dart';

class CategoryGrid extends StatelessWidget {
  final String category;
  final String imageUrl;

  const CategoryGrid({super.key, required this.category, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 0),
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imageUrl, // Category GIF image asset
              width: 150,
              height: 120,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8),
            Text(
              category,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
