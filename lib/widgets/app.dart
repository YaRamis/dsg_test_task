import 'package:dsg_test_task/widgets/main_screen/main_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DSG TEST TASK',
      home: MainScreen(),
    );
  }
}
