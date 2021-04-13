import 'package:flutter/material.dart';

import '../nav_bar.dart';
import 'Mobile/profile_mobile_view.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: ProfileMobileView()),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
