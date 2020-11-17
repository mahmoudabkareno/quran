import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class comentpage extends StatefulWidget {
  @override
  _comentpageState createState() => _comentpageState();
}

class _comentpageState extends State<comentpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('commentPage'),
        backgroundColor: Colors.grey,
      ),
      backgroundColor: Colors.grey,
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Text('Comment'),
            ),
            Divider(),
            ListTile(
              trailing: Icon(
                  Icons.send,
                color: Colors.white,
              ),
              title: TextField(
                decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(45),
                        borderSide: BorderSide(
                            color: Colors.black
                        )
                    ),
                  enabledBorder:  UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(45),
                      borderSide: BorderSide(
                          color: Colors.black
                      )
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.comment),
                  hintText: 'enter your comment'
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
