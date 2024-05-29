import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medic/model/user_model.dart';

class FireStoreService {
  String userCollection = "user";
  String doctorCollection = 'doctor';
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Reference storage = FirebaseStorage.instance.ref();
 

  updateUserDetails(UserModel data) async {
    try {
      await firestore
          .collection(userCollection)
          .doc(firebaseAuth.currentUser!.uid)
          .update(data.toJson());
      log('Profile Updated Successfully');
    } catch (e) {
      throw 'Profile Update Error : $e';
    }
  }

  updateProfilePic(imageFile, {String? imagePath}) async {
    String imageName = await DateTime.now().millisecondsSinceEpoch.toString();
    try {
      Reference imageFolder =
          storage.child('UserProfile').child('$imageName.jpg');

      if (imagePath != null) {
        Reference deleteImage = storage.child(imagePath);
        await deleteImage.delete();
        log('The current Image Successfully deleted from Firebase Storage.');
      }

      await imageFolder.putFile(imageFile);
      log('Image successfully uploaded to Firebase Storage.');
      return imageFolder;
    } catch (e) {
      throw 'Error in Update profile pic : $e';
    }
  }

  Future<UserModel?> getCurrentUser() async {
    try {
      if (firebaseAuth.currentUser != null) {
        DocumentSnapshot<Map<String, dynamic>> snapshot =
            await FirebaseFirestore.instance
                .collection(userCollection)
                .doc(firebaseAuth.currentUser?.uid)
                .get();

        if (snapshot.exists) {
          return UserModel.fromJson(snapshot.data());
        } else {
          log("User does not exist in alluser collection");
          return null;
        }
      }
      {
        return null;
      }
    } on FirebaseException catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<List<UserModel>> getAllUser() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await firestore.collection(userCollection).get();

      List<UserModel> data =
          snapshot.docs.map((e) => UserModel.fromJson(e.data())).toList();

      return data;
    } catch (e) {
      log('get error: $e');
      throw e;
    }
  }


  

  uploadFile(file, {String? filePath}) async {
    String fileName = await DateTime.now().millisecondsSinceEpoch.toString();
    try {
      Reference fileFolder =
          storage.child('course File').child('$fileName.mp4');

      if (filePath != null) {
        Reference deletefile = storage.child(filePath);
        await deletefile.delete();
        log('The current file Successfully deleted from Firebase Storage.');
      }
      await fileFolder.putFile(file);
      log('file successfully uploaded to Firebase Storage.');
      return fileFolder;
    } catch (e) {
      throw 'Error in Update file : $e';
    }
  }


  // addToBookmark(SubDataModel data) async {
  //   try {
  //     await firestore
  //         .collection(userCollection)
  //         .doc(firebaseAuth.currentUser!.uid)
  //         .collection('bookmark')
  //         .doc(data.itemId)
  //         .set(data.toJson());
  //   } catch (e) {
  //     throw 'Error in add to bookmark: $e';
  //   }
  // }

  // getBookmarkItems() async {
  //   try {
  //     final items = await firestore
  //         .collection(userCollection)
  //         .doc(firebaseAuth.currentUser!.uid)
  //         .collection('bookmark')
  //         .get();
  //     return items.docs.map((e) => SubDataModel.fromJson(e.data())).toList();
  //   } catch (e) {}
  // }

  // deleteFromBookmark(String itemId) async {
  //   try {
  //     await firestore
  //         .collection(userCollection)
  //         .doc(firebaseAuth.currentUser!.uid)
  //         .collection('bookmark')
  //         .doc(itemId)
  //         .delete();
  //   } catch (e) {}
  // }

  // addReview(ReviewModel data) async {
  //   try {
  //     await firestore
  //         .collection(courseCollection)
  //         .doc(data.courseId)
  //         .collection('review')
  //         .doc(data.reviewId)
  //         .set(data.toJson());
  //   } catch (e) {
  //     throw 'Error in add Review $e';
  //   }
  // }

  // getAllReviews(String courseId) async {
  //   try {
  //     final data = await firestore
  //         .collection(courseCollection)
  //         .doc(courseId)
  //         .collection('review')
  //         .get();
  //     return data.docs
  //         .map((item) => ReviewModel.fromJson(item.data()))
  //         .toList();
  //   } catch (e) {
  //     throw 'Error in getDat: $e';
  //   }
  // }

  // getMyReviews() async {
  //   try {
  //     final data = await firestore
  //         .collection(courseCollection)
  //         .doc()
  //         .collection('review')
  //         .get();
  //     return data.docs
  //         .map((item) => ReviewModel.fromJson(item.data()))
  //         .toList();
  //   } catch (e) {
  //     throw 'Error in get my reviews: $e';
  //   }
  // }

  // addRatings(RatingModel data) async {
  //   try {
  //     await firestore
  //         .collection(courseCollection)
  //         .doc(data.courseId)
  //         .collection('ratings')
  //         .doc(data.uId)
  //         .set(data.toJson());
  //   } catch (e) {
  //     throw 'Error in add Rating $e';
  //   }
  // }

  // updateRatingOnCourse(String courseId, double totalRating) async {
  //   try {
  //     await firestore
  //         .collection(courseCollection)
  //         .doc(courseId)
  //         .update({'rating': totalRating});
  //   } catch (e) {
  //     throw 'Error in update rating : $e';
  //   }
  // }

  // getAllRatings(String courseId) async {
  //   try {
  //     final data = await firestore
  //         .collection(courseCollection)
  //         .doc(courseId)
  //         .collection('ratings')
  //         .get();
  //     return data.docs
  //         .map((item) => RatingModel.fromJson(item.data()))
  //         .toList();
  //   } catch (e) {
  //     throw 'Error in get rating Data: $e';
  //   }
  // }

  // sendNotification(NotificationModel data) async {
  //   try {
  //     await firestore
  //         .collection(userCollection)
  //         .doc(data.receiverId)
  //         .collection('notification')
  //         .doc(data.id)
  //         .set(data.toJson());
  //     log('notification send');
  //   } catch (e) {
  //     throw 'Error in send notification : $e';
  //   }
  // }

  getNotifications() async {
    try {
      final snapshots = await firestore
          .collection(userCollection)
          .doc(firebaseAuth.currentUser!.uid)
          .collection('notification')
          .orderBy('timeStamp', descending: true)
          .snapshots();
      return snapshots;
    } catch (e) {
      throw 'Error in get Notification Data: $e';
    }
  }

  deleteNotification(String id) async {
    try {
      await firestore
          .collection(userCollection)
          .doc(firebaseAuth.currentUser!.uid)
          .collection('notification')
          .doc(id)
          .delete();
      // log('message');
    } catch (e) {
      throw e;
    }
  }

  // followMentor(String mentorId) {
  //   try {
  //     firestore.collection(userCollection).doc(mentorId).update({
  //       'followers': FieldValue.arrayUnion([firebaseAuth.currentUser!.uid])
  //     });
  //   } catch (e) {
  //     throw "Error in follow mentor : $e";
  //   }
  // }



  unFollowMentor(String mentorId) {
    try {
      firestore.collection(userCollection).doc(mentorId).update({
        'followers': FieldValue.arrayRemove([firebaseAuth.currentUser!.uid])
      });
    } catch (e) {
      throw "Error in follow mentor : $e";
    }
  }

  selcectedUser(String userId) async {
    try {
      return await firestore.collection(userCollection).doc(userId).snapshots();
    } catch (e) {
      throw "Error from checkFollowers service:  $e";
    }
  }
  Future<List<Map<String, dynamic>>> getDoctorList() async {
    try {
      QuerySnapshot querySnapshot = await firestore.collection('doctors').get();
      return querySnapshot.docs.map((doc) {
        return {
          'email': doc['email'],
          'password': doc['password'],
        };
      }).toList();
    } catch (e) {
      throw Exception('Failed to fetch doctor list');
    }
  }
}


