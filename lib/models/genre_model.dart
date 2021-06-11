class GenresModel {

  List<_Genres> _genres = [];

  GenresModel.fromJson(Map<String, dynamic> parsedJson) {
    List<_Genres> temp = [];
    for (int i = 0; i < parsedJson['genres'].length; i++) {
      _Genres genres = _Genres(parsedJson['genres'][i]);
      temp.add(genres);
    }
    _genres = temp;
  }
  List<_Genres> get genres => genres;

}
class _Genres {
  int _id;
  String _name;
    _Genres(genres) {
    _id = genres['id'];
    _name = genres['name'];
  }
}