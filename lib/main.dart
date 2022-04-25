// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import './model/post.dart';
import './service/fetch_posts.dart';

import 'package:path_provider/path_provider.dart' as path_provider;

const primaryColor = Color.fromRGBO(0, 147, 171, 1);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    final appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
    Hive.registerAdapter(PostAdapter());
  } catch (e) {
    print(e);
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final FetchPostModel fetchPostModel = Get.put(FetchPostModel());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Task',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Task',
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 120,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 150,
                      height: 50,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        onPressed: fetchPostModel.fetchPost,
                        child: const Text(
                          'Get data api',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        color: primaryColor,
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 50,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        onPressed: fetchPostModel.getLocalData,
                        child: const Text(
                          'Get data local',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                GetBuilder<FetchPostModel>(
                  init: fetchPostModel,
                  builder: (controller) {
                    if (controller.loadingData == true) {
                      return const Padding(
                        padding: EdgeInsets.all(80),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: primaryColor,
                          ),
                        ),
                      );
                    }
                    if (controller.postObject != null) {
                      return Padding(
                        padding: const EdgeInsets.all(25),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(15),
                              width: 350,
                              height: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                  color: const Color.fromRGBO(235, 235, 235, 1),
                                  //color: Colors.grey,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  controller.postObject!.title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: const EdgeInsets.all(15),
                              width: 350,
                              height: 140,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                  color: const Color.fromRGBO(235, 235, 235, 1),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  controller.postObject!.body,
                                  style: const TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Container(
                              width: 200,
                              height: 50,
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                onPressed: controller.saveData,
                                child: const Text(
                                  'Save in Data Base',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                color: const Color.fromRGBO(0, 103, 120, 1),
                              ),
                            ),
                          ],
                          // ignore: todo
                          //TODO(task1): print the post coming from the api (using print method)
                          // ignore: todo
                          //TODO(task2): store the the post coming from api in local
                          // ignore: todo
                          //TODO(task2): get the post from local db and print the post title(using print method)
                          // ignore: todo
                          //TODO(task3) design Column with tow text and print the result of task1 in the first Text widget and print the result of task2 in the second Text widget
                        ),
                      );
                    }

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 45,
                        ),
                        SvgPicture.asset(
                          'assets/images/No data.svg',
                          width: 250,
                          height: 250,
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        const Text(
                          'Select a way to get data',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
