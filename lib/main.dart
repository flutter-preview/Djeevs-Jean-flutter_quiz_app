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
    Tab(text: 'Quizzes'), Tab(text: 'Activity')
    // , Tab(text: 'Index'),
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
              accountName: Text('Quiz App'),
              accountEmail: Text('quizapp@dev.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/quiz1.jpg'),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              /* ListTile(
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
              ), */
              ListTile(
                leading: const Icon(Icons.language),
                title: Text('Choisir la langue'),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return LanguageSelectionDialog();
                    },
                  );
                },
              ),
            ],
          ),
        ),
        body: const TabBarView(  children: [QuizzesTab(), ActivityTab()
        //, IndexTab(),
         ], ),
      ),
    );
  }
}

class LanguageSelectionDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('Choisir la langue'),
      children: [
        RadioListTile(
          title: const Text('Français'),
          value: 'fr',
          groupValue: 'currentLanguage', // Replace 'currentLanguage' with your current language variable
          onChanged: (value) {
            // Update the language to French
            // Example code: languageController.setLanguage('fr');
          },
        ),
        RadioListTile(
          title: const Text('English'),
          value: 'en',
          groupValue: 'currentLanguage', // Replace 'currentLanguage' with your current language variable
          onChanged: (value) {
            // Update the language to English
            // Example code: languageController.setLanguage('en');
          },
        ),
      ],
    );
  }
}
