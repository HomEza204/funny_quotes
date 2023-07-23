import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const FunnyQuotesApp());
}

class FunnyQuotesApp extends StatelessWidget {
  const FunnyQuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<Color> _colorList = [
    Colors.pink,
    Colors.yellow,
    Colors.blue,
    Colors.green,
    Colors.cyanAccent,
  ];

  static const List<String> _quoteList = [
    'ถึงไม่งามบาดตา แต่ปากหมาบาดใจนะ',
    'อยากมอนิ่งเธอทุกวัน ติดตรงเราตื่นเที่ยง',
    'อย่าทำให้หลงได้ไหม น้ำมันแพง',
    'พูดไม่ค่อยเก่ง แต่กินหมดจาน',
    'ใจไม่ดำหรอกจ้ะ ขอบตาต่างหากที่ดำ',
  ];
  var _quote = _quoteList[0]; //state variable
  var _color = _colorList[0];

  void _handleClickGo() {
    var rand = Random();
    String newQuote;
    do {
      var randomIndex = rand.nextInt(_quoteList.length);
      newQuote = _quoteList[randomIndex];
    } while (newQuote == _quote);

    Color newColor;
    do {
      var randomIndex = rand.nextInt(_colorList.length);
      newColor = _colorList[randomIndex];
    } while (newColor == _color);

    setState(() {
      //เซ็ตค่าที่จะเปลี่ยนค่าบนหน้าจอ
      _quote = newQuote;
      _color = newColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Funny Quotes')),
      floatingActionButton: FloatingActionButton(
        onPressed: _handleClickGo,
        child: const Text(
          'Next Quote',
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            _quote,
            style: TextStyle(
              color: _color,
              fontSize: 50,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
