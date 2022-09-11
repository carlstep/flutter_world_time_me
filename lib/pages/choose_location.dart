import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  void getData() async {
    // simulates network request for a username
    await Future.delayed(const Duration(seconds: 3), () {
      print('ypshi');
    });

// simulates network request for user bio
    Future.delayed(const Duration(seconds: 2), () {
      print('vegan, musician');
    });

    print('statement');
  }

  int counter = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    print('choose_location - initState function ran');
  }

  @override
  Widget build(BuildContext context) {
    print('build - the information is loading...');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ElevatedButton(
        onPressed: () {
          setState(() {
            counter += 1;
          });
        },
        child: Text('counter is: $counter'),
      ),
    );
  }
}
