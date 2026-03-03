import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import  'package:lucide_icons_flutter/lucide_icons.dart';
import '../theme/app_spacing.dart';

class WordCard extends StatefulWidget {
  const WordCard({super.key});

  @override
  State<WordCard> createState() => _WordCardState();
}

class _WordCardState extends State<WordCard> {
  WordPair current = WordPair.random();
  var favorites = <WordPair>[];

  void getNext() {
    setState(() {
      current = WordPair.random();
    });
  }

  void toggleFavorite() {
    setState(() {
      if (favorites.contains(current)) {
        favorites.remove(current);
      } else {
        favorites.add(current);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isFavorite = favorites.contains(current);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.xl,
      ),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey6,
        border: Border.all(color: CupertinoColors.activeOrange),
        borderRadius: BorderRadius.circular(16)
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            current.asUpperCase,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 20),

          CupertinoButton.filled(
            onPressed: getNext,
            child: const Text('Generete word'),
          ),

          const SizedBox(height: 14),

          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: CupertinoColors.systemGrey,
                width: 1
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child:  CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: toggleFavorite,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    LucideIcons.heart,
                    size: 22,
                    color: isFavorite
                        ? CupertinoColors.systemRed
                        : CupertinoColors.label,
                  ),
                  const SizedBox(width: 8),
                  const Text('Like')
                ],
              ),
            ),
          ),



          const SizedBox(height: 4),

          Text('Favorites: ${favorites.length}')
        ],
      ),
    );
  }
}