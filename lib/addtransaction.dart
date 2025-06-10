
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:money_management/addcategory.dart';
import 'package:money_management/mainhome.dart';


List<Map<String,dynamic>> itemstransaction=[];
final mbox=Hive.box('mybox');
class Addtransaction extends StatefulWidget {
 final Function function;
Addtransaction({ required this.function});
  @override
  State<Addtransaction> createState() => _AddtransactionState(functioncall:function);
  
}




class _AddtransactionState extends State<Addtransaction> {
  final Function functioncall;
  _AddtransactionState({required this.functioncall});
  // _AddtransactionState(){
  //   initState(){
  //   refresh();
  //   }
  // }
  // static _AddtransactionState instance=_AddtransactionState();
  // factory _AddtransactionState(){
  //   return instance;
  // }
  final control=TextEditingController();
  String? valuein;
  
  final control1=TextEditingController();
  var selectdate;

    int selected=0;




// Future<void> createitem(Map<String,dynamic> newitem)async{
//   await mbox.add(newitem);
//   //refresh();
//   final data=mbox.keys.map((Key){
//     final item=mbox.get(Key);
//     return {"key":Key,"purpose":item['purpose'],"amount":item['amount'],"date":item['date'],"type":item['type']};
//   }).toList();

//   setState(() {
//     itemstransaction=data.reversed.toList();
//     // itemstransaction.value.add(data as Map<String, dynamic>);
//     // ValueNotifier(itemstransaction);
    
//   });
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
       body: SafeArea(child:
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            
            child: TextFormField(
              keyboardType: TextInputType.text,
              controller: control,
              decoration: InputDecoration(border: OutlineInputBorder(),
              hintText: 'purpose'), 
              
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: control1,
              decoration: InputDecoration(border: OutlineInputBorder(),
              hintText: 'amount'),
            ),
          ),
          TextButton.icon(onPressed: ()async{
            selectdate=await
            showDatePicker(context: context,
             firstDate: DateTime.now().subtract(Duration(days: 30)), 
             lastDate: DateTime.now(),);
          }, label: Text('select date'),icon: Icon(Icons.calendar_today),
          ),
          Row(
            children: [
              Radio(value:1, groupValue: selected, onChanged: (value){
                if(value==null){
                  return;
                }
                setState(() {
                  selected=value;
                  valuein=null;
                });
                
              }, ),
              Text('income'),
              Radio(value: 2, groupValue: selected, onChanged: (value){
                if(value==null){
                  return;
                }
                setState(() {
                  selected=value ;
                  valuein=null;
                });
                
              }, ),
              Text('expense')
            ],
          ),
         
          DropdownButton(hint: const Text('select type'),
          value: valuein,
            items: (selected==1?
            box.keys.map((Key){
            
            final items=box.get(Key);
            
                return DropdownMenuItem<String>(child: Text(items['name']),value: Key.toString(),);
            
           })
          .toList()
          :box1.keys.map((Key){
            
            final items=box1.get(Key);
            
                return DropdownMenuItem<String>(child: Text(items['name']),value: Key.toString(),);
            
           })
          .toList())
          , onChanged: (String? newvalue){
            setState(() {
            valuein=newvalue;
            });
          }),
          ElevatedButton(onPressed: (){
            
            functioncall({"purpose":control.text,"amount":control1.text,
            "date":selectdate,"type":selected});
            Navigator.of(context).pop();
            
          }, child: Text('submit'))
        ],
      )
      
      ),
    );
  }
 
}