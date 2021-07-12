import 'dart:convert' as json;
import 'package:built_value/built_value.dart';

part 'json_parsing.g.dart';

abstract class Article implements Built<Article, ArticleBuilder> {
  int get id;

  Article._();
  factory Article([void Function(ArticleBuilder) updates]) = _$Article;
}

// class Article {
//   final String text;
//   final String url;
//   final String by;
//   final int time;
//   final int score;
//
//   const Article({
//     required this.text,
//     required this.url,
//     required this.by,
//     required this.time,
//     required this.score,
//   });
//
//   factory Article.fromJson(Map<dynamic, dynamic> json) {
//     // With null-safe Dart, factory constructors are no longer allowed to return null
//     // if (json == null) return null;
//
//     return Article(
//       text: json["text"] ?? '[null]',
//       url: json["url"],
//       by: json["by"],
//       time: json["time"],
//       score: json["score"],
//     );
//   }
// }

List<int> parseTopStories(String jsonStr) {
  return [];
  // final parsed = json.jsonDecode(jsonStr);
  // final listOfIds = List<int>.from(parsed);
  // return listOfIds;
}

Article? parseArticle(String jsonStr) {
  return null;
  // final parsed = json.jsonDecode(jsonStr);
  // Article article = Article.fromJson(parsed);
  // return article;
}
