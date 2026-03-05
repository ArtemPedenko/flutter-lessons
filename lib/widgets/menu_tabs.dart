import 'package:flutter/cupertino.dart';
import 'package:flutter_lessons/layers/todos/screens/todos_page.dart';
import 'package:flutter_lessons/main.dart';
import 'package:flutter_lessons/layers/word/screens/favorites_page.dart';
import 'package:flutter_lessons/screens/home_page.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class MainTabs extends StatelessWidget {
  const MainTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.heart),
            label: 'Favorites'
          ),
          BottomNavigationBarItem(
              icon: Icon(LucideIcons.listTodo),
              label: 'Todos'
          )
        ]
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return const HomePage();
          case 1:
            return const FavoritesPage();
          case 2:
            return const TodosPage();
          default:
            return const HomePage();
        }
      }
    );
  }
}