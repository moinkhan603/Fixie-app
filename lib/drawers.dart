
import 'package:flutter/material.dart';
import 'package:fixx_app/display.dart';
import 'package:firebase_auth/firebase_auth.dart';
class draw extends StatefulWidget {
  @override
  _drawState createState() => _drawState();
}
String laptop="LAPTOP REPAIR";
String mobile="MOBILE REPAIR";
String electronic="ELECTRONIC"
    " REPAIR";
String img="images/lap.png";
String img2="images/mob.png";
String img3="images/el.png";
class _drawState extends State<draw> {

  final _auth=FirebaseAuth.instance;
  FirebaseUser loggedinUser;

void getuser()async
{
  try {
    final user = await _auth.currentUser();
    if (user != null) {
      loggedinUser = user;
      print(loggedinUser.email);
    }
  }
  catch(e)
  {
    print(e);
  }
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: makeBottom,
      appBar: AppBar(centerTitle: true,
        elevation: 10,
        actions: <Widget>[
          //Icon(Icons.person_outline,size: 35,),
          IconButton(
            icon: Icon(Icons.person_outline,size: 35,),
            onPressed: (){
              _auth.signOut();
              Navigator.pop(context);
            },
          )


        ],

        title: Text('WELCOME',),



        backgroundColor: Colors.red,),
      body:

      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

            Expanded(

              child: GestureDetector(
          onTap:(){

        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => dis(img: img,con:laptop)));
    },
                  child:
              new ReusableCard(title:laptop,i: img)),

            //),
          ),
          Expanded(

            child: GestureDetector(
                onTap:(){
                  //myVariables myobj=myVariables(laptop,img);
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => dis(img: img2,con:mobile)));
                },
                child:
                new ReusableCard(title:mobile,i: img2)),

            //),
          ),
          Expanded(

            child: GestureDetector(
                onTap:(){
                  //myVariables myobj=myVariables(laptop,img);
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => dis(img: img3,con:electronic)));
                },
                child:
                new ReusableCard(title:electronic,i: img3)),

            //),
          ),


        ],

      ),

      drawer: Drawer(

        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.redAccent,

                image: DecorationImage(
                    fit: BoxFit.fill,
                    image:  AssetImage('images/logo.png')),

              ),

            ),

            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),);
  }
}


final makeBottom = Container(
  height: 55.0,
  child: BottomAppBar(
    color: Colors.red,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.home, color: Colors.white),
          onPressed: () {

          },
        ),
        IconButton(
          icon: Icon(Icons.blur_on, color: Colors.white),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.hotel, color: Colors.white),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.account_box, color: Colors.white),
          onPressed: () {},
        )
      ],
    ),
  ),
);



class ReusableCard extends StatelessWidget {

  //final Color colour;
  //final Widget cardChild;
  String i;
  String title;
  ReusableCard({@required this.title,this.i});

  @override
  Widget build(BuildContext context) {

    return Container(

      height: 160,
      width: 100,
      child: Row(

          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            Image(
              image: new AssetImage(i),
              height: 250,
              width: 150.0,),
            Text(title,style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 20.0,color: Colors.white
            ),),
            SizedBox(width: 20),
            Icon(Icons.near_me, color: Colors.white, size: 35.0),
          ]


      ),






      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(15.0)
      ),
    );
  }
}


