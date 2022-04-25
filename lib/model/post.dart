// ignore: todo
//TODO(task2): save the model in local database using Hive library

import 'package:hive/hive.dart';

part 'post.g.dart';

@HiveType(typeId: 0)
class Post {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String body;

  Post({
    this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'] ?? "",
      body: json['body'] ?? "",
    );
  }
}
