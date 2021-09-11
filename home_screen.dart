import 'package:flutter/material.dart';
import 'package:age_prediction/name_api.dart';
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

  String? userName;
  int? age = 0;
  int? count = 0;

  void setupNameAPI(String name) async {
    NameAPI startup = NameAPI(name);
    await startup.getAge(name);

      userName = startup.named!;
      age = startup.age!;
      count = startup.count!;
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
              onChanged: (text) {
                print('Name: $text');
              },
            ),
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
            MaterialButton(
              onPressed: () {setupNameAPI(myController.text);},
              color: Colors.blueAccent,
              child: Text("Calculate", style: TextStyle(color: Colors.white),),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text("Age : $age"),
          ],
        ),
      ),
    );
  }
}
