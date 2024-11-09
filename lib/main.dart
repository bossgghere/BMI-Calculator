import 'package:bmi/IntorPage.dart';
import 'package:bmi/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});
  final String title;

  final List<String> arrName = [
    'hi',
    'hello',
    'apple',
    'hi',
    'hello',
    'apple',
    'hi',
    'hello',
    'apple'
  ];
  final List<int> arrNumber = [
    12,
    21,
    34,
    12,
    21,
    34,
    12,
    21,
    34
  ]; // Changed to a List
  final List<int> arrchu = [
    413212,
    746521,
    079834,
    413212,
    746521,
    079834,
    413212,
    746521,
    079834
  ]; // Changed to a List

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
        itemCount: widget.arrName.length, // Set the item count based on arrName
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text(
              '${index + 1}',
              style: TextStyle(fontSize: 25),
            ),
            title: Text(
              widget.arrName[index],
              style: TextStyle(fontSize: 30),
            ),
            subtitle: Text(
              'Number: ${widget.arrNumber[index]}',
              style: TextStyle(fontSize: 15),
            ),
            trailing: const Icon(
              Icons.delete,
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            height: 3,
          );
        },
      ),
    );
  }
}
