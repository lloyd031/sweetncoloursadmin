
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sweetncoloursadmin/prodauth/addcategory.dart';
import 'package:sweetncoloursadmin/category.dart';
import 'package:sweetncoloursadmin/drawer.dart';
import 'package:sweetncoloursadmin/models/product.dart';
import 'package:sweetncoloursadmin/prodauth/addprod.dart';
import 'package:sweetncoloursadmin/shared/loading.dart';
import 'package:sweetncoloursadmin/prod.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../models/user.dart';
import '../services/database.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool showAddProduct=false;
  void showAddProductPanel()
  {
    setState(() {
      showAddProduct=true;
      showAddCategory=false;
      showBottomSheet();
    });
  }
  bool showAddCategory=false;
  void showAddCategoryPanel()
  {
    setState(() {
      showAddProduct=false;
      showAddCategory=true;
      showBottomSheet();
    });
  }
  void showBottomSheet()
  {
    showModalBottomSheet(context: context,
    shape:RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top:Radius.circular(15))),
     isScrollControlled: true,
     builder: (context)
    {
       if(showAddProduct==true)
      {
        return AddProducts();
      }else if(showAddCategory==true)
      {
        return AddCategory();
      }else{
        return Loading();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserObj?>(context);
    return StreamBuilder<UserData?>(
      stream:DatabaseService(user?.uid,user?.email).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData)
        {
            UserData? userData=snapshot.data;
            String? fn=userData?.fn;
            if(userData?.accType=="admin")
            {
              return Scaffold(
          //Color.fromRGBO(215,15,100, 1)
           backgroundColor: Colors.grey[100],
          drawer:MyDrawer(),
          appBar:  AppBar(
            elevation: 0,
            leading: Builder( builder: (BuildContext context) { return IconButton(
              onPressed:(){Scaffold.of(context).openDrawer();}, 
              icon: Icon(Icons.menu,color: Colors.white,size: 20,)); }),
          
          backgroundColor:Color.fromRGBO(215,15,100, 1),
          actions: <Widget>[
            IconButton(onPressed: (){showAddProductPanel();}, icon: Icon(Icons.notifications, color:Colors.white,size: 18,)),
          ],
          ),
          body:SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              Container(
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(6)),
                  color:Color.fromRGBO(215,15,100, 1),
                ),
                child: Column(
                  children: [
              Padding(
                padding:EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:[Text("Hi, $fn !", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),),] ),
              ),
                  ],
                ),
              ),
              
              SizedBox(height: 10,),
              SizedBox(height: 15,),
              StreamProvider<List<CategoryModel>?>.value(
                  value:DatabaseService(user?.uid, user?.email).getCategory,
                  initialData: null,
                  child:Category(showAddCategoryPanel),),
              
              SizedBox(height:3,),
              Padding(
                padding: EdgeInsets.fromLTRB(20,0,20,20),
                child: StreamProvider<List<Products>?>.value(
                  value:DatabaseService(user?.uid, user?.email).getProducts,
                  initialData: null,
                  child: ProdGrid())),
            ],),
          ),
          floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showAddProductPanel();
        },
        label:const Text("+ Add Product"),
        backgroundColor: Color.fromRGBO(215,15,100, 1),
      ),
          
        );
            }else
            {
              return Text("USer");
            }
        }else{
          return Loading();
        }
        
      }
    );
  }
}