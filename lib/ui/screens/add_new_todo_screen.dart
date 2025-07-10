import 'package:flutter/material.dart';
import 'package:todo_app/entities/todo.dart';

class AddNewTodoScreen extends StatefulWidget {
  AddNewTodoScreen({super.key, required this.onAddNewTodo});

  final Function(Todo) onAddNewTodo;

  @override
  State<AddNewTodoScreen> createState() => _AddNewTodoScreenState();
}

class _AddNewTodoScreenState extends State<AddNewTodoScreen> {

  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _descriptionTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Add Todo'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _titleTEController,
                decoration: InputDecoration(label: Text('Title')),
                validator: _isValidate,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _descriptionTEController,
                maxLength: 200,
                decoration: InputDecoration(
                  label: Text('Description'),
                ),
                validator: _isValidate,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Todo todo = Todo(_titleTEController.text.trim(),
                          _descriptionTEController.text.trim(), DateTime.now());
                      widget.onAddNewTodo(todo);
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    'Add New Todo',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String? _isValidate(String? value) {
    if (value!.trim().isEmpty ?? true) {
      return 'Enter a title';
    }
    return null;
  }
}
