import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App",
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
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
          title: const Text("Head"),
          backgroundColor: Colors.amber,
        ),
        body: Container(
          //decoration: BoxDecoration(color: Colors.amber),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 90,
                  )
                ],
              ),
              const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 90,
                  ),
                  Icon(
                    Icons.sailing,
                    color: Colors.black,
                    size: 40,
                  ),
                  Text(
                    "data",
                    style: TextStyle(fontFamily: "Ariel"),
                  )
                ],
              ),
              const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.sailing,
                    color: Colors.black,
                    size: 40,
                  ),
                  Text(
                    "data",
                    style: TextStyle(fontFamily: "Ariel"),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
