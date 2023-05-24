import 'package:flutter/material.dart';
import 'package:sweetncoloursadmin/models/product.dart';

class CategoryList extends StatefulWidget {
  CategoryModel? cat;
  CategoryList(this.cat);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    return Padding( padding:EdgeInsets.only(left:0, right:20), child: Text("${widget.cat?.title}"));
  }
}