import 'dart:async';

import 'package:domain/domain/use_case/get_movie_list_uc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:teste_tokenlab/presentation/movie/movie_list/movies_result_state.dart';

class MoviesBloc {
  MoviesBloc(this.getMovieListUseCase) {
    _subscriptions
      ..add(
        _fetchMovieList().listen(_behaviorSubject.add),
      )
      ..add(_onTryAgain.stream
          .flatMap((_) => _fetchMovieList())
          .listen(_behaviorSubject.add));
  }

  final GetMovieListUC getMovieListUseCase;

  final _subscriptions = CompositeSubscription();

  final _onTryAgain = StreamController<void>();

  Sink<void> get onTryAgain => _onTryAgain.sink;

  Stream<MoviesResultState> get moviesResultState => _behaviorSubject.stream;
  final _behaviorSubject = BehaviorSubject<MoviesResultState>();

  Stream<MoviesResultState> _fetchMovieList() async* {
    yield MoviesLoadingState();
    try {
      final movieList = await getMovieListUseCase.getFuture(params: null);
      yield MoviesSuccessState(movieList);
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
