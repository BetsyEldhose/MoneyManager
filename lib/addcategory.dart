

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:money_management/db/categorymodel.dart';


//  enum newitem{
//     name,
//     id,
//   }

 List<Map<String,dynamic>> items=[];
 List<Map<String,dynamic>> items1=[];
final box=Hive.box('db_box');
final box1=Hive.box('Box');
class Addcategory extends StatefulWidget {
  final Function call;
  final Function call1;
   Addcategory({required this.call,required this.call1});
   

  @override
  State<Addcategory> createState() => _AddcategoryState(call:call,call1:call1);
}

class _AddcategoryState extends State<Addcategory> {
  final Function call;
  final Function call1;
  _AddcategoryState({required this.call,required this.call1});
    
  
  final control2=TextEditingController();
  int selectedvalue=0;
  String? selecttype;
  
  
  category? obj;
 


 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(child: Column(
        children: [
          Text('add category'),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              controller: control2,
              decoration: InputDecoration(border: OutlineInputBorder(),
              hintText: 'category'),
            ),
          ),
          Row(
            children: [
              Radio(value:1, groupValue: selectedvalue, onChanged: (value){
                if(value==null){
                  return;
                }
                setState(() {
                  selectedvalue=value;
                });
                
              }, ),
              Text('income'),
              Radio(value: 2, groupValue: selectedvalue, onChanged: (value){
                if(value==null){
                  return;
                }
                setState(() {
                  selectedvalue=value ;
                });
                
              }, ),
              Text('expense')
            ],
          ),
          TextButton(onPressed: (){
            if(selectedvalue==1){
           
            call({"name":control2.text,"id":selectedvalue});
            Navigator.of(context).pop();
            }
            else {
              call1({"name":control2.text,"id":selectedvalue});
              Navigator.of(context).pop();
            }
            
          //  var data=control2.text;
          //  if(selectedvalue==1){
          //  selecttype='income';
          //  obj= category(name: data, id: selectedvalue.toString(), type: categorytype.income);
          //  }
          //  else{
          //   selecttype='expense';
          //   obj= category(name: data, id: selectedvalue.toString(), type: categorytype.expense);
          //  }
          //  categorymain().insertcategory(obj!);
           
          }, 
          child: Text('submit')),
          
        ],
      )),
    );
  }
}