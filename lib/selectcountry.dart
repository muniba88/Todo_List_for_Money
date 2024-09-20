import 'package:flutter/material.dart';
import 'package:my_money_replica/notification.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CurrencySelectionScreen(),
    );
  }
}

class CurrencySelectionScreen extends StatefulWidget {
  @override
  _CurrencySelectionScreenState createState() =>
      _CurrencySelectionScreenState();
}

class _CurrencySelectionScreenState extends State<CurrencySelectionScreen> {
  String selectedCountry = '';

  final List<Map<String, dynamic>> countries = [
    {'name': 'United States', 'currency': 'USD', 'icon': Icons.attach_money},
    {'name': 'United Kingdom', 'currency': 'GBP', 'icon': Icons.euro_symbol},
    {'name': 'Japan', 'currency': 'JPY', 'icon': Icons.money},
    {'name': 'Pakistan', 'currency': 'PKR', 'icon': Icons.currency_rupee},
    {'name': 'Eurozone', 'currency': 'EUR', 'icon': Icons.euro},
    {
      'name': 'Switzerland',
      'currency': 'Swiss Franc',
      'icon': Icons.currency_bitcoin
    },
    {'name': 'India', 'currency': 'IND', 'icon': Icons.currency_rupee},
    {
      'name': 'Canada',
      'currency': 'Canadian Dollar',
      'icon': Icons.attach_money
    },
    {'name': 'China', 'currency': 'Chinese Yuan', 'icon': Icons.currency_yuan},
    {
      'name': 'South Korea',
      'currency': '	South Korean Won',
      'icon': Icons.attach_money
    },
    {
      'name': 'Brazil',
      'currency': '	Brazilian Real',
      'icon': Icons.attach_money
    },
    {
      'name': 'Norway',
      'currency': '	Norwegian Krone',
      'icon': Icons.attach_money
    },
    {
      'name': 'Turkey',
      'currency': '	Turkish Lira',
      'icon': Icons.currency_lira
    },
    {'name': 'Sweden', 'currency': 'Swedish Krona', 'icon': Icons.attach_money},
    {
      'name': 'Singapore',
      'currency': 'Singapore Dollar',
      'icon': Icons.attach_money
    },
    {
      'name': 'New Zealand',
      'currency': 'New Zealand Dollar',
      'icon': Icons.attach_money
    },
    {
      'name': 'Hong Kong',
      'currency': 'Hong Kong Dollar',
      'icon': Icons.attach_money
    },
    {
      'name': 'Malaysia',
      'currency': '	Malaysian Ringgit',
      'icon': Icons.attach_money
    },
  ];

  void _onCountrySelected(String country) {
    setState(() {
      selectedCountry = country;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set background color to black
      appBar: AppBar(
        title: null, // Remove the title from AppBar
        backgroundColor: Colors.black, // Set AppBar background color to black
        elevation: 0, // Remove shadow/elevation if necessary
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Welcome',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.yellow[200], // Set text color to light yellow
              ),
              textAlign: TextAlign.center,
            ),
            Divider(
              height: 30,
              color: Colors.yellow[200], // Divider in light yellow
            ),
            Expanded(
              child: ListView.builder(
                itemCount: countries.length,
                itemBuilder: (context, index) {
                  var country = countries[index];
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _onCountrySelected(country['name']);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(country['icon'],
                                    color: Colors.yellow[200]),
                                SizedBox(width: 10),
                                Text(
                                  country['name'],
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.yellow[200], // Set text color
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  '(${country['currency']})',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.yellow[100], // Currency color
                                  ),
                                ),
                              ],
                            ),
                            if (selectedCountry == country['name'])
                              Icon(Icons.check, color: Colors.green),
                          ],
                        ),
                      ),
                      Divider(
                        height: 30,
                        color: Colors
                            .yellow[200], // Horizontal line after each country
                      ),
                    ],
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: selectedCountry.isNotEmpty
                    ? () {
                        // Navigate to next screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NextScreen(),
                          ),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  iconColor: Colors.yellow[200], // Button color light yellow
                  backgroundColor: Colors.black, // Text color inside button
                ),
                child: Text(
                  'NEXT >',
                  style: TextStyle(
                    color: Colors.yellow[200],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
