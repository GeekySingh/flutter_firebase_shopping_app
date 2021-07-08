import 'package:domain/domain.dart';
import 'package:domain/src/common/result.dart';
import 'package:domain/src/model/user_data.dart';
import 'package:domain/src/usecase/base/base_use_case.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class UserRegistrationUseCase implements BaseUseCase {
  final UserRepository _userRepository;

  UserRegistrationUseCase(this._userRepository);

  Future<Result<UserData?>> register(
      String name, String email, String phoneNumber, String password) {
    return _userRepository.register(name, email, phoneNumber, password);
  }
}
