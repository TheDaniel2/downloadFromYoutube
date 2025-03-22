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
      appBar: AppBar(title: Text("Download content from YouTube")),
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
      child: Row(children: [UrlField(), DownloadButton()]),
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
    //var appState = context.watch<MyAppState>();

    final items = List<ListItem>.generate(
      1000,
      (i) => VideoItem('Sender $i', 'Message body $i', "100%"),
    );

    return Container(
      color: Colors.white,
      width: 500,
      height: 500,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: ListView.builder(
        // Let the ListView know how many items it needs to build.
        itemCount: items.length,
        // Provide a builder function. This is where the magic happens.
        // Convert each item into a widget based on the type of item it is.
        itemBuilder: (context, index) {
          final item = items[index];

          return Container(
            color: const Color.fromARGB(255, 187, 225, 255),
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 5.0),
            child: Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: item.buildVideoTitle(context),
                    subtitle: item.buildChannelName(context),
                  ),
                ),
                item.buildDownloadStatus(context)
              ],
            ),
          );
        },
      ),
    );
  }
}

abstract class ListItem {
  Widget buildVideoTitle(BuildContext context);

  Widget buildChannelName(BuildContext context);

  Widget buildDownloadStatus(BuildContext context);
}

/// A ListItem that contains data to display a message.
class VideoItem implements ListItem {
  final String title;
  final String channelName;
  final String downloadStatus;

  VideoItem(this.title, this.channelName, this.downloadStatus);

  @override
  Widget buildVideoTitle(BuildContext context) => Text(title);

  @override
  Widget buildChannelName(BuildContext context) => Text(channelName);

  @override 
  Widget buildDownloadStatus(BuildContext context) => Text(downloadStatus);
}
