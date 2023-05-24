import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sweetncoloursadmin/categorylist.dart';
import 'package:sweetncoloursadmin/models/product.dart';

class Category extends StatefulWidget {
  Function showAddCategoryPanel;
   Category(this.showAddCategoryPanel);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<List<CategoryModel>?>(context);
    return Padding(
      
                padding: EdgeInsets.fromLTRB(6,10,20,10),
                child: Row(
                  
                  children:[
                    IconButton(onPressed: (){widget.showAddCategoryPanel();}, icon:Icon(Icons.add_rounded, color: Color.fromRGBO(215,15,100, 1), ),),
                    Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0,10,15,10),
                          child: Text("All",style: TextStyle(color:Color.fromRGBO(215,15,100, 1),fontSize: 12,fontWeight:  FontWeight.bold),)),
                        Container(
                          
                          height:17,
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: (categories!=null)?categories.length:0,
                            itemBuilder: (_,index)
                            {
                              if(categories!=null)
                              {
                                return CategoryList(categories[index]);
                              }
                            },
                          ),
                        ),
                        /*for(int i=0; i<6; i++)
                        Padding(
                          padding: EdgeInsets.fromLTRB(0,10,15,10),
                          child: Text("CATEGORY",style: TextStyle(color:Color.fromRGBO(158, 158, 167, 1),fontSize: 12,fontWeight:FontWeight.normal),)),*/
                      ]),
                    ),
                  ),] 
                ),
              );
  }
}