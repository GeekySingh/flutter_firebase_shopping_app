import 'package:core/core/core_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:presentation/src/common/constants/app_strings.dart';

import 'login_view_model.dart';

class LoginScreen extends CoreScreen<LoginViewModel> {

  @override
  String getTitle() => AppStrings.login;

  @override
  Widget screenBuilder(BuildContext context, LoginViewModel viewModel) {
    return Padding(
        padding: EdgeInsets.all(20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextField(
              controller: viewModel.emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: AppStrings.userName,
              )),
          SizedBox(height: 20),
          TextField(
              controller: viewModel.passwordController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: AppStrings.password,
              )),
          SizedBox(height: 20),
          ElevatedButton(
              child: Text(AppStrings.login),
              onPressed: () => viewModel.isDataValidated
                  ? viewModel.onLoginButtonPressed()
                  : null)
        ]));
  }
}
