

import 'package:domain/domain.dart';
import 'package:firebase_auth/firebase_auth.dart';

extension FirebaseUserToUserData on User {
  UserData toUserData() {
    return UserData(this.displayName, this.email, this.phoneNumber);
  }
}