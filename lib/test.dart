import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Test(),
    );
  }
}

class Test extends StatelessWidget {
  const Test({super.key});

  void openURL() async {
    final Uri url = Uri.parse("https://www.instagram.com/athjihan/");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      print("Could not launch $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.only(top: 50, left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ROW
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('A1', style: TextStyle(fontSize: 30)),
                Text('B2', style: TextStyle(fontSize: 30)),
                Text('C3', style: TextStyle(fontSize: 30)),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            // IMAGE
            SvgPicture.asset(
              'assets/github.svg',
              width: 30,
              height: 30,
            ),
            const SizedBox(
              height: 30,
            ),

            const Image(
              image: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOTGLpRQIfbiwGixMl9BWIePzWJN4yPc6kQA&s',
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            // ICON
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.account_circle),
                const SizedBox(
                  width: 10,
                ),
                const Icon(Icons.access_alarm),
                const SizedBox(
                  width: 10,
                ),
                const Icon(Icons.access_time_sharp),
                IconButton(
                  onPressed: openURL,
                  icon: const Icon(Icons.person_2_outlined),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),

            // ELEVATED BUTTON
            ElevatedButton(
              onPressed: () => openURL(),
              child: const Text('Go to Instagram'),
            ),
          ],
        ),
      ),
    );
  }
}
