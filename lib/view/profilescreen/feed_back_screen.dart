import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedBackScreen extends StatefulWidget {
  @override
  _FeedBackScreenState createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen> {
  String _feedback = '';
  int _rating = 3;

  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(backgroundColor:Color.fromARGB(255, 38, 140, 101) ,
        content: Text(message,style: TextStyle(color: Colors.white),),
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback Form'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'How satisfied are you with our service?',
                style: TextStyle(fontSize: 20),
              ),
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.sentiment_very_dissatisfied,
                      size: 40,
                    ),
                    onPressed: () => setState(() => _rating = 1),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.sentiment_dissatisfied,
                      size: 40,
                    ),
                    onPressed: () => setState(() => _rating = 2),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.sentiment_neutral,
                      size: 40,
                    ),
                    onPressed: () => setState(() => _rating = 3),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.sentiment_satisfied,
                      size: 40,
                    ),
                    onPressed: () => setState(() => _rating = 4),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.sentiment_very_satisfied,
                      size: 40,
                    ),
                    onPressed: () => setState(() => _rating = 5),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                'Additional Comments:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    _feedback = value;
                  });
                },
                maxLines: 4,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Type your feedback here...',
                ),
              ),
              SizedBox(height: 20.0),
              Center(
                child: GestureDetector(
                  onTap: () {
                    _showSnackbar(context, 'Feedback submitted!');
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 50,
                    width: 200,
                    child: Center(
                      child: Text(
                        "Submit",
                        style: GoogleFonts.aBeeZee(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 38, 140, 101),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
