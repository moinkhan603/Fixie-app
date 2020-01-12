import 'package:flutter/material.dart';
import 'finals.dart';

 class dis extends StatefulWidget {
   //dis(this.img,this.con);
  String img;
   String con;
   dis({@required this.img,@required  this.con});
  //myVariables myobj=myVariables(img,con);
  @override
  _State createState() => _State();


}
String LD="you need to follow the steps"
    "you need to follow the steps"
    "you need to follow the steps"
    "you need to follow the steps"
    "you need to follow the steps";


class _State extends State<dis> {

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      bottomNavigationBar: makeBottom,
      appBar: AppBar(centerTitle: true,
        elevation: 10,
        actions: <Widget>[
          Icon(Icons.person_outline,size: 35,),


        ],

        title: Text('WELCOME',),



        backgroundColor: Colors.red,),
      body:

      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          Expanded(

              child:Container(


            height: 160,
            width: 100,
            child: Column(

               // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //crossAxisAlignment: CrossAxisAlignment.s,
                children: <Widget>[

                  Image(
                    image: new AssetImage(widget.img),
                    height: 250,
                    width: 280.0,),
                  Text(widget.con,style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 30.0,color: Colors.white
                  ),),
                  Divider(height: 15.0,color: Colors.white,
                    indent: 40,endIndent: 40,
                  ),

                  SizedBox(height: 20),

                     Text(LD,style: TextStyle(
                        fontSize: 20.0,color: Colors.white70
                    ),
                     textAlign: TextAlign.center,
                     ),


                  Icon(Icons.near_me, color: Colors.white, size: 35.0),


                  GestureDetector(
                    onTap: (){

                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => info()));

                    },
                    child: Container(
                      child: Center(
                        child: Text('PROCEED',style:
                        TextStyle(fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),

                        ),
                      ),

                      //margin: EdgeInsets.only(top: 10.0),
                      margin: EdgeInsets.fromLTRB(25, 10, 25, 5),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          border: Border.all(color: Colors.white,
                              style: BorderStyle.solid) ,

                          borderRadius: BorderRadius.circular(15.0)
                      ),
                      height: 60,





                    ),
                  ),





                ]









            ),


            margin: EdgeInsets.all(1.0),
            decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(15.0)
            ),


          )),


        ],



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


          //  Navigator.pop();
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

