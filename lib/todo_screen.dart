import 'package:flutter/material.dart';
import 'package:my_money_replica/addhere_screen.dart';

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<Map<String, dynamic>> transactions =
      []; // List to store notes and amounts

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Todo List',
          style: TextStyle(color: Colors.yellow[200]),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            // Conditional display of the image and text when the list is empty
            if (transactions.isEmpty)
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 100,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'image/checklist.png', // Replace with your image path
                        fit: BoxFit
                            .cover, // This will make the image cover the entire space
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 436),
                          Text(
                            'Add your money info',
                            style: TextStyle(
                                color: Colors.yellow[200], fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            else
              Expanded(
                child: ListView.builder(
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.grey[800],
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              transactions[index]['notes'],
                              style: TextStyle(
                                  color: Colors.yellow[200],
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Amount: ${transactions[index]['amount']}',
                              style: TextStyle(color: Colors.yellow[200]),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddHereScreen()),
                  );

                  if (result != null) {
                    setState(() {
                      transactions.add(result);
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.yellow[200],
                ),
                child: Text('Add Note'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
