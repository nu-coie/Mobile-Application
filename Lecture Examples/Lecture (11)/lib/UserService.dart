import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UserService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<User?> getCurrentUser() async
  {
    return _auth.currentUser;
  }

  Future<Map<String, dynamic>> getUserInfo(String uid) async
  {
    final userInfo = await _firestore.collection('ProfileInfo').doc(uid).get();
    if (userInfo.exists)
    {
      return userInfo.data()!;
    }
    return {};
  }

  Future<String> getUserImageUrl(String uid) async {
    try
    {
      Reference ref = _storage.ref().child('profile_images/$uid.jpg');
      return await ref.getDownloadURL();
    }
    catch (e)
    {
      print('Error fetching profile image: $e');
      return '';
    }
  }











}
