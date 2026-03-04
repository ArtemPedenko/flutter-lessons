import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lessons/layers/word/states/word_cubit.dart';
import 'package:flutter_lessons/layers/word/states/word_state.dart';
import  'package:lucide_icons_flutter/lucide_icons.dart';
import '../../../theme/app_spacing.dart';

class WordCard extends StatelessWidget {
  const WordCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WordCubit, WordState>(
      builder: (context, state) {

        final isFavorite = state.favorites.contains(state.current);

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
                state.current.asUpperCase,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 20),

              CupertinoButton.filled(
                onPressed: () {
                  context.read<WordCubit>().getNext();
                },
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
                  onPressed: () {
                    context.read<WordCubit>().toggleFavorites();
                  },
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

              Text('Favorites: ${state.favorites.length}')
            ],
          ),
        );
      },
    );



  }
}

