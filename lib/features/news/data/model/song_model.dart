import 'package:blog_app/features/news/domain/entities/song.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SongModel extends Song {
  SongModel({
    required super.title,
    required super.artist,
    required super.duration,
    required super.releaseDate,
  });

  factory SongModel.fromJson(Map<String, dynamic> data) {
    return SongModel(
      title: data['title'] as String,
      artist: data['artist'] as String,
      duration: data['duration'] as num,
      releaseDate: data['releaseDate'] as Timestamp,
    );
  }

  SongModel copyWith({
    String? title,
    String? artist,
    num? duration,
    Timestamp? releaseDate,
  }) {
    return SongModel(
      title: title ?? this.title,
      artist: artist ?? this.artist,
      duration: duration ?? this.duration,
      releaseDate: releaseDate ?? this.releaseDate,
    );
  }
}
