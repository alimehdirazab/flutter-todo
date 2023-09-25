import 'package:hive/hive.dart';

class ToDoDatabase {
  List todoList = [];

  //refrence box
  final _mybox = Hive.box('mybox');

  // run this method if this is the 1st time ever opening this app
  void createInitialData() {
    todoList = [
      ['Welcome to To do App', false]
    ];
  }

  // run this method if this is the 1st time ever opening this app
  void loadData() {
    todoList = _mybox.get("TODOLIST");
  }

  // update the database
  void updateData() {
    _mybox.put("TODOLIST", todoList);
  }
}
