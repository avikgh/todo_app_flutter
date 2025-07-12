import 'package:flutter/material.dart';
import 'package:todo_app/entities/todo.dart';
import 'package:todo_app/ui/screens/add_new_todo_screen.dart';
import 'package:todo_app/ui/screens/tabs/all_todo_list_tab.dart';
import 'package:todo_app/ui/screens/tabs/done_todo_list_tab.dart';
import 'package:todo_app/ui/screens/tabs/undone_todo_list_tab.dart';

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
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Todo List',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
          bottom: TabBar(
            indicatorAnimation: TabIndicatorAnimation.elastic,
            indicatorColor: Color(0xFF0EC7B7),
            tabs: [
              Text(
                'All',
                style: TextStyle(color: Color(0xFF0EC7B7), fontSize: 15),
              ),
              Text(
                'Pending',
                style: TextStyle(color: Colors.red, fontSize: 15),
              ),
              Text(
                'Done',
                style: TextStyle(color: Colors.green, fontSize: 15,),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            AllTodoListTab(
              todoList: _todoList,
              onDeleteTodo: _deleteTodo,
              onChangeStatus: _changeStatus,
            ),
            UndoneTodoListTab(
              todoList: _todoList.where((item) => item.isDone == false).toList(),
              onDeleteTodo: _deleteTodo,
              onStatusChange: _changeStatus,
            ),
            DoneTodoListTab(
              todoList: _todoList.where((item) => item.isDone == true).toList(),
              onDeleteTodo: _deleteTodo,
              onStatusChange: _changeStatus,
            ),
          ],
        ),
        floatingActionButton: _buildFloatingActionButton(context)
      )
    );
  }

  FloatingActionButton _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddNewTodoScreen(
                    onAddNewTodo: _addNewTodo
                  )
              )
          );
        },
        tooltip: 'Add new todo',
        label: Text('Add'),
        icon: Icon(Icons.add),
      );
  }

  void _addNewTodo(Todo todo) {
    _todoList.add(todo);
    if (mounted) {
      setState(() {});
    }
  }

  void _deleteTodo(int index) {
    _todoList.removeAt(index);
    if (mounted) {
      setState(() {});
    }
  }

  void _changeStatus(int index) {
    _todoList[index].isDone = !(_todoList[index].isDone);
    if (mounted) {
      setState(() {});
    }
  }
}