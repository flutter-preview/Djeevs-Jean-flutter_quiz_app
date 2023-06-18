import 'package:flutter/material.dart';
import 'package:flutter_quiz/screens/about.dart';
import 'package:flutter_quiz/screens/activity_score.dart';
import 'package:flutter_quiz/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  final List<Tab> tabs = const [
    Tab(text: 'Quizzes'), Tab(text: 'Activity'), Tab(text: 'Index'),
  ];
   @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Quiz App')),
          bottom: TabBar(tabs: tabs),
        ),
        body: const TabBarView(  children: [HomeTab(), ActivityScoreTab(), AboutTab(), ],),
      ),
    );
  }
}
