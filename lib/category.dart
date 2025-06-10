

import 'package:flutter/material.dart';
import 'package:money_management/addcategory.dart';


class category1 extends StatefulWidget {
   category1({super.key});

  @override
  State<category1> createState() => _category1State();
}

class _category1State extends State<category1> {
  final control=TextEditingController();
  var selectedvalue;
  int count=0;
  
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    refresh();
    refresh1();
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        
        floatingActionButton: FloatingActionButton(onPressed: (){
           Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return Addcategory(call: createitem,call1: createitem1,);
          }));
          
            // print('category');
            // final obj=category(
            //   id: DateTime.now().microsecondsSinceEpoch.toString(),
            //   name: 'travel',
            //   type: categorytype.expense
            // );
            // categorymain().insertcategory(obj);
        },child: Icon(Icons.add),),
        appBar: AppBar(
          title: Text('Money Manager'),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 188, 128, 199),
          bottom: 
          TabBar(tabs: [Tab(
            text: 'Income',
          ),Tab(text: 'Expense',)],),
        ),
        body: 
        TabBarView(children: [
          find(),
          find1()
        ]),
      ),
    );
  }

  Widget find(){
    return 

          ListView.separated(itemBuilder: (ctx,index){
                final currentitem=items[index];
               // Future<List<category>> catlist= categorymain().getcategories();
          //       final getdata=newlist[index];
          //  Future.forEach(catlist as Iterable<category>,(category catgory){
        
          // if(currentitem['id']==1){
            // count=count+1;
            // print(currentitem['name']);
            
              return
             ListTile(
            title:Text(currentitem['name']) ,
            trailing: IconButton(onPressed: (){
              methodinc(index);
             
            }, icon: const Icon(Icons.delete)),
          );
            
          //}
               // }
              
                },
                 separatorBuilder: (ctx,index){
        return Divider();
                 },
        itemCount: items.length);
      
    
  }

  Widget find1(){
    return Scaffold(
      body:ListView.separated(itemBuilder: (ctx,index1){
          final currentitem1=items1[index1];
          // if(currentitem1['id']==2){
          return
          
           ListTile(
            title:Text(currentitem1['name']) ,
            trailing: IconButton(onPressed: (){
              methodexp(index1);
             
            }, icon: Icon(Icons.delete)),
          );
          //}
      },
       separatorBuilder: (ctx,index){
        return Divider();
       },
        itemCount: items1.length)
    );
  }

 void refresh(){
  final data=box.keys.map((Key){
    final item=box.get(Key);
    return {"key":Key,"name":item['name'],"id":item['id']};
  }).toList();

  setState(() {
    //data.sort((a,b)=>b['key'].compareTo(a['key']));
    items=data. toList();
    
  });
}
 
 void refresh1(){
  final data1=box1.keys.map((Key){
    final item1=box1.get(Key);
    return {"key":Key,"name":item1['name'],"id":item1['id']};
  }).toList();

  setState(() {
  
    items1=data1.toList();
  });
}


 Future< void> createitem(Map<String,dynamic> newitem  )async{
  await box.add(newitem);
  refresh();
  print('items ${box.length}');
  
 }
  Future< void> createitem1(Map<String,dynamic> newitem1  )async{
  await box1.add(newitem1);
  refresh1();
  print('items ${box1.length}');
  
 }

void methodexp(int index){
   setState(() {
  box1.deleteAt(index);
    items1.removeAt(index);
    refresh1();
  });
}
void methodinc(int index){
  setState(() {
  box.deleteAt(index);
    items.removeAt(index);
    refresh();
  });
}
}