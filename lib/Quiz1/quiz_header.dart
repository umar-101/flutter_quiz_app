import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../const.dart';

class QuizHeader extends StatelessWidget {
  const QuizHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: kBeigeColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    'Question # 1',
                    style: TextStyle(
                        fontSize: 13.0.sp,
                        color: kPurpleColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Image(
                    image: AssetImage('assets/icons/q_mark.png'),
                    width: 12,
                    height: 12,
                  ),
                  SizedBox(width: 1.0.w),
                  Text(
                    'Report Question',
                    style: TextStyle(
                      fontSize: 10.0.sp,
                      color: kRedColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 0.5.h),
              Text(
                'Category here',
                style: TextStyle(
                  fontSize: 10.0.sp,
                  color: kPurpleColor,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 0.5.h),
              Expanded(
                child: Text(
                  'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet.',
                  style: TextStyle(
                    fontSize: 11.0.sp,
                    color: kBlackColor,
                    height: 1.2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
