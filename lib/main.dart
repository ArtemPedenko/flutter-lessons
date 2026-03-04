import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lessons/layers/word/states/word_cubit.dart';
import 'package:flutter_lessons/widgets/menu_tabs.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => WordCubit(),
      child: const MyApp(),
    )
  );
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