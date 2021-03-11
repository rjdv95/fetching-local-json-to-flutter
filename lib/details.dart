import 'package:flutter/material.dart';
import 'dart:ui' as prefix0;
import 'User.dart';

class DetailPage extends StatelessWidget {

  final User user;

  DetailPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(user.title+" Details"),
        ),
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(25.0),
              child: Center(
                child: CircleAvatar(
                  backgroundImage:
                  NetworkImage( user.imageURL),
                  maxRadius: 80.0,
                ),
              ),
            ),

            Text(user.title,
                style: TextStyle(
                    fontWeight: prefix0.FontWeight.w500,
                    fontSize: 32.0
                )),

            Text(user.description_short,
                style: TextStyle(
                    fontWeight: prefix0.FontWeight.w300,
                    fontSize: 20.0
                )),

            Divider(
              color: Colors.black87,
            ),

            Container(
              margin: EdgeInsets.all(25.0),
              child: ListTile(
                leading: Icon(
                  Icons.info_outline,
                  color: Colors.deepPurpleAccent,
                ),
                title: Text(user.description,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontStyle: FontStyle.normal,
                  ),),
                subtitle: Text(user.text,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            )



          ],
        )
    );
  }
}