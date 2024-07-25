import 'package:blog_app/features/news/presentation/bloc/news_song_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SongPage extends StatefulWidget {
  const SongPage({super.key});

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<NewsSongBloc>().add(NewsSongFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    String appUrl =
        "https://firebasestorage.googleapis.com/v0/b/spotify-bff99.appspot.com/o/covers%2F";
    String mediaUlt = "alt=media";
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // SizedBox(height: 20.h),
          BlocBuilder<NewsSongBloc, NewsSongState>(
            builder: (context, state) {
              if (state is NewsSongLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is NewsSongSuccess) {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.all(8),
                  shrinkWrap: true,
                  itemCount: state.data.length,
                  itemBuilder: (context, index) {
                    print(
                        "link: ${appUrl + state.data[index].artist + ' - ' + state.data[index].title + '.png?' + mediaUlt}");

                    String formattedArtist =
                        state.data[index].artist.replaceAll(' ', '_');
                    String formattedTitle =
                        state.data[index].title.replaceAll(' ', '_');
                    return Container(
                      height: 140.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        image: DecorationImage(
                          image: NetworkImage(appUrl +
                              formattedArtist +
                              '_-_' +
                              formattedTitle +
                              '.png?' +
                              mediaUlt),
                        ),
                      ),
                      child: Text('$index'),
                      margin: EdgeInsets.only(top: 6.h),
                    );
                  },
                );
              }

              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
