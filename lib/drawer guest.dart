import 'package:flutter/material.dart';
import 'package:sweetncoloursadmin/home/home%20guest.dart';
import 'package:sweetncoloursadmin/models/user.dart';
import 'package:sweetncoloursadmin/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:sweetncoloursadmin/services/database.dart';
import 'package:sweetncoloursadmin/shared/loading.dart';


class MyDrawerGuest extends StatefulWidget {
  Function showSignIn,showSignUp;
  MyDrawerGuest({required this.showSignIn,required this.showSignUp});

  @override
  State<MyDrawerGuest> createState() => _MyDrawerGuestState();
}

class _MyDrawerGuestState extends State<MyDrawerGuest> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                  accountName: Text('Sweetncolours'), accountEmail: Text('sweetn@colours.co.ph'),
                  currentAccountPicture: CircleAvatar(
                    child: ClipOval(
                      child: Image.network('https://cdn-icons-png.flaticon.com/512/149/149071.png',
                      width: 90,
                      height:90,
                      fit:BoxFit.cover),
                    ),
                  ),
                  decoration: const BoxDecoration(
                    color:Color.fromRGBO(215,15,100, 1),
                    image: DecorationImage(image: NetworkImage('https://images.pexels.com/photos/323311/pexels-photo-323311.jpeg?auto=compress&cs=tinysrgb&w=400'
                    ),
                    fit:BoxFit.cover,
                    ),
                  ),
                  ),
             
              ListTile(
                leading:Icon(Icons.star),
                title:Text('Rate App'),
                onTap: (){},
              ),
              ListTile(
                leading:Icon(Icons.share),
                title:Text('Share'),
                onTap: (){},
              ),
              
              Divider(),
              ListTile(
                leading:Icon(Icons.exit_to_app),
                title:Text('Signup'),
                onTap: (){
                  widget.showSignUp();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading:Icon(Icons.exit_to_app),
                title:Text('Login'),
                onTap: (){
                  widget.showSignIn();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          
        );
  }
}
