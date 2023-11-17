import 'package:flutter/material.dart';
import 'AddReview.dart';
import 'main.dart';

// class ProfilePage extends StatelessWidget {
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  int reloadCount = 0; // Counter to trigger a reload

  void reloadPage() {
    setState(() {
      reloadCount++;
      print("reload count: $reloadCount"); // Increment the counter to trigger a rebuild
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // Center the title
        title: const Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            Row(
              //need to load all this information from database later on, for now these are placeholders
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('User 123', // Username here (make it change based on database)
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Text('since: ##/##/####', // artist name here
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin:const EdgeInsets.all(20.0),
                  width: 170.0,
                  height: 170.0,
                  color: Colors.blue, // Example background color
                  child: Center(
                    child: Image.asset('assets/ProfilePic.jpg'), // song album cover here
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Bio: ',
                  border: InputBorder.none,
                ),
                maxLines: 5,
                onChanged: (String value) {
                  // Handle the text input
                  print('User Bio Entry: $value');
                },
              ),
            ),
            const Text('Total Reviews: ##', // add function to count total number of reviews per user
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: 100,
              height: 300,
              //padding: EdgeInsets.all(16.0),
              child: ListView(
                children: <Widget>[
                  for (int i = 1; i <= 20; i++) // Example: Display 20 items
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
                          const SizedBox(width: 50),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              SizedBox(height: 15),
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
                              Text('Album', // album name here
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 100),
                          Text('#/#', // album name here
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
                    onPressed: () {
                      // Refreshes the Home Page back to top
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage(title: 'Welcome User1234!')),
                      );
                    },
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
                    onPressed: reloadPage,
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
