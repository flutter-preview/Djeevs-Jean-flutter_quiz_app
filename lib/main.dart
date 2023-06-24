import 'package:flutter/material.dart';
import 'package:flutter_quiz/screens/activity_page.dart';
import 'package:flutter_quiz/screens/quizzes_page.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('en', 'HT')],
      path: 'assets/translations', // <-- change the path of the translation files 
      fallbackLocale: Locale('en', 'HT'),
      child: MyApp()
    ),
  );
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
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: MainScreen(),
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
  ];
   @override
  Widget build(BuildContext context) {
    // context.locale = Locale('en', 'HT');

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('apptitle'.tr().toString()),
          
          // title: const Text('Quiz App'),
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

              /*ListTile(
                 leading: Icon(Icons.language),
                title: Text('Change Language'),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Select Language'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              title: Text('English'),
                              onTap: () {
                                EasyLocalization.of(context).locale = Locale('en', 'US');
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              title: Text('French'),
                              onTap: () {
                                EasyLocalization.of(context).locale = Locale('fr', 'FR');
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ), */
            ],
          ),
        ),
        body: TabBarView(  children: [QuizzesTab(), ActivityTab()
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
