import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive_localstorage/widgets/dialogbox.dart';
import 'package:hive_localstorage/widgets/todotile.dart';
import 'package:hive/hive.dart';
import 'database/db.dart';
import 'package:hive_flutter/hive_flutter.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference the hive box
  final _myBox = Hive.openBox('My box');
  final TextEditingController _controller = TextEditingController();
  ToDoDatabase db = ToDoDatabase();
  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      //if user is running app for the first time
      if (_myBox.get("TODOLIST") == null) {
        db.createInitialData(); 
      } else {
        //There is already existing data
        db.loadData();
      }
    }

    void boxisChecked(bool? value, int index) {
      setState(() {
        db.todoitems[index][1] = !db.todoitems[index][1];
      });
    }

    void saveItem() {
      setState(() {
        db.todoitems.add([
          _controller.text,
          false
        ]);
        _controller.clear();
      });
      Navigator.of(context).pop();
      db.updateDataBase();
    }

    void deleteItem(int index) {
      setState(() {
        db.todoitems.removeAt(index);
      });
      db.updateDataBase();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("To DO"),
      ),
      body: SafeArea(
          child: ListView.builder(
              itemCount: db.todoitems.length,
              itemBuilder: ((context, index) {
                return TodoTile(
                    onPressed: (value) => deleteItem,
                    taskCompleted: db.todoitems[index][1],
                    taskName: db.todoitems[index][0],
                    onChanged: (value) {
                      boxisChecked(value, index);
                    });
              }))),
      bottomNavigationBar: FloatingActionButton(
        onPressed: () => DIalogBox(
          oncancel: () => saveItem(),
          onsaved: () => Navigator.of(context).pop(),
          controller: _controller,
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
