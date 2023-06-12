import 'package:flutter/material.dart';
import 'package:flutter_quiz/screens/quiz_screen.dart';


void main() {
  runApp(MyApp());
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
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<Tab> tabs = [
    Tab(text: 'Home'),
    Tab(text: 'History Score'),
    Tab(text: 'About'),
  ];
   @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
          bottom: TabBar(tabs: tabs),
        ),
        body: TabBarView(
          children: [
            QuizScreen(),
            HistoryScoreTab(),
            AboutTab(),
          ],
        ),
      ),
    );
  }
}
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('Quiz App'),
  //     ),
  //     body: Column(
  //       children: [
  //         TabBar(
  //           tabs: [
  //             Tab(text: 'Home'),
  //             Tab(text: 'History Score'),
  //             Tab(text: 'About'),
  //           ],
  //         ),
  //         Expanded(
  //           child: TabBarView(
  //             children: [
  //               // Page 1: Home
  //               HomeTab(),
  //               // Page 2: History Score
  //               HistoryScoreTab(),
  //               // Page 3: About
  //               AboutTab(),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
// }


class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Contenu de la page d'accueil
    return Container(
      child: Text('Home Page'),
    );
  }
}

class HistoryScoreTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Contenu de la page d'historique des scores
    return Container(
      child: Text('History Score Page'),
    );
  }
}

class AboutTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Contenu de la page "À propos"
    return Container(
      child: Text('About Page'),
    );
  }
}