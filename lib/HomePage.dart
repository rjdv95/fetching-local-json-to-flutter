
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'dart:convert';
//import 'package:http/http.dart' as http;
import 'User.dart';
import 'details.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
// Here we create a Future fn that will get data from server
  Future<List<User>> _getUsers() async {

    //store the response of the request in data
    var response = await DefaultAssetBundle.of(context).loadString('assets/DemoData.json');

    //now seperate the data using decode fn and passing the data body
    var jsonData = json.decode(response);

    //jsonData contains Array List so we can loop over it to get the data from it

    //create an array list
    List<User> users = [];

    for(var u in jsonData){

      //loop over to get each user object
      User user = User(u["id"],u["title"],u["description_short"],u["description"],u["text"],u["imageURL"]);

      //add each use to the users array
      users.add(user);
    }

    print(users.length);

    return users;

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: Drawer(
        elevation: 10.0,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
                child: Text("User Details",textAlign: TextAlign.start,style: TextStyle(fontSize: 30.0),),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Colors.purple, Colors.deepPurple]
                    )
                )
            ),

            ListTile(
              leading: Icon(
                  Icons.close
              ),
              title: Text("Close Icon"),
              subtitle: Text("Closes NavDrawer!"),
              selected: true,
              onTap: (){
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Icon(
                  Icons.face
              ),
              title: Text("Face Icon"),
              subtitle: Text("Its a Face icon!"),
              onTap: (){
                return true;
              },
            ),

            ListTile(
              leading: Icon(
                  Icons.attach_file
              ),
              title: Text("Attach Icon"),
              subtitle: Text("Its an Attach icon!"),
              onTap: (){
                return true;
              },
            ),

            ListTile(
              leading: Icon(
                  Icons.audiotrack
              ),
              title: Text("Audio Icon"),
              subtitle: Text("Its a Audio icon!"),
              onTap: (){
                return true;
              },
            ),

            ListTile(

              leading: Icon(
                  Icons.backup
              ),
              title: Text("Backup Icon"),
              subtitle: Text("Its a BackUp icon!"),
              onTap: (){
                return true;
              },
            ),

          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: new Text(widget.title),
      ),
      body: Container(
        child: FutureBuilder(
          future: _getUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot){

            if(snapshot.data == null){
              return Container(
                child: Center(
                  child: Text("Loading..."),
                ),
              );
            }
            else{
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int id){

                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          snapshot.data[id].imageURL
                      ),
                    ),
                    title: Text(snapshot.data[id].title),
                    subtitle: Text(snapshot.data[id].description_short),
                    onTap: (){

                      Navigator.push(context,
                          new MaterialPageRoute(builder: (context) => DetailPage(snapshot.data[id]))
                      );
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}