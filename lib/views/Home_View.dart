import 'package:flutter/material.dart';
import '../customs/Widgets.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHight = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(title: Text("Home"),),
      body: Column(
        children: [
          Container(
            height: screenWidth * 0.5,
            width: screenHight * 0.5,
          )
        ],
      ),
    );
  }
}