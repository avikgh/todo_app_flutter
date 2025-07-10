import 'package:flutter/material.dart';

import '../../../entities/todo.dart';
import '../../widgets/todo_item.dart';

class AllTodoListTab extends StatelessWidget {
  const AllTodoListTab(
      {super.key,
        required this.onDeleteTodo,
        required this.onChangeStatus,
        required this.todoList,});

  final List<Todo> todoList;
  final Function(int) onDeleteTodo;
  final Function(int) onChangeStatus;

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
              onChangeStatus(index);
            },
          ),
        );
      },
    );
  }
}
