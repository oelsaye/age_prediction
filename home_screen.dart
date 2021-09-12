import 'package:flutter/material.dart';
import 'package:age_prediction/name_api.dart';
import 'package:age_prediction/country_identifier.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();

  String? userName = '[ENTER NAME]';
  int? age = 0;
  int? count = 0;
  String countryname = '[ENTER COUNTRY]';
  String dropdownValue = 'Country';
  String actualvalue = 'CA';

  void setupNameAPI(String name, String country) async {

    NameAPI startup = NameAPI(name, actualvalue);
    await startup.getAge(name, actualvalue);

    userName = startup.named!;
    age = startup.age!;
    count = startup.count!;
    country = actualvalue;
    countryname = dropdownValue;

    setState(() {

    });
  }

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    myController.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    //print('Name: ${myController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Age Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: myController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                fillColor: Colors.blueAccent,
                //icon: Icon(Icons.accessibility),
                hintText: 'Input Name',
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                  NameIdentifier changed = NameIdentifier(dropdownValue);
                  changed.getCountry(dropdownValue);
                  actualvalue = changed.initials;
                });
              },
              items: <String>['Country', 'France', 'Italy', 'Spain',
                'Turkey', 'Germany', 'United Kingdom', 'Russia',
                'Saudi Arabia', 'Japan', 'Canada', 'United States'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(
              height: 20.0,
            ),
            MaterialButton(
              onPressed: () {
                setupNameAPI(myController.text, actualvalue);
                },
              color: Colors.blueAccent,
              child: Text("Calculate", style: TextStyle(color: Colors.white),),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text("Age : $age for $userName in $countryname", style: TextStyle(fontSize: 20.0,),),
          ],
        ),
      ),
    );
  }
}
