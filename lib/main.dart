import 'package:flutter/material.dart';
import 'package:flutter_quiz/screens/about.dart';
import 'package:flutter_quiz/screens/activity_score.dart';
import 'package:flutter_quiz/screens/home_page.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart' as sqflite_ffi;
import 'package:sqflite_common/sqlite_api.dart';

void main() {
    // Initialize sqflite
  sqflite_ffi.sqfliteFfiInit();

  // Set the database factory
  databaseFactory = sqflite_ffi.databaseFactoryFfi;

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
    Tab(text: 'Home'),
    Tab(text: 'Activity Score'),
    Tab(text: 'About'),
  ];
   @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz App'),
          bottom: TabBar(tabs: tabs),
        ),
        body: TabBarView(
          children: [
            HomeTab(),
            ActivityScoreTab(),
            AboutTab(),
          ],
        ),
      ),
    );
  }
}
