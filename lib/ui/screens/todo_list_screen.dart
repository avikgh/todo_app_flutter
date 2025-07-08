import 'package:flutter/material.dart';
import 'package:todo_app/ui/screens/add_new_todo_screen.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Todo List',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
            child: ListTile(
              title: Text(
                'Title',
                style: TextStyle(decoration: _buildTitleDecoration(false)),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text('Description'), Text('Time')],
              ),
              trailing: _buildRoundedIconButton(),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddNewTodoScreen()));
        },
        tooltip: 'Add new todo',
        label: Text('Add'),
        icon: Icon(Icons.add),
      ),
    );
  }

  Widget _buildRoundedIconButton() {
    return CircleAvatar(
      child: _buildIcon(true),
    );
  }

  Icon _buildIcon(bool isDone) {
    return isDone ? Icon(Icons.check) : Icon(Icons.clear);
  }

  TextDecoration? _buildTitleDecoration(bool isDone) {
    return isDone ? TextDecoration.lineThrough : null;
  }
}
