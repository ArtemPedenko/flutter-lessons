import 'package:flutter/cupertino.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Favorites"),
      ),
      child: Center(
        child: Text("Favorites page"),
      ),
    );
  }
}