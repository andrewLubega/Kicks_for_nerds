import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/models/myAppUser.dart';
import 'package:kicks_for_nerds/models/posts.dart';
import 'package:uuid/uuid.dart';
import 'auth.dart';

class DataBase {
  final connection = FirebaseDatabase.instance.reference();
  DataBase({uid});

  // String uid = '';

  Future<void> updateFlutterArticlesUser(user, name, userName) async {
    final usersReference = connection.child('users').child(user.uid);
    await usersReference.set(
      {
        'uid': user.uid,
        'email': user.email,
        //TODO removed user. from userName and name
        'userName': userName,
        'name': name,
        // 'password': user.password,

        // 'username': username,
        //add as many attributes as you want
      },
    );
  }

  // ignore: missing_return
  Future<MyAppUser> getUserData(user) async {
    MyAppUser myAppUser;
    // ignore: unused_local_variable
    final usersReference = connection.child('users').child(user.uid);
    await usersReference.get().then(
      (data) {
        myAppUser = MyAppUser(
          uid: data.value['uid'],
          email: data.value['email'],
          userName: data.value['userName'],
          name: data.value['name'],
        );
      },
    );
    return myAppUser;
  }

  // story saving function
  Future<void> saveStory({String imageUrl}) async {
    String user = await AuthService().currentUser();

    print("SAVINGGG STORY");
    print(user);

    String storyId = Uuid().v1();

    final gloablStoryRef =
        connection.child('global').child('stories').child(storyId);
    gloablStoryRef.set({
      'userUid': user,
      'imageUrl': imageUrl,
    });

    final storyRef =
        connection.child('users').child(user).child('stories').child(storyId);
    storyRef.set({
      'imageUrl': imageUrl,
    });
  }

  // firebase story retrieval function
  Future<List> getStory({AsyncSnapshot snapshot}) async {
    String user = await AuthService().currentUser();
    final storyReference =
        connection.child('users').child(user).child('stories');
    final List storyList = [];
    final Map<dynamic, dynamic> storyMap = snapshot.data.snapshot.value;

    print("GOT STORY");
    print(user);

    storyMap.forEach((key, value) {
      storyList.add(
        Story(
          imageUrl: value['imageUrl'],
          userId: value['userId'],
        ),
      );
    });
  }

  Future<List> getGlobalStory({AsyncSnapshot snapshot}) async {
    String user = await AuthService().currentUser();
    final storyReference = connection.child('global').child('stories');
    final List storyList = [];
    final Map<dynamic, dynamic> storyMap = snapshot.data.snapshot.value;

    print("GOT STORY");
    print(user);

    storyMap.forEach((key, value) {
      storyList.add(
        Story(
          imageUrl: value['imageUrl'],
          userId: value['userId'],
        ),
      );
    });
  }

  Future<void> savePost({title, text, imageUrl}) async {
    String user = await AuthService().currentUser();

    print("SAVINGGG POST");
    print(user);

    String postId = Uuid().v1();

    final gloablPostRef =
        connection.child('global').child('posts').child(postId);
    gloablPostRef.set({
      'userUid': user,
      'title': title,
      'text': text,
      'imageUrl': imageUrl,
    });

    final postReference =
        connection.child('users').child(user).child('posts').child(postId);
    postReference.set({
      'title': title,
      'text': text,
      'imageUrl': imageUrl,
    });
  }

  Future<List> getPost({AsyncSnapshot snapshot}) async {
    String user = await AuthService().currentUser();

    print("GOT POST");
    print(user);

    // final postReference = connection.child('users').child(user).child('posts');
    final List postList = [];
    final Map<dynamic, dynamic> postMap = snapshot.data.snapshot.value;

    postMap.forEach(
      (key, value) {
        // value.forEach((postKey, postValue) {
        //   print(postValue);
        //   postList.add(
        //     Post(
        //       userId: postValue['userId'],
        //       imageUrl: postValue['imageUrl'],
        //       title: postValue['title'],
        //       text: postValue['text'],
        //     ),
        //   );
        // });
        // print(key.imageUrl);
        postList.add(
          Post(
            userId: value['userId'],
            imageUrl: value['imageUrl'],
            title: value['title'],
            text: value['text'],
          ),
        );
      },
    );
    return postList;
  }

  Future<int> getPostLength() async {
    String user = await AuthService().currentUser();
    //TODO Made a change to the lengthReference connection "child('users').child(user).child('posts')"
    final lengthReference =
        connection.child('users').child(user).child('posts');
    int postLength =
        await lengthReference.once().then((value) => value.value.length);
    return postLength;
  }

  Future<void> setBio(String bio) async {
    String user = await AuthService().currentUser();
    //TODO changed bio
    final bioRef = connection.child('users').child(user);
    bioRef.update(
      {
        'bio': "$bio",
      },
    );
  }

  Future<void> setuserName(String userName) async {
    String user = await AuthService().currentUser();
    //TODO changed userNames to userName
    final userNameRef = connection.child('users').child(user);
    userNameRef.update({
      'userName': "@$userName",
    });
  }

  Future<void> setUserName(String name) async {
    String user = await AuthService().currentUser();
    final nameRef = connection.child('users').child(user);
    nameRef.update(
      {
        'name': "$name",
      },
    );

    Future<void> setProfilePic({String imageUrl}) async {
      String user = await AuthService().currentUser();

      print("SAVINGGG Profile");
      print(user);

      final profileRef = connection.child('users').child(user);
      profileRef.update({
        'profile_pic': imageUrl,
      });
    }
  }

  Future<void> saveProfilePic({imageUrl}) async {
    String user = await AuthService().currentUser();

    print("SAVINGGG PROFILE");
    print(user);

    // String postId = Uuid().v1();

    final profileRef = connection.child('users').child(user);
    profileRef.set(
      {
        'profile_pic': imageUrl,
      },
    );
  }

  Future<void> updateStoryDisplay({imageUrl}) async {
    print("UPDATING DISPLAY");

    final displayRef = connection.child('display').child('stories');
    displayRef.update({
      'imageUrl': imageUrl,
    });
  }

  Future<void> updatePostDisplay({imageUrl}) async {
    print("UPDATING DISPLAY");

    final displayRef = connection.child('display').child('post');
    displayRef.update({
      'imageUrl': imageUrl,
    });
  }
}
// class DataService {}
