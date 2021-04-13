import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../button.dart';
import '../const.dart';

class BuyQuizDialog extends StatelessWidget {
  const BuyQuizDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: kWhiteColor,
          ),
          width: 100.0.w,
          // height: 50.0.w,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: kWhiteColor,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                    image: AssetImage('assets/images/Image.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 2.0.h),
              Expanded(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 60.0, vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Quiz name here',
                          style: TextStyle(
                            fontSize: 14.0.sp,
                            fontWeight: FontWeight.bold,
                            color: kPurpleColor,
                          ),
                        ),
                        SizedBox(height: 1.0.h),
                        Text(
                          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 10.0.sp,
                          ),
                        ),
                        SizedBox(height: 3.0.h),
                        QuizStatRow(
                          title: 'Total Hours',
                          duration: '2 hours',
                        ),
                        SizedBox(height: 1.0.h),
                        QuizStatRow(
                          title: 'No of Questions',
                          duration: '10',
                        ),
                        SizedBox(height: 5.0.h),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 25.0.w,
                                height: 4.5.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: kPurpleColor.withOpacity(0.23),
                                        width: 1)),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 5, 8, 4),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Coupon code',
                                      hintStyle: TextStyle(
                                        color: kPurpleColor.withOpacity(0.4),
                                        fontSize: 13,
                                      ),
                                      // contentPadding:
                                      //     EdgeInsets.fromLTRB(10, 0, 5, 20),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                              SubmittButton(
                                width: 25.0.w,
                                height: 4.5.h,
                                color: kBeigeColor,
                                titleColor: kBlackColor,
                                title: 'Apply',
                                ontap: () {},
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 3.0.h),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            children: [
                              Text(
                                'Final Price',
                                style: TextStyle(fontSize: 12.0.sp),
                              ),
                              Spacer(),
                              Text(
                                '34\$',
                                style: TextStyle(
                                    fontSize: 18.0.sp,
                                    color: kPurpleColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 1.5.h),
                        SubmittButton(
                          width: double.infinity,
                          height: 5.0.h,
                          color: kOrangeColor,
                          titleColor: kWhiteColor,
                          title: 'Buy this Quiz now!',
                          ontap: () {},
                        )
                      ],
                    ),
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

class QuizStatRow extends StatelessWidget {
  final String title;
  final String duration;
  const QuizStatRow({
    Key key,
    this.title,
    this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 11.0.sp),
          ),
          Spacer(),
          Text(
            duration,
            style: TextStyle(
              fontSize: 12.0.sp,
              color: kPurpleColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
