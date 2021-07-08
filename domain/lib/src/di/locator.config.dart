// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../domain.dart' as _i4;
import '../usecase/user_login_use_case.dart' as _i3;
import '../usecase/user_logout_use_case.dart' as _i5;
import '../usecase/user_registration_use_case.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.UserLoginUseCase>(
      () => _i3.UserLoginUseCase(get<_i4.UserRepository>()));
  gh.factory<_i5.UserLogoutUseCase>(
      () => _i5.UserLogoutUseCase(get<_i4.UserRepository>()));
  gh.factory<_i6.UserRegistrationUseCase>(
      () => _i6.UserRegistrationUseCase(get<_i4.UserRepository>()));
  return get;
}
