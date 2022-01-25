import 'package:flutter/material.dart';
import 'package:ly_web/pages/page_01.dart' deferred as page01;
import 'package:ly_web/pages/page_02.dart' deferred as page02;
import 'package:ly_web/pages/page_03.dart' deferred as page03;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    page01.loadLibrary();
    page02.loadLibrary();
    page03.loadLibrary();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              child: Container(
                color: Colors.green,
                child: const Text('to page01'),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (c) => page01.Page01()));
              },
            ),
            GestureDetector(
              child: Container(
                color: Colors.green,
                child: const Text('to page02'),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (c) => page02.Page02()));
              },
            ),
            GestureDetector(
              child: Container(
                color: Colors.green,
                child: const Text('to page03'),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (c) => page03.Page03()));
              },
            )
          ],
        ),
      ),
    );
  }
}
