import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sweetncoloursadmin/authenticate/signin.dart';
import 'package:sweetncoloursadmin/home/home.dart';
import 'package:sweetncoloursadmin/home/home guest.dart';
import 'package:sweetncoloursadmin/models/user.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserObj?>(context);
    if(user==null)
    {
      return MyHomePageGuest();
    }else
    {
      
      return MyHomePage();
      
    }
    //return SignIn();
  }
}