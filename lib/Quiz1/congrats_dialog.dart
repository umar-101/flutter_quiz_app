import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../button.dart';
import '../const.dart';

class CongratsDialog extends StatelessWidget {
  const CongratsDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Column(
        children: [
          SizedBox(height: 3.0.h),
          Container(
            height: 50,
            decoration: BoxDecoration(
                color: kOrangeColor, borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  Text(
                    'Quiz Name Title',
                    style: TextStyle(
                        color: kWhiteColor,
                        fontSize: 14.0.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    'Finished ---- ----',
                    style: TextStyle(
                        color: kWhiteColor,
                        fontSize: 14.0.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 100.0.w,
            height: 35.0.h,
            decoration: BoxDecoration(),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: AssetImage('assets/images/congrats.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              children: [
                SubmittButton(
                  color: kGreenColor,
                  titleColor: kWhiteColor,
                  title: 'Completed',
                  width: 25.0.w,
                  height: 5.0.h,
                  ontap: () {},
                ),
                SizedBox(height: 1.0.h),
                Text(
                  'Congratulations!',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kOrangeColor,
                      fontSize: 20.0.sp),
                ),
                SizedBox(height: 1.0.h),
                Text(
                  'You completed "Quiz name here"!',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0.sp),
                ),
                SizedBox(height: 2.0.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total time taken:',
                        style: TextStyle(fontSize: 10.0.sp),
                      ),
                      Text(
                        '01:59:37',
                        style:
                            TextStyle(fontSize: 11.0.sp, color: kPurpleColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 1.0.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Right answers:',
                        style: TextStyle(fontSize: 10.0.sp),
                      ),
                      Text(
                        '9/10',
                        style:
                            TextStyle(fontSize: 11.0.sp, color: kPurpleColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 1.0.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your Score',
                        style: TextStyle(fontSize: 11.0.sp),
                      ),
                      Text(
                        '90%',
                        style: TextStyle(
                            fontSize: 18.0.sp,
                            fontWeight: FontWeight.bold,
                            color: kGreenColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // SizedBox(width: 1.0.h),
          // Container(
          //   width: 15.0.w,
          //   height: 10.0.h,
          //   child: Image(
          //     image: AssetImage('assets/images/confetti@2x.png'),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          SizedBox(height: 2.0.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 15.0.w,
                  height: 4.5.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: kBeigeColor,
                  ),
                  child: Center(
                    child:
                        Icon(Icons.share, color: kPurpleColor, size: 16.0.sp),
                  )),
              SizedBox(width: 4.0.w),
              Image(image: AssetImage('assets/icons/facebook.png')),
              SizedBox(width: 4.0.w),
              Image(image: AssetImage('assets/icons/Instagram.png')),
              SizedBox(width: 6.0.w),
              Container(
                  width: 15.0.w,
                  height: 4.5.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: kPurpleColor,
                  ),
                  child: Center(
                    child: Icon(Icons.arrow_forward,
                        color: kWhiteColor, size: 16.0.sp),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
