import 'package:cloud_firestore/cloud_firestore.dart';
import 'models/models.dart';
import 'user_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseUserRepo implements UserRepository {
  final FirebaseAuth _firebaseAuth;
  final userCollection = FirebaseFirestore.instance.collection('users');

  FirebaseUserRepo({
    FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Future<void> logOut() {
    // Implement logOut
    return _firebaseAuth.signOut();
  }

  @override
  Future<void> setUserData(user) {
    // Implement setUserData
    return userCollection.doc(user.name).set(user.toMap());
  }

  @override
  Future<void> signIn(String email, String password) {
    // Implement signIn
    return _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<MyUser> signUp(myUser, String password) async {
    // Implement signUp
    UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: myUser.email,
      password: password,
    );
    await setUserData(myUser);  // Set the user data in Firestore after signing up
    return  MyUser(
      uid: userCredential.user!.uid,
      email: userCredential.user!.email!, name: '', userId: '', password: '',
    );
  }

  @override
  Stream<MyUser> get user => _firebaseAuth.authStateChanges().map((User? firebaseUser) {
    if (firebaseUser != null) {
      return MyUser(uid: firebaseUser.uid, email: firebaseUser.email!, name: '', userId: '', password: '');
    } else {
      throw Exception('No user signed in');
    }
  });


}
