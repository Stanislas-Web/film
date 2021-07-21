import 'package:film/models/popularTv_model.dart';

import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class TvBloc {
  final _repository = Repository();
  final _tvFetcher = PublishSubject<PopularTvModel>();

  
  Stream<PopularTvModel> get allTv => _tvFetcher.stream;
  fetchAllTv() async {
    PopularTvModel popularTVModel = await _repository.fetchAllTv();
    _tvFetcher.sink.add(popularTVModel);
  }

  dispose() {
    _tvFetcher.close();
  }
  
}

final blocTv = TvBloc();