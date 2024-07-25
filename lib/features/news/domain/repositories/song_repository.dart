import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/features/news/domain/entities/song.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class SongRepository {
  Future<Either<Failure, List<Song>>> getSong();
}
