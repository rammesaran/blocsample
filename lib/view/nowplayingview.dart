import 'package:flutter/material.dart';
import 'package:movietask/bloc/movie.dart';
import 'package:movietask/model/nowplayingmodel.dart';

class NowPlayingMoviesList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NowPlayingMoviesListState();
  }
}

class NowPlayingMoviesListState extends State<NowPlayingMoviesList> {
  @override
  void initState() {
    super.initState();
    bloc.fetchAllNowPlayingMovies();
  }

  @override
  void dispose() {
//    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.allNowPlayingMovies,
      builder: (context, AsyncSnapshot<NowPlayingMovie> snapshot) {
        print(snapshot.hasData);
        if (snapshot.hasData) {
          return buildList(snapshot);
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget buildList(AsyncSnapshot<NowPlayingMovie> snapshot) {
    return GridView.builder(
        itemCount: snapshot.data.results.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return GridTile(
            child: InkResponse(
                enableFeedback: true,
                child: Image.network(
                  'https://image.tmdb.org/t/p/w185${snapshot.data.results[index].posterPath}',
                  fit: BoxFit.cover,
                ),
                onTap: () => {}),
          );
        });
  }
}
