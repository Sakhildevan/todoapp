import 'package:flutter/material.dart';
import 'package:todoapp/model/todo.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todoapp/page/edit_todo_page.dart';
import 'package:todoapp/provider/todos.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/utils.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;
  const TodoWidget({
    required this.todo,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Slidable(
            startActionPane: ActionPane(
              motion: ScrollMotion(),
              children: [
                SlidableAction(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  icon: Icons.edit,
                  label: 'Edit',
                  onPressed: (BuildContext context) => editTodo(context, todo),
                ),
              ],
            ),
            endActionPane: ActionPane(
              motion: ScrollMotion(),
              children: [
                SlidableAction(
                  // An action can be bigger than the others.
                  flex: 2,

                  backgroundColor: Color.fromARGB(255, 228, 60, 9),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                  onPressed: (BuildContext context) =>
                      deleteTodo(context, todo),
                ),
              ],
            ),
            key: Key(todo.id),
            child: buildTodo(context)),
      );

  Widget buildTodo(BuildContext context) => GestureDetector(
        onTap: () => editTodo(context, todo),
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Checkbox(
                activeColor: Theme.of(context).primaryColor,
                checkColor: Colors.white,
                value: todo.isDone,
                onChanged: (_) {
                  final provider =
                      Provider.of<TodosProvider>(context, listen: false);
                  final isDone = provider.toggleTodoStatus(todo);
                  Utils.showSnackBar(
                    context,
                    isDone ? 'Task Completed' : 'Task marked incompleted',
                  );
                },
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      todo.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 22,
                      ),
                    ),
                    if (todo.description.isNotEmpty)
                      Container(
                        margin: EdgeInsets.only(top: 4),
                        child: Text(
                          todo.description,
                          style: TextStyle(fontSize: 20, height: 1.5),
                        ),
                      )
                  ],
                ),
              )
            ],
          ),
        ),
      );
  void deleteTodo(BuildContext context, Todo todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.removeTodo(todo);
    Utils.showSnackBar(context, 'Deleted the task');
  }

  void editTodo(BuildContext context, Todo todo) =>
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => EditTodoPage(todo: todo),
      ));
}
