import 'package:flutter/material.dart';
import 'package:todo_app/entities/todo.dart';
import 'package:todo_app/ui/screens/add_new_todo_screen.dart';
import 'package:todo_app/ui/screens/tabs/all_todo_list_tab.dart';
import 'package:todo_app/ui/screens/tabs/done_todo_list_tab.dart';
import 'package:todo_app/ui/screens/tabs/undone_todo_list_tab.dart';
import 'package:todo_app/ui/widgets/todo_item.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<Todo> _todoList = [];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Todo List',
            style: TextStyle(fontSize: 25),
          ),
          bottom: TabBar(
            tabs: [
              Text('All'),
              Text('Done'),
              Text('Undone')
            ],
          ),
        ),
        body: TabBarView(
          children: [
            AllTodoListTab(),
            DoneTodoListTab(),
            UndoneTodoListTab()
          ],
        ),
        floatingActionButton: _addTodoFABButton(),
      ),
    );
  }
}

class _addTodoFABButton extends StatelessWidget {
  const _addTodoFABButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => AddNewTodoScreen()));
      },
      tooltip: 'Add new todo',
      label: Text('Add'),
      icon: Icon(Icons.add),
    );
  }
}