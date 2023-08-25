import 'package:hive/hive.dart';
class ToDoDatabase {
  List todoitems = [];

//Reference the box
  final  box = Hive.box('My box');

  //run this method if user is opening app for the first time ever
  void createInitialData() {
    todoitems = [
      [
        'Make dinner',
        false
      ],
      [
        'Soccer Practice',
        false
      ]
    ];
  }

  //load dada from database
  void loadData() {
    todoitems = box.get("TODOLIST");

  }
  
  //update the databse
  void updateDataBase() {
    box.put("TODOLIST", todoitems);
  }
}
