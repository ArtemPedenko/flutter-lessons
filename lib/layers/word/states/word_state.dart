import 'package:english_words/english_words.dart';

class WordState {
  final WordPair current;
  final List<WordPair> favorites;

  WordState({
    required this.current,
    required this.favorites,
  });

  WordState copyWith({
    WordPair? current,
    List<WordPair>? favorites,
  }) {
    return WordState(
        current: current ?? this.current,
        favorites: favorites ?? this.favorites
    );
  }
}