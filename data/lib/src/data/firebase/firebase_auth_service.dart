import 'package:data/src/common/constants.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

const ERROR_EMAIL_ALREADY_IN_USE = "ERROR_EMAIL_ALREADY_IN_USE";
const ERROR_WRONG_PASSWORD = "ERROR_WRONG_PASSWORD";

@Injectable()
class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<Either<User?, String>> login(String email, String password) async {
    try {
      final credentials = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return Left(credentials.user);
    } catch (e) {
      return Right(_handleAuthErrors(e));
    }
  }

  Future<Either<User?, String>> register(String email, String password) async {
    try {
      final credentials = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return Left(credentials.user);
    } catch (e) {
      return Right(_handleAuthErrors(e));
    }
  }

  Future<bool> logout() async {
    try {
      await _auth.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }

  String _handleAuthErrors(error) {
    String errorCode = error.code;
    switch (errorCode) {
      case ERROR_EMAIL_ALREADY_IN_USE:
        return Constants.errorEmailAlreadyExists;
      case ERROR_WRONG_PASSWORD:
        return Constants.errorWrongPassword;
      default:
        return Constants.errorUnableToLogin;
    }
  }
}
