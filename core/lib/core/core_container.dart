import 'package:core/src/di/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

import 'core_view_model.dart';

abstract class CoreContainer<T extends CoreViewModel>
    extends ViewModelBuilderWidget<T> {
  @override
  Widget builder(BuildContext context, T viewModel, Widget? child) {
    return containerBuilder(context, viewModel);
  }

  Widget containerBuilder(BuildContext context, T viewModel);

  @override
  T viewModelBuilder(BuildContext context) => locator<T>();
}
