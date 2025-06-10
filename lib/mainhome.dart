



import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:intl/intl.dart';
import 'package:money_management/addtransaction.dart';




class mainhome extends StatefulWidget {
  const mainhome({super.key});

  @override
  State<mainhome> createState() => _mainhomeState();
}

class _mainhomeState extends State<mainhome> {
 
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    refresh();
  }


  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
      
      floatingActionButton: FloatingActionButton(onPressed: (){
        print('home');
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
          return Addtransaction(function:createitem);
        }));
      },child: Icon(Icons.add),),
      appBar: AppBar(
        title: Text('Money Manager'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 188, 128, 199),
      ),
      body:
      
      // ValueListenableBuilder(valueListenable: itemstransaction,
      //  builder:(BuildContext context, List<Map<String, dynamic>>newitem, Widget?_){
          ListView.separated(padding: EdgeInsets.all(10),
       
        itemBuilder: (ctx,index){
          
          refresh();
          final current=itemstransaction[index];
        return  Card(
          child: ListTile(contentPadding: EdgeInsets.all(10),
          tileColor: Colors.grey.shade200,
            title:Text(current['purpose']),
            subtitle: Text(current['amount']),
            leading: CircleAvatar(
              backgroundColor:current['type']==1?Colors.green:Colors.red ,
              child:Text( date(current['date'])),radius: 60,),
            trailing: IconButton(onPressed: (){
             find(index);
             
            }, icon: Icon(Icons.delete)),
          ),
        );
      },
       separatorBuilder:(ctx,index){
          return Divider(thickness: 0,
          height: 30,);
       }, 
       itemCount: itemstransaction.length)
       );
       
    
  }

  String date(DateTime datetime){
   final _date= DateFormat.MMMd().format(datetime);
    final split=_date.split(' ');
    return '${split.last}\n${split.first}';
   // return '${datetime.day}\n${datetime.month}'.toString();
  }

  
  Future<void> createitem(Map<String,dynamic> newitem)async{
  await mbox.add(newitem);
  //refresh();
  final data=mbox.keys.map((Key){
    final item=mbox.get(Key);
    return {"key":Key,"purpose":item['purpose'],"amount":item['amount'],"date":item['date'],"type":item['type']};
  }).toList();

  setState(() {
    itemstransaction=data. toList();
    // itemstransaction.value.add(data as Map<String, dynamic>);
    // ValueNotifier(itemstransaction);
    
  });
}
void refresh()async{
  final data=await mbox.keys.map((Key){
    final item=mbox.get(Key);
    return {"key":Key,"purpose":item['purpose'],"amount":item['amount'],"date":item['date'],"type":item['type']};
  }).toList();

  setState(() {
    itemstransaction=data.reversed. toList();
    
    
  });
}

void find(int index1){
     setState(() {
               mbox.deleteAt(index1 );
               itemstransaction. removeAt(index1);
               refresh();
           // show();
            });
  }

}