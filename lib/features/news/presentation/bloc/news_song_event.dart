part of 'news_song_bloc.dart';

@immutable
sealed class NewsSongEvent {}

class NewsSongFetchEvent extends NewsSongEvent {}
