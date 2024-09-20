import 'package:flutter/material.dart';
import 'package:my_money_replica/Usage.dart';

class NextScreen extends StatefulWidget {
  @override
  _NextScreenState createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  bool isNotificationOn = false; // To toggle notification state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set background color to black
      appBar: AppBar(
        title: null, // Remove the title
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false, // Remove the back arrow
        elevation: 0, // Remove shadow if necessary
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image from assets
            Image.asset(
              'image/notification.png',
              height: 200,
              width: 200,
              // fit: BoxFit.cover,
            ),
            Divider(
              height: 30,
              color: Colors.yellow[200], // Horizontal line
            ),
            // Text "Remind everyday to add your expenses?"
            Text(
              'Remind everyday to add your expenses?',
              style: TextStyle(
                color: Colors.yellow[200], // Set text color to light yellow
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            Divider(
              height: 30,
              color: Colors.yellow[200], // Horizontal line
            ),
            // Row with text and notification toggle
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Show reminder notification',
                  style: TextStyle(
                    color: Colors.yellow[200], // Set text color
                    fontSize: 16,
                  ),
                ),
                Switch(
                  value: isNotificationOn,
                  onChanged: (value) {
                    setState(() {
                      isNotificationOn = value;

                      // Show popup message when notification is turned on
                      if (isNotificationOn) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('You turned on the notification'),
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
            // Info icon and text in the same row
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
                    'Turn on reminder to get daily notifications for adding expenses. You can always change it later.',
                    style: TextStyle(
                      color: Colors.yellow[200], // Set text color
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            Spacer(), // Pushes the buttons to the bottom
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
                      MaterialPageRoute(builder: (context) => FinalScreen()),
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
