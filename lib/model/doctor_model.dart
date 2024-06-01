class DoctorModel {
  String? id;
  String? image;
  String? fullName;
  String? age;
  String? gender;
  String? category;
  String? position;
  String? aboutDoctor;
  String? workingDays;
  String? startTime;
  String? endTime;
  String? experience;
  String? rating;
  int? fee;
  String? email;
  String? password;
  List? wishlist;

  DoctorModel(
      {required this.id,
      this.image,
      this.fullName,
      this.age,
      this.gender,
      this.category,
      this.position,
      this.workingDays,
      this.startTime,
      this.endTime,
      this.fee,
      this.email,
      this.password,
      this.aboutDoctor,
      this.experience,
     this.wishlist,
      this.rating});

  double get ratingAsDouble {
    return double.tryParse(rating!) ?? 0.0;
  }

  factory DoctorModel.fromJson(String id, Map<String, dynamic> json) {
    return DoctorModel(
        id: id,
        image: json['image'],
        fullName: json['fullName'],
        age: json['age'],
        gender: json['gender'],
        category: json['category'],
        position: json['position'],
        workingDays: json['workingDays'],
        startTime: json['startTime'],
        endTime: json['endTime'],
        aboutDoctor: json['aboutDoctor'],
        experience: json['experience'],
        email: json['eamil'],
        password: json['password'],
        wishlist: List<String>.from(json['wishlist']),
        fee:
            json['fee'] is int ? json['fee'] : int.tryParse(json['fee'] ?? '0'),
        rating: json['rating']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id':id,
      'image': image,
      'fullName': fullName,
      'password': password,
      'eamil': email,
      'age': age,
      'gender': gender,
      'category': category,
      'workingDays': workingDays,
      'startTime': startTime,
      'endTime': endTime,
      'aboutDoctor': aboutDoctor,
      'experience': experience,
      'rating': rating,
      'fee': fee,
      'wishlist':wishlist,
    };
  }
}
