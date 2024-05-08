import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TermsConditionScreen extends StatelessWidget {
  const TermsConditionScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Terms & Conditions",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 38, 140, 101),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome to Medic!',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                '''These Terms and Conditions ("Terms") govern your access and use of the Medideal mobile application Medic, a platform that connects users with healthcare providers for appointment scheduling. By accessing or using the App, you agree to be bound by these Terms.''',
              ),
              SizedBox(height: 20),
              Text(
                '1. Eligibility',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                '''You must be at least 18 years old and have the legal capacity to enter into a binding agreement to use the App.''',
              ),
              SizedBox(height: 20),
              Text(
                '2. User Accounts',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                '''You may be required to create an account ("Account") to access certain features of the App. You are responsible for maintaining the confidentiality of your account information, including your username and password. You agree to accept responsibility for all activities that occur under your Account.''',
              ),
              SizedBox(height: 20),
              Text(
                '3. Appointment Scheduling',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                '''Medideal facilitates appointment scheduling between users and healthcare providers listed on the App. You are responsible for verifying the qualifications and credentials of any healthcare provider you choose to schedule an appointment with. Medideal does not endorse or recommend any specific healthcare provider. Appointment cancellation policies are set by each healthcare provider. Be sure to review and understand the cancellation policy before scheduling an appointment.''',
              ),
              SizedBox(height: 20),
              Text(
                '4. User Content',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                '''You may be permitted to submit information, data, or text through the App ("User Content"). You are solely responsible for your User Content and represent that you have the right to submit such Content. You agree not to submit any User Content that is illegal, defamatory, hateful, or otherwise objectionable.''',
              ),
              SizedBox(height: 20),
              Text(
                '5. Disclaimers',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                '''Medideal does not provide medical advice. The App is intended to facilitate communication between users and healthcare providers and does not replace the need for professional medical care. Medideal is not responsible for the accuracy, completeness, or timeliness of information provided by healthcare providers on the App. Medideal is not responsible for any interactions or outcomes between users and healthcare providers.''',
              ),
              SizedBox(height: 20),
              Text(
                '6. Limitation of Liability',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                '''Medideal is not liable for any damages arising out of your use of the App, including but not limited to, indirect, incidental, consequential, or punitive damages.''',
              ),
              SizedBox(height: 20),
              Text(
                '7. Termination',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                '''Medideal may terminate your access to the App for any reason, at any time, without notice.''',
              ),
              SizedBox(height: 20),
              Text(
                '8. Updates',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                '''Medideal may update the App and these Terms from time to time. You agree to be bound by any such updates.''',
              ),
              SizedBox(height: 20),
              Text(
                '9. Governing Law',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                '''These Terms shall be governed by and construed in accordance with the laws of [insert your jurisdiction].''',
              ),
              SizedBox(height: 20),
              Text(
                '10. Entire Agreement',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                '''These Terms constitute the entire agreement between you and Medideal regarding your use of the App.''',
              ),
              SizedBox(height: 20),
              Text(
                '11. Contact Us',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                '''If you have any questions about these Terms, please contact us at rahmakundupuzakkal7384@gmail.com.''',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
