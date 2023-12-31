import 'package:flutter/material.dart';
import 'ProfilePage.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AddReview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: 80.0),
          child: Text("Add Review"),
        ),
      ),
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(15.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: EdgeInsets.all(12.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                onSubmitted: (String value) {
                  // make it search for the string through the database
                  print('Search query: $value');
                },
              ),
            ),
            Row(
              //need to load all this information from database later on, for now these are placeholders
              children: [
                Container(
                  margin:EdgeInsets.all(20.0),
                  width: 150.0,
                  height: 150.0,
                  color: Colors.blue, // Example background color
                  child: Center(
                    child: Image.asset('assets/FlawsAndAll.jpg'), // song album cover here
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('bad', // song title here
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Text('wave to earth', // artist name here
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(height: 50.0),
                    Text('0.1 flaws and all.', // album name here
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 50.0, right: 100, top: 10, bottom: 10),
                  child: Text(
                    'Released:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: Text(
                    '04/20/2023', // album release date here
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Container(
              alignment: Alignment.center,
              child: const Text(
                'Rating',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10.0),
                ),
              child: RatingBar.builder(
                initialRating: 0,
                itemCount: 5,
                allowHalfRating: true,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (value) {
                  print('Rated $value stars');
                },
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.only(left: 25), // Adjust the left padding
              child: const Text(
                'Add Review:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
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
                  hintText: 'Type your entry here...',
                  border: InputBorder.none,
                ),
                maxLines: 8,
                onChanged: (String value) {
                  // Handle the text input
                  print('User Entry: $value');
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigates to the profile page with the updated review
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
