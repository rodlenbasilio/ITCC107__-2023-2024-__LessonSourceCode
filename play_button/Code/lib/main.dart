import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          children: [
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    playSound();
                  },
                  child: const Text("Press me")),
            ),
            ElevatedButton(
                onPressed: () {
                  stopSound();
                },
                child: const Text("Stop"))
          ],
        ),
      ),
    );
  }

  Future<void> playSound() async {
    String soundPath =
        "payphone.mp3"; //You don't need to include assets/ because AssetSource assume that you have sound in your assets folder.
    await player.play(AssetSource(soundPath));
  }

  Future<void> stopSound() async {
    //You don't need to include assets/ because AssetSource assume that you have sound in your assets folder.
    await player.stop();
  }
}
