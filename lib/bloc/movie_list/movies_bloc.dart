import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:teste_tokenlab/bloc/movie_list/movies_result_state.dart';
import 'package:teste_tokenlab/data/remote/movie/repository/movie_data_repository.dart';

class MoviesBloc {
  MoviesBloc(this._movieRepository){
    _subscriptions
      ..add(
        _fetchMovieList()
            .listen(_behaviorSubject.add),
      )
      ..add(
          _onTryAgain.stream
          .flatMap((_) => _fetchMovieList())
          .listen(_behaviorSubject.add)
      );
  }

  final MovieDataRepository _movieRepository;

  final _subscriptions = CompositeSubscription();

  final _onTryAgain = StreamController<void>();
  Sink<void> get onTryAgain => _onTryAgain.sink;

  Stream<MoviesResultState> get moviesResultState =>
      _behaviorSubject.stream;
  final _behaviorSubject = BehaviorSubject<MoviesResultState>();

   Stream<MoviesResultState> _fetchMovieList() async* {
    yield MoviesLoadingState();

    try {
      yield MoviesSuccessState(
        await _movieRepository.fetchMovieList(),
      );
    } catch (e) {
      yield MoviesErrorState();
    }
   }

  void dispose() {
    _behaviorSubject.close();
    _onTryAgain.close();
    _subscriptions.dispose();
  }
}
