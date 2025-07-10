import 'package:flutter/material.dart';
import 'package:todo_app/entities/todo.dart';

class TodoItem extends StatelessWidget {
  const TodoItem(
      {super.key, required this.todo, required this.onTapStatusChangeButton});

  final Todo todo;
  final Function() onTapStatusChangeButton;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
      // color: Colors.green.shade200,
      surfaceTintColor: _buildSurfaceTintColor(todo.isDone),
      child: ListTile(
        title: Text(
          todo.title,
          style: TextStyle(decoration: _buildTitleDecoration(todo.isDone)),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(todo.description), Text('${todo.time}')],
        ),
        trailing: _buildRoundedIconButton(),
      ),
    );
  }

  TextDecoration? _buildTitleDecoration(bool isDone) {
    return isDone ? TextDecoration.lineThrough : null;
  }

  Widget _buildRoundedIconButton() {
    return GestureDetector(
      onTap: () {
        onTapStatusChangeButton();
      },
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: _buildIcon(todo.isDone),
      ),
    );
  }

  Icon _buildIcon(bool isDone) {
    return isDone
        ? Icon(
            Icons.clear,
            color: Colors.red.shade400,
          )
        : Icon(
            Icons.check,
            color: Colors.green.shade200,
          );
  }

  Color _buildSurfaceTintColor(bool isDone) {
    return isDone ? Colors.green: Colors.red;
  }
}
