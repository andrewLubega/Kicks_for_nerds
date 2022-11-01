import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:kicks_for_nerds/models/myAppUser.dart';
import 'package:kicks_for_nerds/models/product.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'auth.dart';
import 'dart:core';

class DataBase {
  final connection = FirebaseDatabase.instance.ref();

  DataBase({uid});

  // String uid = '';

// TODO rename to createFlutterArticleUser
  Future<void> updateFlutterArticlesUser(
    final User user,
    final String legalName,
    final String userName,
  ) async {
    final usersReference = connection.child('users').child(user.uid);
    await usersReference.set(
      {
        'uid': user.uid,
        'email': user.email,
        'userName': userName,
        'name': legalName,
        'bio': "Write about yourself.",
        'banner': " ",
        'profile_pic':
            "https://mediastudies.ugis.berkeley.edu/wp-content/themes/sydney-pro-child/images/user-default.png",
      },
    );
  }

  Future<MyAppUser?> getUserData(User user) async {
    MyAppUser? myAppUser;

    final usersReference = connection.child('users').child(user.uid);
    await usersReference.get().then(
      (data) {
        myAppUser = MyAppUser(
          uid: (data.value as Map<String, String>)['uid'],
          email: (data.value as Map<String, String>)['email'],
          userName: (data.value as Map<String, String>)['userName'],
          name: (data.value as Map<String, String>)['name'],
        );
      },
    );
    return myAppUser;
  }

