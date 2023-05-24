
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sweetncoloursadmin/authenticate/register.dart';
import 'package:sweetncoloursadmin/authenticate/signin.dart';
import 'package:sweetncoloursadmin/drawer%20guest.dart';
import 'package:sweetncoloursadmin/drawer.dart';
import 'package:sweetncoloursadmin/models/product.dart';
import 'package:sweetncoloursadmin/services/database.dart';
import 'package:sweetncoloursadmin/slider.dart';
import 'package:sweetncoloursadmin/prod.dart';
class MyHomePageGuest extends StatefulWidget {
  const MyHomePageGuest({super.key});

  @override
  State<MyHomePageGuest> createState() => _MyHomePageGuestState();
}

class _MyHomePageGuestState extends State<MyHomePageGuest> {
  bool showSignIn=false;
  bool showSignUp=false;
  
  @override
  Widget build(BuildContext context) {
    
    
    void showSignInPanel()
  {
    setState(() {
      showSignIn=true;
    showSignUp=false;
    });
    
  }
  void showSignUpPanel()
  {
    setState(() {
      showSignIn=false;
    showSignUp=true;
    });
    
  }
  
 
    return Scaffold(
      //Color.fromRGBO(215,15,100, 1)
       backgroundColor: Colors.grey[100],
      drawer:MyDrawerGuest(showSignIn: showSignInPanel,showSignUp: showSignUpPanel),
      appBar:  AppBar(
        leading: Builder( builder: (BuildContext context) { return IconButton(
          onPressed:(){Scaffold.of(context).openDrawer();}, 
          icon: Icon(Icons.menu,color: Colors.white,size: 20,)); }),
      elevation:0,
      backgroundColor:Color.fromRGBO(215,15,100, 1),
      
      ),
      body:showSignIn? SignIn(): showSignUp? Register():SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          SizedBox(height: 10,),
          //MySlider(),
          SizedBox(height: 15,),
          Padding(
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                for(int i=0; i<6; i++)
                Padding(
                  padding: EdgeInsets.fromLTRB(15,10,15,10),
                  child: Text("CATEGORY",style: TextStyle(color:(i==0)?Color.fromRGBO(215,15,100, 1):Color.fromRGBO(158, 158, 167, 1),fontSize: 12,fontWeight: (i==0)? FontWeight.bold:FontWeight.normal),))
              ]),
            ),
          ),
          SizedBox(height:3,),
          Padding(
            padding: EdgeInsets.fromLTRB(20,0,20,20),
             child: StreamProvider<List<Products>?>.value(
                  value:DatabaseService(null, null).getProducts,
                  initialData: null,
                  child: ProdGrid())),
        ],),
      )
      
    );
  }
}