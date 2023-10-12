import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff82591B),
      body: CategoryGridList(),
    );
  }
}

List<String> categories = [
  'Arcade',
  'Adventure',
  'Casual',
  'Fantasy',
  'Action',
  'Conquest',
];

List<String> categoryGifImages = [
  'assets/gif/arcade.gif', // Replace with your GIF image assets
  'assets/gif/adventure.gif',
  'assets/gif/casual.gif',
  'assets/gif/fantasy.gif',
  'assets/gif/action.gif',
  'assets/gif/conquest.gif',
];

class CategoryGridList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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

class CategoryGrid extends StatelessWidget {
  final String category;
  final String imageUrl;

  CategoryGrid({required this.category, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
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
            SizedBox(height: 8),
            Text(
              category,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
