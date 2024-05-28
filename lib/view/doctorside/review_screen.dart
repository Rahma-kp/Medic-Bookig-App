import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DoctorReviewScreen extends StatelessWidget {
  const DoctorReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample list of reviews
    final List<Review> reviews = [
      Review(
        patientName: 'John Smith',
        rating: 4.5,
        reviewText: 'Great doctor! Very attentive and knowledgeable.',
      ),
      Review(
        patientName: 'Jane Doe',
        rating: 5.0,
        reviewText: 'Excellent experience! Highly recommend.',
      ),
      Review(
        patientName: 'Michael Johnson',
        rating: 4.0,
        reviewText: 'Good service and friendly staff.',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color.fromARGB(255, 241, 240, 240),
        title: Text(
          'Reviews',
          style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor:Color.fromARGB(255, 241, 240, 240),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: reviews.length,
          itemBuilder: (context, index) {
            final review = reviews[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.patientName,
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    RatingBarIndicator(
                      rating: review.rating,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 20.0,
                      direction: Axis.horizontal,
                    ),
                    SizedBox(height: 10),
                    Text(
                      review.reviewText,
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Review {
  final String patientName;
  final double rating;
  final String reviewText;

  Review({
    required this.patientName,
    required this.rating,
    required this.reviewText,
  });
}
