import 'package:flutter/material.dart';
import 'package:money_management/category.dart';
import 'package:money_management/mainhome.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
int current=0;

final arr=[
  mainhome(),
  category1()
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body:arr[current],

      bottomNavigationBar: 
      
       BottomNavigationBar(
        currentIndex: current,
        onTap: (value) {
          setState(() {
            current=value;
          });
        },
        backgroundColor: Color.fromARGB(255, 188, 128, 199),
        selectedItemColor: Color.fromARGB(255, 3, 90, 166),
        items:[
        BottomNavigationBarItem(icon: Icon(Icons.home),label: 'home'),
        BottomNavigationBarItem(icon: Icon(Icons.category),label: 'category')
      ]),
    );
  }
}