import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/features/news/domain/entities/song.dart';
import 'package:blog_app/features/news/domain/usecases/get_all_songs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'news_song_event.dart';
part 'news_song_state.dart';

class NewsSongBloc extends Bloc<NewsSongEvent, NewsSongState> {
  final GetAllSongs _getAllSongs;
  NewsSongBloc({required GetAllSongs getAllSongs})
      : _getAllSongs = getAllSongs,
        super(NewsSongInitial()) {
    on<NewsSongFetchEvent>(_onNewsSongFetchEvent);
  }

  _onNewsSongFetchEvent(
      NewsSongFetchEvent event, Emitter<NewsSongState> emit) async {
    emit(NewsSongLoading());

    var res = await _getAllSongs(NoParams());
    res.fold((l) {
      print("Got exception:  ${l.message}");
      emit(NewsSongFailure(l.message));
    }, (data) => emit(NewsSongSuccess(data: data)));
  }
}
