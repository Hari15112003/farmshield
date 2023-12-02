// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmshield/models/user_model.dart';
import 'package:farmshield/utils/color_util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String? _uid;
  String get uid => _uid!;
  UserModel? _userModel;

  UserModel get userModel => _userModel!;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  AuthProvider() {
    // checkSign();
  }

  // void checkSign() async {
  //   final SharedPreferences s = await SharedPreferences.getInstance();
  //   // _isSignedIn = s.getBool("is_signedin") ?? false;
  //   notifyListeners();
  // }

  // Future setSignIn() async {
  //   final SharedPreferences s = await SharedPreferences.getInstance();
  //   s.setBool("is_signedin", true);
  //   _isSignedIn = true;
  //   notifyListeners();
  // }

  Future<bool> checkExistingUser() async {
    DocumentSnapshot snapshot =
        await _firebaseFirestore.collection("users").doc(_uid).get();
    if (snapshot.exists) {
      // ignore: avoid_print
      print("USER EXISTS");
      return true;
    } else {
      // ignore: avoid_print
      print("NEW USER");
      return false;
    }
  }

  void createAccount(
      {required TextEditingController emailController,
      required TextEditingController passwordController,
      required BuildContext context}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      User? user = _firebaseAuth.currentUser!;
      // carry our logic
      _uid = user.phoneNumber;
          _isLoading = false;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.toString());
      _isLoading = false;
      notifyListeners();
    }
  }

  void saveUserDataToFirebase({
    required BuildContext context,
    required UserModel userModel,
    required File profilePic,
    required Function onSuccess,
  }) async {
    _isLoading = true;
    notifyListeners();
    try {
      // uploading image to firebase storage.
      await storeFileToStorage("profilePic/$_uid", profilePic).then((value) {
        userModel.profilePic = value;
      });
      _userModel = userModel;

      // uploading to database
      await _firebaseFirestore
          .collection("users")
          .doc(_uid)
          .set(userModel.toMap())
          .then((value) {
        onSuccess();
        _isLoading = false;
        notifyListeners();
      });
    } on (FirebaseAuthException, FirebaseException) catch (e) {
      showSnackBar(context, e.toString());
      _isLoading = false;
      notifyListeners();
    }
  }

  // Future signUpFunction() async {
  //   // showDialog(
  //   //     context: context,
  //   //     barrierDismissible: false,
  //   //     builder: (context) => const Center(
  //   //           child: CircularProgressIndicator(),
  //   //         ));
  //   try {
  //     await FirebaseAuth.instance
  //         .createUserWithEmailAndPassword(
  //             email: emailController.text.trim(),
  //             password: passwordContoller.text.trim())

  //   }
  //   // GlobalKey<NavigatorState>().currentState!.pop();
  // }

  void updateUserDataToFirebase({
    required BuildContext context,
    required UserModel userModel,
    required File profilePic,
    required Function onSuccess,
  }) async {
    {
      _isLoading = true;
      notifyListeners();
      try {
        // uploading image to firebase storage.
        await storeFileToStorage("profilePic/$_uid", profilePic).then((value) {
          userModel.profilePic = value;
          userModel.createdAt =
              DateTime.now().millisecondsSinceEpoch.toString();
          // userModel.uid = _firebaseAuth.currentUser!.phoneNumber!;
        });
        _userModel = userModel;

        // uploading to database
        await _firebaseFirestore
            .collection("users")
            .doc(_uid)
            .set(userModel.toMap())
            .then((value) {
          onSuccess();
          _isLoading = false;
          notifyListeners();
        });
      } on FirebaseAuthException catch (e) {
        showSnackBar(context, e.message.toString());
        _isLoading = false;
        notifyListeners();
      }
    }
  }

  Future<String> storeFileToStorage(String ref, File file) async {
    UploadTask uploadTask = _firebaseStorage.ref().child(ref).putFile(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future getDataFromFirestore() async {
    await _firebaseFirestore
        .collection("users")
        .doc(_firebaseAuth.currentUser!.uid)
        .get()
        .then((DocumentSnapshot snapshot) {
      _userModel = UserModel(
        name: snapshot['name'],
        email: snapshot['email'],
        gender: snapshot['gender'],
        createdAt: snapshot['createdAt'],
        age: snapshot['age'],
        uid: snapshot['uid'],
        profilePic: snapshot['profilePic'],
        phoneNumber: snapshot['phoneNumber'],
      );
      _uid = userModel.uid;
    });
  }

  Future saveUserDataToSP() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    await s.setString("user_model", jsonEncode(userModel.toMap()));
  }

  Future getDataFromSP() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    String data = s.getString("user_model") ?? '';
    _userModel = UserModel.fromMap(jsonDecode(data));
    // _uid = _userModel!.uid;
    notifyListeners();
  }

  Future userSignOut() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    await _firebaseAuth.signOut();

    notifyListeners();
    s.clear();
  }
}
