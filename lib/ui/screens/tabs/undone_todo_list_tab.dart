import 'package:flutter/material.dart';

import '../../../entities/todo.dart';
import '../../widgets/todo_item.dart';

class UndoneTodoListTab extends StatelessWidget {
  const UndoneTodoListTab(
      {super.key,
      required this.todoList,
      required this.onDeleteTodo,
      required this.onStatusChange});

  final List<Todo> todoList;
  final Function(int) onDeleteTodo;
  final Function(int) onStatusChange;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todoList.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: UniqueKey(),
          onDismissed: (_) {
            onDeleteTodo(index);
          },
          child: TodoItem(
            todo: todoList[index],
            onTapStatusChangeButton: () {
              onStatusChange(index);
            },
          ),
        );
      },
    );
  }
}
