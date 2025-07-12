import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
    if (todoList.length == 0) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieBuilder.asset(
              'assets/lottie_files/empty.json',
              height: 200,
              width: 200,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Empty List!',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            )
          ],
        ),
      );
    }
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
