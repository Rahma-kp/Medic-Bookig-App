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
  String? patients;
  String? experience;
  String? rating;
  int? fee;
  String? email;
  String? password;

  DoctorModel(
      {this.id,
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
      this.patients,
      this.experience,
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
        patients: json['patients'],
        experience: json['experience'],
        email: json['eamil'],
        password: json['password'],
        fee:
            json['fee'] is int ? json['fee'] : int.tryParse(json['fee'] ?? '0'),
        rating: json['rating']);
  }

  Map<String, dynamic> toJson() {
    return {
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
      'patients': patients,
      'experience': experience,
      'rating': rating,
      'fee': fee
    };
  }
}
