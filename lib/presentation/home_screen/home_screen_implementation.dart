import 'package:flutter/material.dart';

import 'widgets/category_grid_list.dart';

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
