import 'package:core/core/core_view_model.dart';
import 'package:core/service/dialog_service.dart';
import 'package:core/service/navigation_service.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:presentation/src/common/routes/router.dart';

@Injectable()
class LoginViewModel extends CoreViewModel {
  final UserLoginUseCase _userLoginUseCase;

  final NavigationService _navigationService;
  final DialogService _dialogService;

  LoginViewModel(this._userLoginUseCase, this._navigationService, this._dialogService);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool get isDataValidated =>
      emailController.text.isNotEmpty && passwordController.text.isNotEmpty;

  Future<void> onLoginButtonPressed() async {
    loading();
    _dialogService.showLoader();
    final result = await _userLoginUseCase.login(
        emailController.text, passwordController.text);
    _navigationService.pop();
    // handle result
    result.when(
        success: (_) => _navigationService.popAndPush(DashboardScreenRoute()),
        error: (e) => _dialogService.error(title: Constants.error, message: e));
    loaded(result.isSuccessful);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
