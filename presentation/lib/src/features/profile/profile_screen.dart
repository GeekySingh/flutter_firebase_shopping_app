import 'package:core/core/core_container.dart';
import 'package:flutter/widgets.dart';
import 'package:presentation/src/features/profile/profile_view_model.dart';

class ProfileContainer extends CoreContainer<ProfileViewModel> {
  @override
  Widget containerBuilder(BuildContext context, ProfileViewModel viewModel) {
    return Center(child: Text('Profile Container'));
  }
}
