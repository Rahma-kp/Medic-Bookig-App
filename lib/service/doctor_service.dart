import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medic/model/doctor_model.dart';

class  DoctorService {
  String doctors = 'doctor';
  late CollectionReference<DoctorModel> doctor;
  final ImagePicker imagePicker = ImagePicker();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Reference storage = FirebaseStorage.instance.ref();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  DoctorService() {
    doctor = firebaseFirestore.collection(doctors).withConverter<DoctorModel>(
        fromFirestore: (snapshot, options) {
      return DoctorModel.fromJson(snapshot.id, snapshot.data()!);
    }, toFirestore: (value, options) {
      return value.toJson();
    });
  }

  Future<void> addDoctor(DoctorModel data) async {
    try {
      await doctor.add(data);
    } catch (error) {
      log('error during adding doctor :$error');
    }
  }

  Future<void> deleteDoctor(String id) async {
    try {
      await doctor.doc(id).delete();
    } catch (error) {
      log('error during deleting doctor :$error');
    }
  }

  Future<List<DoctorModel>> getAllDoctors() async {
    final snapshot = await doctor.get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  
Future<List<DoctorModel>> getDoctorsByCategory(String category) async {
  try {
    final snapshot = await doctor.where('category', isEqualTo: category).get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  } catch (error) {
    log('error during fetching doctors by category: $error'); 
    return [];
  }
}

  Future<String> uploadImage(imageName, imageFile) async {
    Reference imageFolder = storage.child('productImage');
    Reference? uploadImage = imageFolder.child('$imageName.jpg');

    await uploadImage.putFile(imageFile);
    String downloadURL = await uploadImage.getDownloadURL();
    log('Image successfully uploaded to Firebase Storage.');
    return downloadURL;
  }

  Future<File?> pickImage(ImageSource source) async {
    final pickedFile = await imagePicker.pickImage(source: source);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }
  
  Future<void> wishListClicked(String id, bool status) async {
    try {
      if (status == true) {
        await doctor.doc(id).update({
          'wishlist': FieldValue.arrayUnion([
            firebaseAuth.currentUser!.email ??
                firebaseAuth.currentUser!.phoneNumber
          ])
        });
      } else {
        await doctor.doc(id).update({
          'wishlist': FieldValue.arrayRemove([
            firebaseAuth.currentUser!.email ??
                firebaseAuth.currentUser!.phoneNumber
          ])
        });
      }
    } catch (e) {
      log('got a error of :$e');
    }
  }
}

