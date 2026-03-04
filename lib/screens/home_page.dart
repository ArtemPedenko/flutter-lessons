import 'package:flutter/cupertino.dart';
import '../widgets/word_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("HomePage"),
      ),
      child: Center(
        child: WordCard(),
      ),
    );
  }
}

