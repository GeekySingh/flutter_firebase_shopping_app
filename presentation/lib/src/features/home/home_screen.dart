import 'package:core/core/core_container.dart';
import 'package:flutter/widgets.dart';
import 'package:presentation/src/features/home/home_view_model.dart';

class HomeContainer extends CoreContainer<HomeViewModel> {
  @override
  Widget containerBuilder(BuildContext context, HomeViewModel viewModel) {
    return Center(child: Text('Home Container'));
  }
}