  // story saving function
  Future<void> saveStory({required String imageUrl}) async {
    String user = await AuthService().currentUser();

    print("SAVINGGG STORY");
    print(user);

    String storyId = Uuid().v1();

    final globalStoryRef =
        connection.child('global').child('stories').child(storyId);
    globalStoryRef.set({
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
  Future<List<Story>> getStory({required AsyncSnapshot snapshot}) async {
    String user = await AuthService().currentUser();
    final storyReference =
        connection.child('users').child(user).child('stories');
    final List<Story> storyList = [];
    final Map<dynamic, dynamic> storyMap = snapshot.data;

    print("GOT STORY");
    print(user);

    storyMap.forEach(
      (key, value) {
        storyList.add(
          Story(
            imageUrl: value['imageUrl'],
            userId: value['userId'],
          ),
        );
      },
    );

    return storyList;
  }

  Future<List<Story>> getGlobalStory({required AsyncSnapshot snapshot}) async {
    String user = await AuthService().currentUser();
    final storyReference = connection.child('global').child('stories');
    final List<Story> globalStoryList = [];
    final Map<dynamic, dynamic> storyMap = snapshot.data;

    print("GOT STORY");
    print(user);

    storyMap.forEach((key, value) {
      globalStoryList.add(
        Story(
          imageUrl: value['imageUrl'],
          userId: value['userId'],
        ),
      );
    });

    return globalStoryList;
  }

  Future<void> savePost({
    releaseDate,
    productName,
    description,
    colorway,
    shoeSize,
    imageUrl,
  }) async {
    String user = await AuthService().currentUser();

    print("SAVINGGG POST");
    print(user);

    String postId = Uuid().v1();

    final gloablPostRef =
        connection.child('global').child('posts').child(postId);
    gloablPostRef.set(
      {
        'userUid': user,
        'release_date': releaseDate,
        'description': description,
        'product_name': productName,
        'colorway': colorway,
        'shoeSize': shoeSize,
        'imageUrl': imageUrl,
      },
    );

    final postReference =
        connection.child('users').child(user).child('posts').child(postId);
    postReference.set(
      {
        'userUid': user,
        'release_date': releaseDate,
        'description': description,
        'product_name': productName,
        'colorway': colorway,
        'shoeSize': shoeSize,
        'imageUrl': imageUrl,
      },
    );
  }

  Future<List<Product>> getProduct() async {
    List<Product> productList = [];
    String user = await AuthService().currentUser();

    final DatabaseReference postReference =
        connection.child('users').child(user).child('posts');

    final postEventRef = await postReference.once(DatabaseEventType.value);
    final Map postMap = postEventRef.snapshot.value as Map;

    postMap.forEach(
      (key, product) {
        productList.add(
          new Product.fromjson(product),
        );
      },
    );

    return productList;
  }

  Future<List<Product>> getGlobalProducts() async {
    final List<Product> globalProductList = [];
    String user = await AuthService().currentUser();

    final DatabaseReference postReference =
        connection.child('global').child('posts');
    final postEventRef = await postReference.once(DatabaseEventType.value);
    final Map postMap = postEventRef.snapshot.value as Map;

    postMap.forEach(
      (key, product) {
        // print("added");
        globalProductList.add(
          Product.fromjson(product),
        );
      },
    );

    return globalProductList;
  }

  Future<int> getProductLength() async {
    List<Product> postList = [];
    String user = await AuthService().currentUser();

    final DatabaseReference postReference =
        connection.child('users').child(user).child('posts');

    final event = await postReference.once(DatabaseEventType.value);
    final Map postMap = event.snapshot.value as Map;

    postMap.forEach(
      (key, product) {
        // print("added");
        postList.add(
          Product.fromjson(product),
        );
      },
    );

    print(postList.length.toInt().toString());
    print("post length ^");

    return postList.length;
  }

  Future<void> removeProduct({productId}) async {
    String user = await AuthService().currentUser();

    final productRef =
        connection.child('users').child(user).child('posts').child(productId);
    await productRef.remove();

    final productGlobalRef =
        connection.child('global').child('posts').child(productId);
    await productGlobalRef.remove();
  }

  Future<void> removeStory({storyId}) async {
    String user = await AuthService().currentUser();

    final storyRef =
        connection.child('users').child(user).child('stories').child(storyId);
    await storyRef.remove();

    final storyGlobalRef =
        connection.child('global').child('stories').child(storyId);
    await storyGlobalRef.remove();
  }

  Future<void> updateBio(String bio) async {
    String user = await AuthService().currentUser();
    //TODO changed bio
    final bioRef = connection.child('users').child(user);
    bioRef.update(
      {
        'bio': "$bio",
      },
    );
  }

  Future<void> updateUserName(String userName) async {
    String user = await AuthService().currentUser();
    //TODO changed userNames to userName
    final userNameRef = connection.child('users').child(user);
    userNameRef.update(
      {
        'userName': "@${userName}",
      },
    );
  }

  Future<void> updateLegalName(String legalName) async {
    String user = await AuthService().currentUser();
    final nameRef = connection.child('users').child(user);
    nameRef.update(
      {
        'name': "${legalName}",
      },
    );
  }

  Future<void> saveProfilePic({imageUrl}) async {
    String user = await AuthService().currentUser();

    print("SAVINGGG PROFILE");
    print(imageUrl);

    final profileRef = connection.child('users').child(user);

    await profileRef.update(
      {
        'profile_pic': imageUrl,
      },
    );
  }

  Future<void> saveProfileBanner({imageUrl}) async {
    String user = await AuthService().currentUser();

    print("SAVINGGG PROFILE");
    print(imageUrl);

    final profileRef = connection.child('users').child(user);

    await profileRef.update(
      {
        'banner': imageUrl,
      },
    );
  }

  Future<String> getbio() async {
    String user = await AuthService().currentUser();
    //TODO changed bio

    var bio;

    final bioRef = connection.child('users').child(user);

    final userEventRef = await bioRef.once(DatabaseEventType.value);

    var data = userEventRef.snapshot.value as Map;

    bio = data['bio'];

    return bio;
  }

  Future<String> getUsername() async {
    String user = await AuthService().currentUser();
    //TODO changed bio

    var userName;

    final userNameRef = connection.child('users').child(user);

    final userEventRef = await userNameRef.once(DatabaseEventType.value);

    var data = userEventRef.snapshot.value as Map;

    userName = data['userName'];

    return userName;
  }

  Future<String> getLegalName() async {
    String user = await AuthService().currentUser();
    //TODO changed bio

    var legalName;

    final userNameRef = connection.child('users').child(user);

    final userEventRef = await userNameRef.once(DatabaseEventType.value);

    var data = userEventRef.snapshot.value as Map;

    legalName = data['name'];

    return legalName;
  }

  Future<String> getProfilePic() async {
    String user = await AuthService().currentUser();

    var url;

    print("SAVINGGG PROFILE");

    final profileRef = connection.child('users').child(user);

    final profileEventRef = await profileRef.once(DatabaseEventType.value);

    var data = profileEventRef.snapshot.value as Map;

    url = data['profile_pic'];
    print(url);

    return url;
  }

  Future<String> getProfileBanner() async {
    String user = await AuthService().currentUser();

    var url;

    print("SAVINGGG PROFILE");

    final profileRef = connection.child('users').child(user);

    final profileEventRef = await profileRef.once(DatabaseEventType.value);

    var data = profileEventRef.snapshot.value as Map;

    url = data['banner'];
    print(url);

    return url;
  }

  Future<void> updateStoryDisplay({imageUrl}) async {
    print("UPDATING DISPLAY");

    String storyId = Uuid().v1();

    final globalDisplayRef =
        connection.child('global').child('stories').child(storyId);
    globalDisplayRef.update({
      'imageUrl': imageUrl,
    });

    final displayRef = connection.child('display').child('stories');
    displayRef.update({
      'imageUrl': imageUrl,
    });
  }

  Future<void> updateProductDisplay({imageUrl}) async {
    print("UPDATING DISPLAY");

    String postId = Uuid().v1();

    final globalDisplayRef =
        connection.child('global').child('posts').child(postId);
    globalDisplayRef.update({
      'imageUrl': imageUrl,
    });

    final displayRef = connection.child('display').child('posts').child(postId);
    displayRef.update({
      'imageUrl': imageUrl,
    });
  }
}
