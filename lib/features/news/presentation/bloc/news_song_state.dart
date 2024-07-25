part of 'news_song_bloc.dart';

@immutable
sealed class NewsSongState {}

final class NewsSongInitial extends NewsSongState {}

final class NewsSongLoading extends NewsSongState {}

final class NewsSongSuccess extends NewsSongState {
  final List<Song> data;
  NewsSongSuccess({required this.data});
}

final class NewsSongFailure extends NewsSongState {
  final String message;
  NewsSongFailure(this.message);
}
