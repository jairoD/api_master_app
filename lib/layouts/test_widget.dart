import 'package:flutter/material.dart';

class WidgetTest extends StatelessWidget {
  const WidgetTest({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WidgetTest',
      home: Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Center(child: Text('Widget test')),
      ),
    );
  }
}
