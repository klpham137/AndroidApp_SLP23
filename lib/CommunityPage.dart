import 'package:flutter/material.dart';

class CommunityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.only(left: 80.0),
            child: Text("Community Tab"),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              for(int i = 0; i < 10; i++)
                Container(
                  alignment: Alignment.center,
                  color: Colors.blue,
                  padding: EdgeInsets.all(20.0),
                  margin: EdgeInsets.all(20.0),
                  height: 200,
                  child: Align(
                    alignment: Alignment(-0.9,-0.2),
                    child:
                      Text(
                        'Review ${i + 1}',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ),
            ],
          ),
        )
    );
  }
}
