import 'package:flutter/material.dart';
import 'package:todoapp/page/home_page.dart';
import 'package:flutter/src/material/colors.dart';
import 'package:todoapp/provider/todos.dart';
import 'package:todoapp/page/home_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final String title = 'Todo';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => TodosProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(
              primaryColor: Colors.red.shade400,
              // primarySwatch: Colors.red[300],
              scaffoldBackgroundColor: Colors.white),
          home: HomePage(),
        ),
      );
}
