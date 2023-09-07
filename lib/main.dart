import 'package:flutter/material.dart';
import 'package:hng_task1/github_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HNG Task1"),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 100)),
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.5),
                  // borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("images/flutter.png"),
                  ),
                  borderRadius: BorderRadius.circular(200),
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 3),
                        spreadRadius: 2,
                        blurRadius: 10,
                        color: Colors.black12)
                  ]),
            ),
            const SizedBox(height: 30),
            const Text(
              "Abdulrasak Mubarak Olanrewaju",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 40,
              width: 130,
              decoration: BoxDecoration(color: Colors.blue),
              child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GitHubView()));
                },
                child: Text(
                  'Open GitHub',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      )),
    );
  }
}
