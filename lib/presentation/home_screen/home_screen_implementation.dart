import 'package:flutter/material.dart';

import 'widgets/category_grid_list.dart';

class Dashboard extends StatefulWidget {
  final String name;
  final String email;
  const Dashboard({Key? key, required this.name, required this.email})
      : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff82591B),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              height: 180,
              width: 320,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/avatar.jpg'),
                    radius: 50,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: 140,
                        child: Center(
                          child: Text(
                            widget.name,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(width: 160, child: Text(widget.email)),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(width: 120, child: const Text('points:')),
                          Text('30')
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(width: 140, child: const Text('skills')),
                      SizedBox(height: 10),
                      Container(
                        height: 5,
                        width: 140,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Expanded(child: CategoryGridList()),
          ],
        ),
      ),
    );
  }
}
