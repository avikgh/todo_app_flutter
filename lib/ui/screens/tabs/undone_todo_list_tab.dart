import 'package:flutter/material.dart';

import '../../../entities/todo.dart';
import '../../widgets/todo_item.dart';

class UndoneTodoListTab extends StatelessWidget {
  const UndoneTodoListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Dismissible(
          key: UniqueKey(),
          child: TodoItem(
            todo: Todo(
              'Title will be here',
              'Description will be here',
              DateTime.now(),
            ),
            onTapStatusChangeButton: () {

            },
          ),
        );
      },
    );
  }
}
