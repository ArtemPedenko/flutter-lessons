import 'package:english_words/english_words.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lessons/layers/word/states/word_state.dart';

class WordCubit extends Cubit<WordState> {

  WordCubit()
    :super(
      WordState(
          current: WordPair.random(),
          favorites: []
      )
  );

  void getNext() {
    emit(
      state.copyWith(
        current: WordPair.random()
      )
    );
  }

  void toggleFavorites() {
    final current = state.current;
    final updatedFavorites = List<WordPair>.from(state.favorites);

    if (updatedFavorites.contains(current)) {
      updatedFavorites.remove(current);
    } else {
      updatedFavorites.add(current);
    }

    emit(
      state.copyWith(
        favorites: updatedFavorites
      )
    );
  }

  void removeFavorite(WordPair word) {
    final updated = List<WordPair>.from(state.favorites)..remove(word);
    emit(state.copyWith(favorites: updated));
  }
}