import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/features/news/domain/entities/song.dart';
import 'package:blog_app/features/news/domain/repositories/song_repository.dart';
import 'package:fpdart/src/either.dart';

class GetAllSongs implements UseCase<List<Song>, NoParams> {
  final SongRepository songRepository;

  GetAllSongs({required this.songRepository});

  @override
  Future<Either<Failure, List<Song>>> call(NoParams params) async {
    return await songRepository.getSong();
  }
}
