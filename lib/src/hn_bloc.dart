import 'dart:async';
import 'dart:collection';
import 'package:hn_app/src/article.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;

enum StoriesType { topStories, newStories }

class HackerNewsBloc {
  Stream<bool> get isLoading => _isLoadingSubject.stream;

  // final _isLoadingSubject = BehaviorSubject<bool>(seedValue: false);
  final _isLoadingSubject = BehaviorSubject<bool>.seeded(false);

  final _articlesSubject = BehaviorSubject<UnmodifiableListView<Article?>>();

  var _articles = <Article?>[];

  final _storiesTypeController = StreamController<StoriesType>();

  Sink<StoriesType> get storiesType => _storiesTypeController.sink;

  static List<int> _newIds = [
    27799859,
    27807850,
    27792930,
    27796755,
    27818514,
  ];

  static List<int> _topIds = [
    27782604,
    27798879,
    27814621,
    27814080,
    27803146,
  ];

  HackerNewsBloc() {
    _getArticlesAndUpdate(_topIds);

    _storiesTypeController.stream.listen((storiesType) {
      if (storiesType == StoriesType.newStories) {
        _getArticlesAndUpdate(_newIds);
      } else {
        _getArticlesAndUpdate(_topIds);
      }
    });
  }

  _getArticlesAndUpdate(List<int> ids) async {
    _isLoadingSubject.add(true);
    await _updateArticles(ids);
    _articlesSubject.add(UnmodifiableListView(_articles));
    _isLoadingSubject.add(false);
  }

  Stream<UnmodifiableListView<Article?>> get articles =>
      _articlesSubject.stream;

  Future<Article?> _getArticle(int id) async {
    final storyUrl = 'https://hacker-news.firebaseio.com/v0/item/$id.json';
    final storyRes = await http.get(Uri.parse(storyUrl));
    if (storyRes.statusCode == 200) {
      return parseArticle(storyRes.body);
    }
  }

  Future<Null> _updateArticles(List<int> articleIds) async {
    final futureArticles = articleIds.map((id) => _getArticle(id));
    final articles = await Future.wait(futureArticles);
    _articles = articles;
  }
}
