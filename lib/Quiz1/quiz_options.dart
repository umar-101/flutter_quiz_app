import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../const.dart';

class QuizOptions extends StatelessWidget {
  const QuizOptions({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Column(children: [
        Row(
          children: [
            Image(
              image: AssetImage('assets/icons/i_info.png'),
              width: 12,
              height: 12,
              color: kBlackColor,
            ),
            SizedBox(width: 2.0.w),
            Expanded(
              child: Text(
                'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod',
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 2.0.h),
        QuizOption(
          option:
              'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod',
          ontap: () {},
        ),
        SizedBox(height: 1.5.h),
        QuizOption(
          option: 'Loremlor sit amet, consetetur sadipscing elitr, sed ',
          ontap: () {},
        ),
        SizedBox(height: 1.5.h),
        QuizOption(
          option: 'Lorem ipsum dolor sit amet, co',
          ontap: () {},
        ),
        SizedBox(height: 1.5.h),
        QuizOption(
          option:
              'Lorem olor sit amet, consetetur sadipscing elitr, sed diam nonumy.',
          ontap: () {},
        ),
      ]),
    );
  }
}

class QuizOption extends StatelessWidget {
  final String option;
  final Function ontap;
  const QuizOption({
    Key key,
    this.option,
    this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: ontap,
          child: Container(
            width: 4.0.w,
            height: 4.0.w,
            decoration: BoxDecoration(
                color: kBeigeColor, borderRadius: BorderRadius.circular(8)),
          ),
        ),
        SizedBox(width: 3.0.w),
        Expanded(
          child: Text(
            option,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
