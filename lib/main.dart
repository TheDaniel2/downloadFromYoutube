import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const DownloadFromYoutube());
}

class DownloadFromYoutube extends StatelessWidget {
  const DownloadFromYoutube({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Download From Youtube',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Builder(
        builder: (context) {
          return DownloadField();
        },
      ),
    );
  }
}

class DownloadField extends StatelessWidget {
  const DownloadField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container( //Container me permite mexer no posicionamento e na aparencia
      color: Colors.white,
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
      child: Row(
        children: [
          Expanded( //TextField precisa estar dentro de algo como Expanded
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "URL YouTube Video",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
