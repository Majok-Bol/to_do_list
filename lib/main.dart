import 'package:flutter/material.dart';
void main()=>runApp(MyApp());
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:ToDoList(),
    );
  }
}
class ToDoList extends StatefulWidget{
  @override
  ToDoListState createState()=>ToDoListState();
}
class ToDoListState extends State<ToDoList>{
  //create  list variable to store the list items
  final List<String>itemsToAdd=[];
  //manage text field
final TextEditingController itemController=TextEditingController();
//edit by using index
int?editingIndex;
void addItem(){
  setState(() {
    //check if text field is not empty
    //if yes
    //add item to list
    if(itemController.text.isNotEmpty){
      //check if there is text to edit
      if(editingIndex==null){
        //if not
        //add item to list
        itemsToAdd.add(itemController.text);
      }else{
        //if there is text to edit
        //edit it
        itemsToAdd[editingIndex!]=itemController.text;
      }
      itemController.clear();
    }
  });
}
//function to clear the list
void clearList(){
  setState(() {
    itemsToAdd.clear();
  });
}
//function to edit items
void editItem(index){
//if there is item to edit
//take the list item index of that item
//text input should take that item
//edit it in text input field
//clear the edit index
itemController.text=itemsToAdd[index];
editingIndex=index;
}
@override
  Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(title: Text('To do List',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),centerTitle: true,),
    body: Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: TextField(
                controller: itemController,
                decoration: InputDecoration(border: OutlineInputBorder(),
                hintText: 'Enter item to add'
                ),
              )),
              SizedBox(height: 20,),



            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
             Expanded(child: ElevatedButton(onPressed: addItem, child: Text('Add'))),
              SizedBox(width: 20,),
               Expanded(child: ElevatedButton(onPressed: addItem, child: Text('Delete'))),
            ],
          )

        ],
      ),
    ),
  );
}
}