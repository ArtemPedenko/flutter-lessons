import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lessons/layers/word/states/word_cubit.dart';
import 'package:flutter_lessons/layers/word/states/word_state.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WordCubit, WordState>(
      builder: (context, state) {

        final favorites = state.favorites;

        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text("Favorites"),
          ),
          child: SafeArea(
            child: favorites.isEmpty
              ? const Center(child: Text('empty'))
              : ListView.builder(
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  final word = favorites[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 12,
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16
                      ),
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemGrey6,
                        borderRadius: BorderRadius.circular(12)
                      ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            word.asUpperCase,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                          CupertinoButton(
                            onPressed: () {
                              context.read<WordCubit>().removeFavorite(word);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  LucideIcons.heart,
                                  size: 22,
                                  color: CupertinoColors.systemRed,
                                ),
                                const SizedBox(width: 4),
                                Text('Remove')
                              ],
                            ), 
                          )
                        ],
                      ),
                    ),
                  );
                },
            )
          )
        );
      }
    );


  }
}