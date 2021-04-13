import 'package:flutter/material.dart';

import '../nav_bar.dart';
import 'mobile/quiz_mobile.dart';

class QuizPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QuizMobileView(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
