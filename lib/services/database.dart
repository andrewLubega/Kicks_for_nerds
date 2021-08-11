import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/models/posts.dart';
import 'package:uuid/uuid.dart';

class DataBase {
  final connection = FirebaseDatabase.instance.reference();
  DataBase({uid});

  String uid = '';

  Future<void> updateFlutterArticlesUser(user) async {
    final usersReference = connection.child('users').child(user.uid);
    usersReference.set(
      {
        'uid': user.uid,
        'email': user.email,
        // 'password': user.password,

        // 'username': username,
        //add as many attributes as you want
      },
    );
  }

  Future<void> savePost({title, text, imageUrl}) async {
    String id = Uuid().v1();
    final postReference = connection.child('posts').child(id);
    postReference.set({
      'title': title,
      'text': text,
      'imageUrl': imageUrl,
    });
  }

  List getPost({AsyncSnapshot snapshot}) {
    final postReference = connection.child('posts');
    final List postList = [];
    final Map<dynamic, dynamic> postMap = snapshot.data.snapshot.value;
    postMap.forEach(
      (key, value) {
        postList.add(
          Post(
            imageUrl: value['imageUrl'],
            title: value['title'],
            text: value['text'],
          ),
        );
      },
    );
    return postList;
  }
}

// class DataService {}
