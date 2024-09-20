import 'package:flutter/material.dart';
import 'todo_screen.dart'; // Import the TodoScreen

class AddHereScreen extends StatefulWidget {
  @override
  _AddHereScreenState createState() => _AddHereScreenState();
}

class _AddHereScreenState extends State<AddHereScreen> {
  String transactionType = 'INCOME'; // Default transaction type
  String notes = '';
  String amount = '0'; // Initial amount

  double previousAmount = 0; // Store the previous amount for operations
  String currentOperator = ''; // Store the current operator (+, -, ×, ÷)
  String displayText = '0'; // Text to show the current input and operator

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton.icon(
              onPressed: () {
                Navigator.pop(
                    context); // Navigate back to previous screen on CANCEL
              },
              icon: Icon(Icons.close, color: Colors.yellow[200]),
              label: Text(
                'CANCEL',
                style: TextStyle(color: Colors.yellow[200]),
              ),
            ),
            TextButton.icon(
              onPressed: () {
                _onSave(); // Trigger save functionality
              },
              icon: Icon(Icons.check, color: Colors.yellow[200]),
              label: Text(
                'SAVE',
                style: TextStyle(color: Colors.yellow[200]),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.black, // Set the background color to black
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildTransactionOption(
                        'INCOME', Icons.arrow_downward, Colors.green),
                    SizedBox(width: 10),
                    _buildTransactionOption(
                        'EXPENSE', Icons.arrow_upward, Colors.red),
                    SizedBox(width: 10),
                    _buildTransactionOption(
                        'TRANSFER', Icons.compare_arrows, Colors.blue),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildAccountCategoryBox(
                        'Account', Icons.account_balance_wallet),
                    SizedBox(width: 10),
                    _buildAccountCategoryBox('Category', Icons.category),
                  ],
                ),
                SizedBox(height: 20),
                _buildNotesSection(),
                SizedBox(height: 20),
                _buildAmountBox(),
                SizedBox(height: 20),
                _buildCalculatorRow(['+', '7', '8', '9']),
                _buildCalculatorRow(['-', '4', '5', '6']),
                _buildCalculatorRow(['×', '1', '2', '3']),
                _buildCalculatorRow(['÷', '0', '.', '=']),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}', // Current date
                      style: TextStyle(color: Colors.yellow[200]),
                    ),
                    SizedBox(width: 10),
                    Text(
                      '${TimeOfDay.now().format(context)}', // Current time
                      style: TextStyle(color: Colors.yellow[200]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onSave() {
    // Convert amount from string to double
    double amountValue = double.tryParse(amount) ?? 0;

    // Pass the notes and amount
    Navigator.pop(
      context,
      {
        'notes': notes,
        'amount': amountValue,
      },
    );
  }

  Widget _buildTransactionOption(String type, IconData icon, Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          transactionType = type;
        });
      },
      child: Row(
        children: [
          Icon(
            icon,
            color: transactionType == type ? color : Colors.yellow[200],
          ),
          SizedBox(width: 5),
          Text(
            type,
            style: TextStyle(
              color: transactionType == type ? color : Colors.yellow[200],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountCategoryBox(String title, IconData icon) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.yellow[200]),
            SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(color: Colors.yellow[200]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotesSection() {
    return TextField(
      maxLines: 6,
      decoration: InputDecoration(
        labelText: 'Add notes',
        labelStyle: TextStyle(color: Colors.yellow[200]),
        fillColor: Colors.grey[800],
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      style: TextStyle(color: Colors.yellow[200]),
      onChanged: (value) {
        setState(() {
          notes = value;
        });
      },
    );
  }

  Widget _buildAmountBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                displayText, // Display the current amount, operator, and input
                style: TextStyle(color: Colors.yellow[200], fontSize: 24),
                maxLines: 1,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                amount = '0'; // Clear the amount
                displayText = '0'; // Reset the display
              });
            },
            icon: Icon(Icons.clear, color: Colors.yellow[200]),
          ),
        ],
      ),
    );
  }

  Widget _buildCalculatorRow(List<String> buttons) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: buttons.map((button) {
        return _buildCalculatorButton(button);
      }).toList(),
    );
  }

  Widget _buildCalculatorButton(String label) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _onCalculatorButtonClick(label);
          });
        },
        child: Container(
          margin: const EdgeInsets.all(4),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: Colors.yellow[200],
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onCalculatorButtonClick(String label) {
    if (label == '=') {
      double currentAmount = double.tryParse(amount) ?? 0;
      double result = 0;

      switch (currentOperator) {
        case '+':
          result = previousAmount + currentAmount;
          break;
        case '-':
          result = previousAmount - currentAmount;
          break;
        case '×':
          result = previousAmount * currentAmount;
          break;
        case '÷':
          result = currentAmount != 0 ? previousAmount / currentAmount : 0;
          break;
        default:
          return;
      }

      setState(() {
        amount = result.toString();
        displayText = result.toString();
        currentOperator = '';
      });
    } else if (['+', '-', '×', '÷'].contains(label)) {
      previousAmount = double.tryParse(amount) ?? 0;
      currentOperator = label;
      amount = '0';
      displayText = '$previousAmount $currentOperator ';
    } else {
      if (amount == '0') {
        amount = label;
      } else {
        amount += label;
      }
      displayText += label;
    }
  }
}
