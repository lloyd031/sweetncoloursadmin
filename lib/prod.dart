import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sweetncoloursadmin/producttile.dart';
import 'package:sweetncoloursadmin/models/product.dart';

class ProdGrid extends StatefulWidget {
  const ProdGrid({super.key});

  @override
  State<ProdGrid> createState() => _ProdGridState();
}

class _ProdGridState extends State<ProdGrid> {
 
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<List<Products>?>(context);
    
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, 
      crossAxisSpacing:12,
      mainAxisSpacing: 12,
      mainAxisExtent: 190,),
      itemCount: (products==null)? 0: products.length,
      itemBuilder: (_,index)
      {
        return ProductTile(products?[index]);
      }
      
    );
  }
}