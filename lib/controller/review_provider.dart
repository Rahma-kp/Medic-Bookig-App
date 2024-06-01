import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medic/model/review_model.dart';
import 'package:medic/model/user_model.dart';
import 'package:medic/service/firestore_service.dart';

class ReviewController extends ChangeNotifier {
  FireStoreService fireStoreService = FireStoreService();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  TextEditingController reviewController = TextEditingController();
  List<ReviewModel> allReviews = [];
  List<ReviewModel> myReviews = [];
  addReview(String courseId) async {
    final data = ReviewModel(
        content: reviewController.text.trim(),
        courseId: courseId,
        reviewId: firebaseAuth.currentUser!.uid + DateTime.now().toString(),
        timeStamp: DateTime.now(),
        like: 5,
        uId: firebaseAuth.currentUser!.uid);
    await fireStoreService.addReview(data);
    reviewController.clear();
    getAllReviews(courseId);

    notifyListeners();
  }

  getAllReviews(String courseId) async {
    try {
      List<ReviewModel> items = await fireStoreService.getAllReviews(courseId);
      List<UserModel> allUser = await fireStoreService.getAllUser();
      allReviews.clear();
      for (var item in items) {
        UserModel? user = allUser.firstWhere((user) => user.uId == item.uId,
            orElse: () => UserModel());
        ReviewModel selectedItem = ReviewModel(
          username: user.userName ?? '',
          userPic: user.profilePic ?? '',
          content: item.content,
          like: item.like,
          timeStamp: item.timeStamp,
        );
        allReviews.add(selectedItem);
      }
      notifyListeners();
    } catch (e) {
      log('message$e');
    }
  }

  // getSortedReview(String adminId) async {
  //   await getAllUser();
  //   return sortedUser =
  //       allUsers!.firstWhere((element) => element.uId == adminId);
  //   // notifyListeners();
  // }

  getMyReviews(String uId) async {
    try {
      List<ReviewModel> items = await fireStoreService.getMyReviews();
      myReviews = items.where((element) => element.uId == uId).toList();
      // List<UserModel> allUser = await fireStoreService.getAllUser();
      // myReviews.clear();
      // log(myReviews.length.toString());
      // for (var item in items) {
      //   UserModel? user = allUser.firstWhere((user) => user.uId == item.uId,
      //       );
      //   ReviewModel selectedItem = ReviewModel(
      //     username: user.userName ?? '',
      //     userPic: user.profilePic ?? '',
      //     content: item.content,
      //     like: item.like,
      //     timeStamp: item.timeStamp,
      //   );
      //   myReviews.add(selectedItem);
      // }
      notifyListeners();
    } catch (e) {
      log('message$e');
    }
  }
}