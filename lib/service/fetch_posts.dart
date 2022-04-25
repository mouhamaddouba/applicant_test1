// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:applicant1/model/post.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class FetchPostModel extends GetxController {
  Post? postObject;
  bool loadingData = false;

  Future<void> fetchPost() async {
    // ignore: todo
    // TODO(task1): fetch list of posts from api using http library
    Map<String, dynamic> responseData;
    const String baseUrl = 'https://jsonplaceholder.typicode.com/posts/1';
    final url = Uri.parse(baseUrl);
    try {
      loadingData = true;
      update();
      final response = await http.get(url);
      if (response.statusCode == 200) {
        responseData = json.decode(response.body);
        postObject = Post.fromJson(responseData);
        print(postObject?.title);
        print(postObject?.body);
      } else {
        return;
      }
    } catch (exception) {
      print('Http Error');
    }
    loadingData = false;
    update();
  }

  Future<void> saveData() async {
    var box = await Hive.openBox('posts');
    await box.clear();
    await box.add(postObject);
  }

  Future<void> getLocalData() async {
    var box = await Hive.openBox('posts');
    try {
      Post? post = box.getAt(0);
      print(post?.title);
      print(post?.body);
      Get.defaultDialog(
        title: post!.title,
        titleStyle: const TextStyle(
          height: 1.2,
          fontSize: 20,
          color: Color.fromARGB(255, 0, 175, 193),
        ),
        content: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Text(post.body),
          ),
        ),
      );
    } catch (error) {
      Get.defaultDialog(
        title: 'no data saved yet',
        titleStyle: const TextStyle(
          fontSize: 30,
          color: Color.fromARGB(178, 178, 6, 0),
        ),
        content: Container(),
      );
    }
  }
}
