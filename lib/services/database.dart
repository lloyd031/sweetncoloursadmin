import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sweetncoloursadmin/category.dart';
import 'package:sweetncoloursadmin/models/product.dart';
import 'package:sweetncoloursadmin/models/user.dart';
class DatabaseService
{
  final String? uid;
  final String? email;
  DatabaseService(this.uid,this. email);

  //collection reference
  final CollectionReference accountDetails =FirebaseFirestore.instance.collection('acc');
  Future updateUserData(String fn, String ln,String profile,String accType) async{
    return await accountDetails.doc(uid).set({
      'fn':fn,
      'ln':ln,
      'profile':profile,
      'accType':accType,
    });
  }

  //add products to database
  final CollectionReference prodDetails =FirebaseFirestore.instance.collection('products');
  Future addAndUpdateProducts(String name, String price,String img,String description) async{
    return await prodDetails.doc().set({
      'name':name,
      'price':price,
      'image':img,
      'description':description,
    });
  }
  //add category to firebase
  final CollectionReference prodCategory =FirebaseFirestore.instance.collection('category');
  Future addAndUpdateCategory(String title) async{
    return await prodCategory.doc().set({
      'title':title,
    });
  }
  
  
  //get accounts stream
  Stream<UserData?> get userData
  {
      return accountDetails.doc(uid).snapshots().map(_userDataFromSnapshot);  
  }
  //
  UserData? _userDataFromSnapshot(DocumentSnapshot snapshot)
  {
    
    return UserData(uid, snapshot.get("fn"), snapshot.get("ln"), snapshot.get("profile"),email,snapshot.get("accType"));
  }
  //product list from snapshot
  List<Products> _productListFromSnapShot(QuerySnapshot snapshot)
  {
    return snapshot.docs.map((doc){
      return Products(doc.get('name'),doc.get('price'),doc.get('description'),doc.get('image'));
    }).toList();
  }
  //get prod stream
  Stream<List<Products>> get getProducts{
    return prodDetails.snapshots().map(_productListFromSnapShot);
  }
  //category list from snapshot
  List<CategoryModel> _categoryListFromSnapShot(QuerySnapshot snapshot)
  {
    return snapshot.docs.map((doc){
      return CategoryModel(doc.get('title'));
    }).toList();
  }
  //get category stream
  Stream<List<CategoryModel>> get getCategory{
    return prodCategory.snapshots().map(_categoryListFromSnapShot);
  }
}
