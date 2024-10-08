import 'user_repo.dart';

class FirebaseUserRepo implements UserRepository{

    final Firebaseauth _firebaseauth;
    final userCollection=FirebaseFirestore.instance.collection('users');
    

}