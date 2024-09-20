import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'todo_screen.dart'; // Import TodoScreen

class FinalScreen extends StatefulWidget {
  @override
  _FinalScreenState createState() => _FinalScreenState();
}

class _FinalScreenState extends State<FinalScreen> {
  bool isStatisticsOn = false; // To toggle crash/usage statistics state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set the background color to black
      appBar: AppBar(
        title: null, // Remove the title
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false, // Remove the back arrow
        elevation: 0, // Remove shadow if needed
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Subtitle "Your personal finance manager"
            Text(
              'Your personal finance manager',
              style: TextStyle(
                fontSize: 18,
                color: Colors.yellow[200], // Set text color to light yellow
              ),
              textAlign: TextAlign.center,
            ),
            Divider(
              height: 30,
              color: Colors.yellow[200], // Horizontal line
            ),
            // Text about crash reports and usage statistics
            Text(
              'Help improve My Money by sending usage statistics and crash reports.',
              style: TextStyle(
                color: Colors.yellow[200], // Set text color
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            Divider(
              height: 30,
              color: Colors.yellow[200], // Horizontal line
            ),
            // Text "Send crash and usage statistics" with toggle
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Send crash and usage statistics',
                  style: TextStyle(
                    color: Colors.yellow[200], // Set text color
                    fontSize: 16,
                  ),
                ),
                Switch(
                  value: isStatisticsOn,
                  onChanged: (value) {
                    setState(() {
                      isStatisticsOn = value;
                      if (isStatisticsOn) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('You turned on the statistics'),
                            backgroundColor: Colors
                                .green, // Optional background color for the SnackBar
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    });
                  },
                  activeColor: Colors.green,
                ),
              ],
            ),
            SizedBox(height: 20),
            // Info icon and detailed text in the same row
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // CircleAvatar with border
                Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.yellow, // Border color
                      width: 3.0, // Border width
                    ),
                  ),
                  child: CircleAvatar(
                    backgroundColor:
                        Colors.black, // Background color inside the avatar
                    child: Text(
                      'i',
                      style: TextStyle(
                        color:
                            Colors.yellow[200], // Text color inside the avatar
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'When turned ON, usage statistics and crash reports will be sent automatically in order to fix app errors faster. You can always turn it OFF later in preferences.',
                    style: TextStyle(
                      color: Colors.yellow[200], // Set text color
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            // Checked circle icon and terms agreement text
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 24,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      text: 'By continuing, you agree to My Money\'s ',
                      style: TextStyle(
                        color: Colors.yellow[200], // Set text color
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          text: 'Terms & Privacy Policy.',
                          style: TextStyle(
                            color: Colors.blue[200], // Link color
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Handle tap on "Terms & Privacy Policy"
                              print('Terms & Privacy Policy tapped');
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Spacer(), // Pushes buttons to the bottom
            // Row for Back and Next buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Go back to the previous screen
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.yellow[200], // Button text color
                    backgroundColor: Colors.black, // Button background color
                  ),
                  child: Text('BACK'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TodoScreen(
                            // Replace with actual value
                            ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.yellow[200], // Button text color
                    backgroundColor: Colors.black, // Button background color
                  ),
                  child: Text('NEXT'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
