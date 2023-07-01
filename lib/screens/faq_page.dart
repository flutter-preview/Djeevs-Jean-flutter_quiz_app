import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ'),
      ),
      body: ListView(
        children: [
          ExpansionTile(
            title: Text('Question 1'),
            children: [
              ListTile(
                title: Text('Réponse 1'),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Question 2'),
            children: [
              ListTile(
                title: Text('Réponse 2'),
              ),
            ],
          ),
          // Ajoutez autant de questions et réponses que nécessaire
        ],
      ),
    );
  }
}



class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('À propos de l\'application'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bienvenue dans notre application de quiz !',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Notre application vous permet de tester vos connaissances dans différents langages de programmation, tels que Python, Java, C++, Android, HTML, JavaScript, SQL et Dart.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Fonctionnalités principales :',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              '- Choix parmi une variété de quiz dans différents langages de programmation.',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '- Répondez à des questions à choix multiples pour tester vos compétences.',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '- Obtenez des scores pour chaque quiz et suivez votre progression.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Nous espérons que notre application vous aidera à approfondir vos connaissances en programmation et à vous amuser en même temps !',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
