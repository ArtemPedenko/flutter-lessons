import 'package:flutter/cupertino.dart';
import '../layers/word/widgets/word_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("HomePage"),
      ),
      child: SafeArea(
        child: Center(
          child: WordCard(),
        ),
      )
    );
  }
}

