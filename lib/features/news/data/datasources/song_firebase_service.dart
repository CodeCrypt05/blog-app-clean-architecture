import 'package:blog_app/core/error/exceptions.dart';
import 'package:blog_app/features/news/data/model/song_model.dart';
import 'package:blog_app/features/news/domain/entities/song.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class SongFirebaseService {
  Future<List<SongModel>> getNewsSongs();
  // Future<Either> getPlayList();
  // Future<Either> addOrRemoveFavoriteSong(String songId);
  // Future<bool> isFavoriteSong(String songId);
  // Future<Either> getUserFavoriteSongs();
}

class SongFirebaseServiceImpl implements SongFirebaseService {
  @override
  Future<List<SongModel>> getNewsSongs() async {
    try {
      var data = await FirebaseFirestore.instance
          .collection('songs')
          // .orderBy('releaseDate', descending: true)
          .limit(3)
          .get();

      print('Runtime type of data: ${data.runtimeType}');
      print('Runtime type of data.docs: ${data.docs.runtimeType}');

      return data.docs.map((song) => SongModel.fromJson(song.data())).toList();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
