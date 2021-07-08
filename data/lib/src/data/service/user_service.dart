import 'package:app_frontend/components/modals/internetConnection.dart';
import 'package:connectivity/connectivity.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:firebase_core/firebase_core.dart';

class UserService{
  late FirebaseAuth _auth;
  late FirebaseFirestore _firestore;
  late FlutterSecureStorage _storage;

  UserService(){
    initializeFirebaseApp();
  }

  void initializeFirebaseApp() async{
    bool internetConnection = await checkInternetConnectivity();
    if(internetConnection){
      await Firebase.initializeApp();
      _auth = FirebaseAuth.instance;
      _firestore = FirebaseFirestore.instance;
      _storage = new FlutterSecureStorage();
    }
  }

  void storeJWTToken(String idToken, refreshToken) async{
    await _storage.write(key: 'idToken', value: idToken);
    await _storage.write(key: 'refreshToken', value: refreshToken);
  }

  String? validateToken(String? token){
    bool isExpired = Jwt.isExpired(token ?? '');

    if(isExpired){
      return null;
    }
    else{
      Map<String, dynamic> payload = Jwt.parseJwt(token ?? '');
      return payload['user_id'];
    }
  }

  void logOut(context) async{
    await _storage.deleteAll();
    Navigator.of(context).pushReplacementNamed('/');
  }

  Future<bool> login(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    final currentUser = _auth.currentUser;

      if(currentUser != null) {
        final idToken = await currentUser.getIdToken();
        final refreshToken = currentUser.refreshToken;
        storeJWTToken(idToken, refreshToken);
        return true;
      }
      return false;

    }).catchError((error){
      handleAuthErrors(error);
    });
  }

  Future<String?> getUserId() async{
    var token = await _storage.read(key: 'idToken');
    return validateToken(token);
  }

  Future<void> signup(userValues) async{
    String email = userValues['email'];
    String password = userValues['password'];

    await _auth.createUserWithEmailAndPassword(email: email, password: password).then((dynamic user){
      String uid = user.user.uid;
      _firestore.collection('users').add({
        'fullName': userValues['fullName'],
        'mobileNumber': userValues['mobileNumber'],
        'userId': uid
      });

      statusCode = 200;
    }).catchError((error){
      handleAuthErrors(error);
    });
  }

  void handleAuthErrors(error){
    String errorCode = error.code;
    switch(errorCode){
      case "ERROR_EMAIL_ALREADY_IN_USE":
        {
          statusCode = 400;
          msg = "Email ID already existed";
        }
        break;
      case "ERROR_WRONG_PASSWORD":
        {
          statusCode = 400;
          msg = "Password is wrong";
        }
    }
  }

  String capitalizeName(String name){
    name = name[0].toUpperCase()+ name.substring(1);
    return name;
  }

  String? userEmail(){
    return _auth.currentUser?.email;
  }

  Future<List> userWishlist() async{
    String? uid = await getUserId();
    QuerySnapshot userRef = await _firestore.collection('users').where('userId',isEqualTo: uid).get();

    Map userData = userRef.docs[0].data() as Map;
    List userWishList = [];

    if(userData.containsKey('wishlist')){
      for(String item in userData['wishlist']){
        Map<String, dynamic> tempWishList = new Map();
        DocumentSnapshot productRef = await _firestore.collection('products').doc(item).get();
        tempWishList['productName'] = (productRef.data() as Map)['name'];
        tempWishList['price'] = (productRef.data() as Map)['price'];
        tempWishList['image'] = (productRef.data() as Map)['image'];
        tempWishList['productId'] = productRef.id;
        userWishList.add(tempWishList);
      }
    }
    return userWishList;
  }

  Future<void> deleteUserWishlistItems(String productId) async{
    String? uid = await getUserId();
    QuerySnapshot userRef = await _firestore.collection('users').where('userId',isEqualTo: uid).get();
    String documentId = userRef.docs[0].id;
    Map<String,dynamic> wishlist = userRef.docs[0].data() as Map<String, dynamic>;
    wishlist['wishlist'].remove(productId);

    await _firestore.collection('users').doc(documentId).update({
      'wishlist':wishlist['wishlist']
    });
  }

  String getConnectionValue(var connectivityResult) {
    String status = '';
    switch (connectivityResult) {
      case ConnectivityResult.mobile:
        status = 'Mobile';
        break;
      case ConnectivityResult.wifi:
        status = 'Wi-Fi';
        break;
      case ConnectivityResult.none:
        status = 'None';
        break;
      default:
        status = 'None';
        break;
    }
    return status;
  }

  Future<bool> checkInternetConnectivity() async{
    final Connectivity _connectivity = Connectivity();
    ConnectivityResult result = await _connectivity.checkConnectivity();
    String connection = getConnectionValue(result);
    if(connection == 'None') {
      return false;
    }
    else{
      return true;
    }
  }
}

