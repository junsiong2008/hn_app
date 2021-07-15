import 'dart:async';
import 'dart:collection';
import 'package:hn_app/src/article.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;

class HackerNewsBloc {
  final _articlesSubject = BehaviorSubject<UnmodifiableListView<Article?>>();

  var _articles = <Article?>[];

  List<int> _ids = [
    27782604,
    27798879,
    27814621,
    27814080,
    27803146,
    27799859,
    27807850,
    27792930,
    27796755,
    27818514,
  ];

  HackerNewsBloc() {
    _updateArticles().then((_) {
      _articlesSubject.add(UnmodifiableListView(_articles));
    });
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

  Future<Null> _updateArticles() async {
    final futureArticles = _ids.map((id) => _getArticle(id));
    final articles = await Future.wait(futureArticles);
    _articles = articles;
  }
}
