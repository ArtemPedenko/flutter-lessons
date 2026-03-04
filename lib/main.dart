import 'package:flutter/cupertino.dart';
import 'package:flutter_lessons/widgets/menu_tabs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: MainTabs(),
    );
  }
}