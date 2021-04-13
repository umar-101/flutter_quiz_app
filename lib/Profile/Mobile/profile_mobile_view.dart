import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../../button.dart';
import '../../const.dart';
import 'mob_top_container.dart';

class ProfileMobileView extends StatefulWidget {
  @override
  _ProfileMobileViewState createState() => _ProfileMobileViewState();
}

class _ProfileMobileViewState extends State<ProfileMobileView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: kWhiteColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            MobTopContainer(),
            SizedBox(height: 2.5.h),
            SeeMoreRow(
              title: 'History',
            ),
            SizedBox(height: 2.0.h),
            QuizHistoryContainer(
              quizTitle: 'Lorem ipsum dolor sit amet.',
              buttonTitle: 'Completed',
              date: 'Completed on 01/01',
              quizStatus: '91%',
              buttonColor: kGreenColor,
            ),
            SizedBox(height: 1.5.h),
            QuizHistoryContainer(
              quizTitle: 'Lorem ipsum dolor sit amet.',
              buttonTitle: 'Canceled',
              date: 'Discarded on 02/03',
              quizStatus: '--',
              buttonColor: kRedColor,
            ),
            SizedBox(height: 2.0.h),
            SeeMoreRow(
              title: 'Transactions',
            ),
            SizedBox(height: 2.0.h),
            TransactionHistory(),
            SizedBox(height: 1.5.h),
            TransactionHistory(),
            SizedBox(height: 1.5.h),
          ],
        ),
      ),
    );
  }
}

class TransactionHistory extends StatelessWidget {
  const TransactionHistory({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 40.0.w,
                child: Expanded(
                  child: Text('Lorem ipsum dolor sit amet.',
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: 12.0.sp, fontWeight: FontWeight.w600)),
                ),
              ),
              SizedBox(height: 1.0.h),
              Text('10 April 2020',
                  style: TextStyle(
                    fontSize: 12,
                  )),
            ],
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
              '-\$34',
              style: TextStyle(
                fontSize: 20,
                color: kPurpleColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class QuizHistoryContainer extends StatelessWidget {
  final String quizTitle;
  final String date;
  final String buttonTitle;
  final Color buttonColor;
  final String quizStatus;

  const QuizHistoryContainer({
    Key key,
    this.quizTitle,
    this.date,
    this.buttonTitle,
    this.buttonColor,
    this.quizStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(16),
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
          Row(
            children: [
              Container(
                width: 33.0.w,
                height: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image(
                    image: AssetImage('assets/images/Image.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10.0.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 1.0.h),
                  SubmittButton(
                    color: buttonColor,
                    title: buttonTitle,
                    titleColor: kWhiteColor,
                    width: 25.0.w,
                    height: 4.5.h,
                    ontap: () {},
                  ),
                  SizedBox(height: 1.0.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 10),
                    child: Text(
                      quizStatus,
                      style: TextStyle(
                        fontSize: 18.0.sp,
                        color: kPurpleColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(quizTitle,
                    style: TextStyle(
                        fontSize: 12.0.sp, fontWeight: FontWeight.w600)),
                SizedBox(height: 1.0.h),
                Row(
                  children: [
                    Image(
                      image: AssetImage('assets/icons/watch.png'),
                      width: 15,
                      height: 15,
                      color: kBlackColor,
                    ),
                    SizedBox(width: 1.0.w),
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: 10.0.sp,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SeeMoreRow extends StatelessWidget {
  final String title;
  const SeeMoreRow({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,
            style: TextStyle(
                color: kPurpleColor,
                fontSize: 14.0.sp,
                fontWeight: FontWeight.w900)),
        Spacer(),
        Image(
          image: AssetImage('assets/icons/see_more.png'),
          width: 25,
          height: 25,
        ),
      ],
    );
  }
}
