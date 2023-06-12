import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz/screens/quiz_screen.dart';
import 'package:flutter_quiz/model/question.dart';


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
            HomeTab2(),
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
  final List<String> categories = [
    'Sports',
    'Religieux',
    'Science',
    // Ajoutez d'autres catégories ici
  ]; 
  

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return ListTile(
          title: Text(category),
          onTap: () {
            // Naviguer vers la page de quiz pour cette catégorie
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => QuizScreen(),
              ),
            );
          },
        );
      },
    );
  }
}

class HomeTab2 extends StatelessWidget {
  final List<CategoryQuestion> categories = [
    CategoryQuestion(
      name: 'Sports',
      iconData: Icons.sports,
      description: 'Test your sports knowledge!',
    ),
    CategoryQuestion(
      name: 'Religieux',
      iconData: Icons.book,
      description: 'Explore religious trivia!',
    ),
    CategoryQuestion(
      name: 'Science',
      iconData: Icons.science,
      description: 'Discover scientific facts!',
    ),
    // Ajoutez d'autres catégories ici
  ];

  
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(top: 10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Nombre de colonnes souhaité
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return InkWell(
          onTap: () {
            // Naviguer vers la page de quiz pour cette catégorie
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => QuizScreen(),
                
              ),
            );
          },
          child: Card(
            child: ListTile(
              leading: Icon(category.iconData),
              title: Text(category.name),
              subtitle: Text(category.description),
            ),
              ),
            );
          },
        );
      }
/* 
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return GestureDetector(
          onTap: () {
            // Naviguer vers la page de quiz pour cette catégorie
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => QuizScreen(),
                // builder: (context) => QuizScreen(category: category),
              ),
            );
          },
          child: Card(
            child: ListTile(
              leading: Icon(category.iconData),
              title: Text(category.name),
              subtitle: Text(category.description),
            ),
          ),
        );
      },
    ); */
  // }
}



// class HomeTab extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Contenu de la page d'accueil
//     return Container(
//       child: Text('Home Page'),
//     );
//   }
// }

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