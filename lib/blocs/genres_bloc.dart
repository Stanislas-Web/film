import 'package:film/models/genre_model.dart';

import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class GenresBloc {
  final _repository = Repository();
  final _genresFetcher = PublishSubject<GenresModel>();

  
  Stream<GenresModel> get allGenres => _genresFetcher.stream;
  fetchAllGenres() async {
    GenresModel genresModel = await _repository.fetchAllGenres();
    _genresFetcher.sink.add(genresModel);
  }

  dispose() {
    _genresFetcher.close();
  }
  
}

final blocGenres = GenresBloc();