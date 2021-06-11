import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/item_model.dart';

class TvBloc {
  final _repository = Repository();
  final _tvFetcher = PublishSubject<ItemModel>();

  Stream<ItemModel> get allTv => _tvFetcher.stream;
  fetchAllMovies() async {
    ItemModel itemModel = await _repository.fetchAllMovies();
    _tvFetcher.sink.add(itemModel);
  }

  dispose() {
    _tvFetcher.close();
  }
}

final bloc = TvBloc();