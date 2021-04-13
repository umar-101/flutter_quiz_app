import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../../button.dart';
import '../../const.dart';
import '../congrats_dialog.dart';
import '../quiz_header.dart';
import '../quiz_options.dart';
import 'mobile_top_container.dart';

class QuizMobileView extends StatefulWidget {
  @override
  _QuizMobileViewState createState() => _QuizMobileViewState();
}

class _QuizMobileViewState extends State<QuizMobileView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0.h,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                QuizMobTop(),
              ],
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 25, 10, 0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: kWhiteColor,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 3,
                        color: kBeigeColor,
                        offset: Offset(0, 1),
                      )
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    QuizHeader(),
                    QuizOptions(),
                    SubmittButton(
                      width: 140,
                      height: 30,
                      color: kOrangeColor,
                      title: 'Submit Answer',
                      titleColor: kWhiteColor,
                      ontap: () {},
                    ),
                    SizedBox(
                      height: 2.0.h,
                    ),
                    MobBottomRow()
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}

class QuizMobTopContainer {}

class MobBottomRow extends StatelessWidget {
  const MobBottomRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 10.0.w,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: kBeigeColor,
            ),
            child: Center(
                child: Icon(Icons.arrow_back, color: kPurpleColor, size: 16)),
          ),
          Text(
            '1/10',
            style: TextStyle(
                fontSize: 16, color: kPurpleColor, fontWeight: FontWeight.bold),
          ),
          Container(
            width: 12.0.w,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: kBeigeColor,
            ),
            child: Center(
              child: Text(
                'Skip',
                style: TextStyle(
                    fontSize: 12,
                    color: kPurpleColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CongratsDialog()),
              );
            },
            child: Container(
              width: 20.0.w,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: kBeigeColor,
              ),
              child: Center(
                  child: Icon(Icons.arrow_forward,
                      color: Colors.black54, size: 16)),
            ),
          ),
        ],
      ),
    );
  }
}
