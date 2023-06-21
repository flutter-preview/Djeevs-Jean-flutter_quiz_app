import 'package:flutter/material.dart';
import 'package:flutter_quiz/screens/index_page.dart';
import 'package:flutter_quiz/screens/activity_page.dart';
import 'package:flutter_quiz/screens/quizzes_page.dart';

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
          title: const Text('Quiz App'),
          bottom: TabBar(tabs: tabs),
        ),
        drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text('I Love Music'),
              accountEmail: Text('contact@ilovemusic.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/img/welcome.gif'),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.login),
                title: const Text('Se connecter'),
                onTap: () {
                  // Code pour naviguer vers la page de connexion
                },
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Accueil'),
                onTap: () {
                  // Code pour naviguer vers la page d'accueil
                },
              ),
              /* ListTile(
                leading: const Icon(Icons.library_books),
                title: const Text('Leçons'),
                onTap: () {
                  // Code pour naviguer vers la page des leçons
    
                },
              ),
              ListTile(
                leading: const Icon(Icons.music_note),
                title: const Text('Partitions'),
                onTap: () {
                  // _onItemTapped(2);
                  // Navigator.pop(context);
                },
              ), */
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Se déconnecter'),
                onTap: () {
                  // Code pour déconnecter l'utilisateur
                },
              ),
              ListTile(
                leading: const Icon(Icons.person_add),
                title: const Text('Créer un compte'),
                onTap: () {
                  // _onItemTapped(1);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: const TabBarView(  children: [QuizzesTab(), ActivityTab(), IndexTab(), ], ),
      ),
    );
  }
}
