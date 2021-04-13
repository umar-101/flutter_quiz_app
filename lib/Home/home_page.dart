import 'package:flutter/material.dart';

import '../nav_bar.dart';
import 'Mobile/mobile_body.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [MobileBody()],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
