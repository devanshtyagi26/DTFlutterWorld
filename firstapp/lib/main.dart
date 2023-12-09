import 'package:firstapp/home.dart';
import 'package:firstapp/second.dart';
import 'package:firstapp/settings.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //

        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 228, 9, 144)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo HomePage'),
        backgroundColor: Color.fromARGB(255, 228, 9, 144),
      ),
      drawer: Drawer(
        backgroundColor: Colors.blue.withOpacity(.8),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
              radius: 100,
              backgroundColor: Colors.green,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Home(),
                ));
              },
              child: ListTile(
                title: Text(
                  'Home',
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Profile',
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Settings(),
                ));
              },
              child: ListTile(
                title: Text(
                  'Settings',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Help',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              title: Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.subdirectory_arrow_right_rounded),
        backgroundColor: Colors.blue,
      ),
      body: Center(
          child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const SecondScreen(),
          ));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(255, 91, 248, 74),
          ),
          child: const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text('Go to second screen'),
          ),
        ),
      )),
    );
  }
}
