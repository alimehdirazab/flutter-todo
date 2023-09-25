import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/data/database.dart';
import 'package:to_do_app/util/dailog_box.dart';
import 'package:to_do_app/util/to_do_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //refrence the hive box
  final _mybox = Hive.box('mybox');
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    // if this is the 1st time ever openin the app, then create default data
    if (_mybox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  final _controller = TextEditingController();

  //check box clicked
  void checkboxchange(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateData();
  }

  // on save button click
  void saveData() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  // create New Task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return dailogBox(
          controller: _controller,
          onSave: saveData,
          onCacel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  //delete Task
  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 201, 218, 248),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(136, 48, 137, 189),
          title: const Text(
            'TO DO',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: db.todoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              text: db.todoList[index][0],
              taskCompleted: db.todoList[index][1],
              onChanged: (value) => checkboxchange(value, index),
              deleteFunction: (context) => deleteTask(index),
            );
          },
        ));
  }
}
