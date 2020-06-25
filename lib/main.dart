import 'package:flutter/material.dart';
import 'package:fixx_app/register.dart';
import 'package:fixx_app/login.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3498DB),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Column(
                    children: <Widget>[
                      SizedBox(height: 50,),
                      Image.asset('images/logo.png',
                        width:250.0,
                        height: 250.0,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(height: 20,),
                      Icon(
                        Icons.games,
                        size: 50.0,
                        color: Colors.white70,

                      ),
                      SizedBox(
                        height: 50.0,

                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Material(
                          elevation: 5.0,
                          color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.circular(30.0),
                          child: MaterialButton(
                            onPressed: () {
                              //Go to login screen.
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LoginScreen()),
                              );

                            },
                            minWidth: 200.0,
                            height: 42.0,
                            child: Text(
                              'Log In',
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 0.0),
                        child: Material(
                          elevation: 5.0,
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(30.0),
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => RegistrationScreen()),
                              );

                              //Go to login screen.

                            },
                            minWidth: 200.0,
                            height: 42.0,
                            child: Text(
                              'Register',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ]
                ),
              ),
            )

          ],),


      ),

    );
  }
}
