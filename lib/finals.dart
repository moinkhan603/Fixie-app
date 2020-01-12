import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';


class info extends StatefulWidget {
  @override
  _infoState createState() => _infoState();
}
String _value;
class _infoState extends State<info> {

  String firstName;
  String lastName;
  String phoneNumber;
  String cnic;
  String description;

  final _auth=FirebaseAuth.instance;
  FirebaseUser loggedinUser;
  final databaseReference = FirebaseDatabase.instance.reference();
String myuser;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuser();
  }
  void getuser()async
  {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedinUser = user;
        print(loggedinUser.email);
        myuser=loggedinUser.email;
      }
    }
    catch(e)
    {
      print(e);
    }
  }

  void createRecord(String f,String l,String p,String c,String d){



  databaseReference.child(firstName).set({
      'First Name': f,
      'Last Name': l,
      'Phone Number': p,
      'CNIC': c,
      'Description': d
    });
print(f);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body:
      ListView(

            padding: const EdgeInsets.all(0),
            children: <Widget>[
              Container(

                height: 280,
                color: Colors.black87,
                child: Image(
                  image: new AssetImage('images/lap.png'),
                  height: 150,
                  width: 180.0,),
              ),
              SizedBox(height: 5,),
              Text('Submit Request',

                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 35.0,color: Colors.red,
                letterSpacing: 5
              ),),
              Divider(height: 25.0,color: Colors.black,

                indent: 40,endIndent: 40,

              ),
              SizedBox(height: 25,),

              Text('SELECT YOUR PACKAGE',

                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 25.0,color: Colors.green,

                ),),
              SizedBox(height: 25,),

              Container(
                color: Colors.lightGreenAccent,
                margin: const EdgeInsets.only(right: 15, left: 15),
                child:

                DropdownButton<String>(
                  elevation: 15,
                  iconDisabledColor: Colors.red,
                   style: TextStyle(color: Colors.red,
                   fontWeight: FontWeight.bold,
                   fontStyle: FontStyle.italic,

                   fontSize: 20),
                  icon: Icon(Icons.laptop,size: 35,

                  ),

                  items: [
                    DropdownMenuItem<String>(
                      child: Text('Screen Replacement  1500 PKR'),
                      value: 'one',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('Hardware Problem 5000 PKR'),
                      value: 'two',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('Software Problem 1000 PKR'),
                      value: 'three',
                    ),
                  ],
                  onChanged: (String value) {
                    setState(() {
                      _value = value;
                    });
                  },
                  hint: Text('Select Item'),
                  value: _value,
                ),
              ),
              SizedBox(height: 25,),
              Container(
                  margin: const EdgeInsets.only(right: 15, left: 15),
          child: TextField(
              onChanged: (value){
                firstName=value;
              },

              decoration: InputDecoration(

            border: OutlineInputBorder(),
              labelText: "First Name",
              hintText: "First Name")
          )

              ),

              SizedBox(height: 30,),

              Container(
                  margin: const EdgeInsets.only(right: 15, left: 15),
                  child: TextField(
                      onChanged: (value){
                         lastName=value;
                      },

                      decoration: InputDecoration(

                          border: OutlineInputBorder(),
                          labelText: "Last Name",
                          hintText: "Last Name")
                  )

              ),
              SizedBox(height: 30,),

              Container(
                  margin: const EdgeInsets.only(right: 15, left: 15),
                  child: TextField(
                      onChanged: (value){
                   phoneNumber=value;
                      },
                      decoration: InputDecoration(

                          border: OutlineInputBorder(),
                          labelText: "Phone Number",
                          hintText: "Phone Number")
                  )

              ),
              SizedBox(height: 30,),
              Container(
                  margin: const EdgeInsets.only(right: 15, left: 15),
                  child: TextField(
                      onChanged: (value){
                        cnic=value;
                      },
                      decoration: InputDecoration(

                          border: OutlineInputBorder(),

                          labelText: "CNIC NO",
                          hintText: "CNIC NO")
                  )

              ),
              SizedBox(height: 20,),
              Container(

                  margin: const EdgeInsets.only(right: 15, left: 15),
                  child: TextField(
                      onChanged: (value){
                      description=value;
                      },
                       maxLines: 10,
                       maxLength: 500,

                      decoration: InputDecoration(

                          border: OutlineInputBorder(),

                          labelText: "DESCRIPTION",
                          hintText: "DESCRIPTION")
                  )

              ),
              SizedBox(height: 20,),


              GestureDetector(
                onTap: (){

                  createRecord(firstName, lastName, phoneNumber, cnic, description);
                  _showDialog();

                },
                child: Container(
                  child: Center(
                    child: Text('PLace Order',style:
                    TextStyle(fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),

                    ),
                  ),

                  //margin: EdgeInsets.only(top: 10.0),
                  margin: EdgeInsets.fromLTRB(25, 10, 25, 5),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      border: Border.all(color: Colors.white,
                          style: BorderStyle.solid) ,

                      borderRadius: BorderRadius.circular(15.0)
                  ),
                  height: 60,





                ),
              )





            ],
          ),





    );
  }
  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Congratulations.."),
          content: new Text("Your Order has been placd"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

