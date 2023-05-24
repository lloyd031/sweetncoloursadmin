import 'package:flutter/material.dart';
import 'package:sweetncoloursadmin/models/product.dart';
class ProductTile extends StatelessWidget {
  
  final Products? prod;
  const ProductTile(this.prod);
  
  @override
  Widget build(BuildContext context) {
    return  Container(
          decoration: BoxDecoration(
             
            borderRadius: BorderRadius.all(Radius.circular(3.0)),

            color: Colors.white,
            ),
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(topLeft:Radius.circular(3.0),topRight: Radius.circular(3.0) ),
                child: Image.network("${prod?.image}",
                height:130,
                width: double.infinity,
                fit:BoxFit.cover,)),
              Padding(
                padding:EdgeInsets.all(8.0),
                 child: Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children:[
                    
                  const SizedBox(height:6),
                  Text("${prod?.name}", style: TextStyle(color: Colors.grey[900]),),
                  const SizedBox(height:6),
                  Text("₱ ${prod?.price}", style: TextStyle(color:Color.fromRGBO(215,15,100, 1)),),
                  
                 ])
              ),
              
            ],
          ),
        );;
  }
}