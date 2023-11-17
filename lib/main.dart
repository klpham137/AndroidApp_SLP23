import 'package:flutter/material.dart';

import 'AddReview.dart';
import 'ProfilePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Welcome User1234!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int reloadCount = 0; // Counter to trigger a reload

  void reloadPage() {
    setState(() {
      reloadCount++;
      print("reload count: $reloadCount"); // Increment the counter to trigger a rebuild
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Center(
          child: Text(widget.title),
        ),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).

          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Create a container to hold the buttons and divider
            Container(
              padding: const EdgeInsets.all(16.0), // Adjust the padding as needed
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Adjust the alignment as needed
                children: <Widget>[
                  // Button 1
                  TextButton(
                    onPressed: () {
                      // Navigates to the Community Page
                    },
                    child: const Text("Community"),
                  ),
                  // Divider
                  Container(
                    height: 48.0, // Adjust the height of the divider as needed
                    width: 1.0, // Adjust the width of the divider as needed
                    color: Colors.grey, // Color of the divider
                  ),
                  // Button 2
                  TextButton(
                    onPressed: () {
                      // Navigates to the Search Page
                    },
                    child: const Text("Search"),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 210, top: 20),
              child: const Text('Top 10 Trending',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Scrollable List Container
            Expanded( // Use Expanded widget to take up remaining space
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: ListView(
                  children: <Widget>[
                    for (int i = 1; i <= 10; i++)
                      SizedBox(
                        height: 80.0, // Adjust the height as needed
                        child: Row(
                          //need to load all this information from database later on, for now these are placeholders
                          children: [
                            Container(
                              margin:EdgeInsets.all(15.0),
                              width: 50.0,
                              height: 50.0,
                              color: Colors.blue, // Example background color
                              child: Center(
                                child: Image.asset('assets/placeholder.jpg'), // song album cover here
                              ),
                            ),
                            const SizedBox(width: 25),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                SizedBox(height: 20),
                                Text('Song Title', // song title here
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 7.0),
                                Text('Artist', // artist name here
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 150),
                            Text('#/5', // album name here
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
            // Container for IconButtons with Border
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue, // Border color
                  width: 2.0, // Border width
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  // Icon Button 1
                  IconButton(
                    onPressed: reloadPage,
                    icon: const Icon(
                        Icons.music_note_outlined,
                        size: 40.0, ),
                  ),
                  // Icon Button 2
                  IconButton(
                    onPressed: () {
                      // Navigates to add review page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddReview()),
                      );
                    },
                    icon: const Icon(
                        Icons.add_circle,
                        size: 40.0, ),
                  ),
                  // Icon Button 3
                  IconButton(
                    onPressed: () {
                      // Navigates to Profile Page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfilePage()),
                      );
                    },
                    icon: const Icon(
                        Icons.person,
                        size: 40.0, ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
