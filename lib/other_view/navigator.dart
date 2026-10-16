import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Context (identitas/posisi widget) dan Route (peta jalan (path))

class ContohNavigatorPush extends StatelessWidget {
  const ContohNavigatorPush({super.key});

  final String messageFirstScreen = 'Hello from First Screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('First Screen')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SecondScreen(message: messageFirstScreen); // kirim pesan ke second screen
                    },
                  ),
                );
              },
              child: const Text("Move Screen"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    // ini khas/tipe IOS
                    builder: (context) {
                      return SecondScreen(message: messageFirstScreen);
                    },
                  ),
                );
              },
              child: const Text("Move Screen Tipe IOS"),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final String message;

  const SecondScreen({super.key, required this.message}); // nerima message/data dari first screen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Screen')),
      body: Center(
        child: Column(
          spacing: 8,
          children: [
            Text(message),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Back"),
            ),
          ],
        ),
      ),
    );
  }
}
