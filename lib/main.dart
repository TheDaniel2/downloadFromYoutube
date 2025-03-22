import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: const MyApp(),
    ),
  );
}

class MyAppState extends ChangeNotifier {
  String inputText = "";

  void onTextChange(String text) {
    inputText = text;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Download From Youtube',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Download content from YouTube"),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Column(children: const [DownloadField(), DownloadsView()]),
    );
  }
}

class DownloadField extends StatelessWidget {
  const DownloadField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      child: Row(children: [
          UrlField(),
          DownloadButton(),
        ],
      ),
    );
  }
}

class UrlField extends StatelessWidget {
  const UrlField({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: TextField(
          onChanged: (text) {
            appState.onTextChange(text);
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: "URL YouTube Video",
          ),
        ),
      ),
    );
  }
}

class DownloadButton extends StatelessWidget {
  const DownloadButton({super.key});

  @override
  Widget build(BuildContext context) {
    
    return ElevatedButton.icon(
      onPressed: () {
        print("...");
      },
      icon: Icon(Icons.download),
      label: Text("Download"),
    );
  }
}

class DownloadsView extends StatelessWidget {
  const DownloadsView({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Text(
      appState.inputText,
      style: const TextStyle(fontSize: 18, color: Colors.black),
    );
  }
}
