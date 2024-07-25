import 'package:blog_app/core/error/exceptions.dart';
import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/features/news/data/datasources/song_firebase_service.dart';
import 'package:blog_app/features/news/domain/entities/song.dart';
import 'package:blog_app/features/news/domain/repositories/song_repository.dart';
import 'package:fpdart/src/either.dart';

class SongRepositoryImpl implements SongRepository {
  final SongFirebaseService songFirebaseService;

  SongRepositoryImpl(this.songFirebaseService);
  @override
  Future<Either<Failure, List<Song>>> getSong() async {
    try {
      final songs = await songFirebaseService.getNewsSongs();
      return right(songs);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
