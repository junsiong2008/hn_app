class Article {
  final String text;
  final String domain;
  final String by;
  final String age;
  final int score;
  final int commentsCount;

  const Article({
    required this.text,
    required this.domain,
    required this.by,
    required this.age,
    required this.score,
    required this.commentsCount,
  });
}

final articles = [
  new Article(
    text:
        "Circular Shock Acoustic Waves in Ionosphere Triggered by Launch of Formosat-5",
    domain: "wiley.com",
    by: "zdw",
    age: "3 hours",
    score: 177,
    commentsCount: 62,
  ),
  new Article(
    text: "BMW says electric cars mass production not viable until 2020",
    domain: "reuters.com",
    by: "Mononokay",
    age: "2 hours",
    score: 81,
    commentsCount: 128,
  )
];
