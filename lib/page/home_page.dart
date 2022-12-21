import 'package:flutter/material.dart';
import 'package:todoapp/main.dart';
import 'package:todoapp/widget/add_todo_dialogue.dart';
import 'package:flutter/src/material/dialog.dart';
import 'package:todoapp/widget/completed_listwidget.dart';
import 'package:todoapp/widget/todo_list_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      TodoListWidget(),
      CompletedListWidget(),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade400,
        title: Text(MyApp.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white.withOpacity(.7),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.fact_check_outlined, size: 28), label: 'ToDo'),
          BottomNavigationBarItem(
              icon: Icon(Icons.done, size: 28), label: 'Completed')
        ],
      ),
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.red.shade400,
        onPressed: () => showDialog(
            context: context, builder: (context) => AddTodoDialogWidget()),
        child: Icon(Icons.add),
      ),
    );
  }
}
