import 'package:flutter/material.dart';
import 'package:todo_app/widgets/home_action_button.dart';
import 'package:todo_app/widgets/home_appbar.dart';
import 'package:todo_app/widgets/home_body.dart';
import 'package:todo_app/widgets/home_bottom_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade200,
      appBar: HomeAppBar(),
      body: const HomeBody(),
      floatingActionButton: const HomeActionButton(),
      bottomNavigationBar: const HomeBottomAppbar(),
    );
  }
}
