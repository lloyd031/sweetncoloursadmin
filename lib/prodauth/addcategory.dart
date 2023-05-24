import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sweetncoloursadmin/models/user.dart';
import 'package:sweetncoloursadmin/services/auth.dart';
import 'package:sweetncoloursadmin/services/database.dart';
import 'package:sweetncoloursadmin/shared/loading.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({super.key});

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
 
  final AuthService _auth = AuthService();
  final _formKey=GlobalKey<FormState>();
  bool loading=false;
  String title = '';
  String error=' ';
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserObj?>(context);
    return loading? Loading():Column(
        mainAxisSize: MainAxisSize.min,
        children:[Container(
          child: Center(
            child: Column(
              children:[
                SizedBox(
                      height: 40,
                    ),
                  Text("Add Product", style: TextStyle(color:Color.fromRGBO(215,15,100, 1), fontSize: 20,),),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal:50,vertical:10),
                  child: Form(
                  key: _formKey,
                    child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                          fillColor: Colors.grey[50],
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(3))),
                        hintText:"Title",
                      ),
                      validator: (val){
                        if(val!.isEmpty)
                        {
                            return "required";
                        }
                      },
                      onChanged: (val) {
                        setState(() {
                          title = val;
                        });
                      },
                    ),
                    
                    SizedBox(height: 20,),
                      SizedBox(
                        width: double.maxFinite,
                        child: ElevatedButton(onPressed: ()async{
                            if(_formKey.currentState!.validate())
                              {
                                setState(() {
                                  loading=true;
                                });
                                 dynamic result=await DatabaseService(user?.uid,user?.email).addAndUpdateCategory(title);
                                if(result==null)
                                {
                                  setState(() {
                                    error='saved';
                                    loading=false;
                                  });
                                }
                              }
                        }, 
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Color.fromRGBO(215,15,100, 1),),
                          padding: MaterialStateProperty.all(EdgeInsets.only(top: 15, bottom: 15)),
                          elevation: MaterialStateProperty.all(0.0),
                          
                        ),
                        child:Text('Proceed'),
                        
                        ),
                      ),
                    SizedBox(
                      height: 20,
                    ),
                    
                        SizedBox(height:20),
                        Text(
                          error,
                          style: TextStyle(
                            color:Colors.red,
                            fontSize: 14,
                          ),
                        )
                  ],
                              )
                              ),
                ),] 
            ),
          ),
        ),] );
  }

}