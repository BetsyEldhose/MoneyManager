import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:money_management/category.dart';
import 'package:money_management/db/categorymodel.dart';

const db_name_category='category_db';
 ValueNotifier<List<category>> noti=ValueNotifier([]);
abstract class categorydb{
 Future< List<category>>getcategories();
 Future <void> insertcategory(category value);
  
  
}
class categorymain implements categorydb{
  
 
  @override
  Future<void> insertcategory(category value)async {
   final catdb=await Hive.openBox<category>(db_name_category);
  await catdb.add(value);
  //print(catdb.values.toString());
  noti.value.add(value);

 // print(catdb.get(value.name));
 // noti.addListener;
 // print(noti.value);
  }
  
  @override
  Future<List<category>> getcategories() async{
    final catdb=await Hive.openBox<category>(db_name_category);
    return catdb.values.toList();
    
  }
  

}