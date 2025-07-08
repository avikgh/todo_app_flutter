import 'package:flutter/material.dart';

class AddNewTodoScreen extends StatelessWidget {
  AddNewTodoScreen({super.key});

  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _descriptionTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Todo'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                controller: _titleTEController,
                decoration: InputDecoration(
                  label: Text('Title')
                ),
                validator: _isValidate,
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: _descriptionTEController,
                maxLength: 200,
                decoration: InputDecoration(
                  label: Text('Description'),
                ),
                validator: _isValidate,
              ),
              SizedBox(height: 20,),
              SizedBox(
                height: 50,
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {

                  },
                  child: Text('Add New Todo', style: TextStyle(
                    fontSize: 18
                  ),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String? _isValidate(String? value) {
    if(value!.isEmpty ?? true) {
      return 'Enter a title';
    }
    return null;
  }
}
