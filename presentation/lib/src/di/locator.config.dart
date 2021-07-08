// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:core/service/dialog_service.dart' as _i6;
import 'package:core/service/navigation_service.dart' as _i5;
import 'package:domain/domain.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../features/login/login_view_model.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.LoginViewModel>(() => _i3.LoginViewModel(
      get<_i4.UserLoginUseCase>(),
      get<_i5.NavigationService>(),
      get<_i6.DialogService>()));
  return get;
}
