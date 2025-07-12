import 'package:flutter/material.dart';
import 'package:todo_app/ui/screens/todo_list_screen.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo',
      debugShowCheckedModeBanner: false,
      home: TodoListScreen(),
      theme: _lightTheme(),
    );
  }

  ThemeData _lightTheme() {
    return ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
          color: Color(0xFF0EC7B7),
          fontWeight: FontWeight.bold
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(60),
          borderSide: BorderSide(color: Color(0xFF0EC7B7))
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(60),
            borderSide: BorderSide(color: Color(0xFF0EC7B7))
        ),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(60),
            borderSide: BorderSide(color: Color(0xFF0EC7B7))
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(60),
            borderSide: BorderSide(color: Color(0xFF0EC7B7), width: 2),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Color(0xFF0EC7B7),
        foregroundColor: Colors.white
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF0EC7B7),
          foregroundColor: Colors.white
        )
      ),
    );
  }
}
