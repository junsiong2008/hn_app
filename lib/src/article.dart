import 'dart:convert' as json;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'serializers.dart';

part 'article.g.dart';

abstract class Article implements Built<Article, ArticleBuilder> {
  static Serializer<Article> get serializer => _$articleSerializer;

  int get id;

  bool? get deleted;

  String get type;

  String get by;

  int get time;

  String? get text;

  bool? get dead;

  int? get parent;

  int? get poll;

  BuiltList<int> get kids;

  String? get url;

  int? get score;

  String? get title;

  BuiltList<int> get parts;

  int? get descendants;

  Article._();

  factory Article([void Function(ArticleBuilder) updates]) = _$Article;
}

List<int> parseTopStories(String jsonStr) {
  return [];
  // final parsed = json.jsonDecode(jsonStr);
  // final listOfIds = List<int>.from(parsed);
  // return listOfIds;
}

Article? parseArticle(String jsonStr) {
  final parsed = json.jsonDecode(jsonStr);
  Article? article =
      standardSerializers.deserializeWith(Article.serializer, parsed);
  return article;
}

// class Article {
//   final String text;
//   final String domain;
//   final String by;
//   final String age;
//   final int score;
//   final int commentsCount;
//
//   const Article({
//     required this.text,
//     required this.domain,
//     required this.by,
//     required this.age,
//     required this.score,
//     required this.commentsCount,
//   });
// }
//
// final articles = [
//   new Article(
//     text:
//         "Circular Shock Acoustic Waves in Ionosphere Triggered by Launch of Formosat-5",
//     domain: "wiley.com",
//     by: "zdw",
//     age: "3 hours",
//     score: 177,
//     commentsCount: 62,
//   ),
//   new Article(
//     text: "BMW says electric cars mass production not viable until 2020",
//     domain: "reuters.com",
//     by: "Mononokay",
//     age: "2 hours",
//     score: 81,
//     commentsCount: 128,
//   )
// ];
