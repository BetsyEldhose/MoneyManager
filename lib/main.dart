import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:money_management/addtransaction.dart';

import 'package:money_management/home.dart';

main()async
{
  WidgetsFlutterBinding.ensureInitialized();
   await Hive.initFlutter();
   await Hive.openBox('db_box');
   await Hive.openBox('Box');
   await  Hive.openBox('mybox');
   //Addtransaction();
   //if(!Hive.isAdapterRegistered(categorytypeAdapter().typeId)){
    //Hive.registerAdapter(categorytypeAdapter());
  // }
  //  if(!Hive.isAdapterRegistered(categoryAdapter().typeId)){
  //   Hive.registerAdapter(categoryAdapter());
  //  }
  runApp(myApp());
}
class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.black),
      home: homepage(),
    );
  }
}