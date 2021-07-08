import 'package:core/src/di/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

import 'core_view_model.dart';

abstract class CoreScreen<T extends CoreViewModel>
    extends ViewModelBuilderWidget<T> {

  String getTitle();

  @override
  Widget builder(BuildContext context, T viewModel, Widget? child) {
    return Scaffold(
        appBar: AppBar(title: Text(getTitle())),
        body: screenBuilder(context, viewModel));
  }

  Widget screenBuilder(BuildContext context, T viewModel);

  @override
  T viewModelBuilder(BuildContext context) => locator<T>();
}
