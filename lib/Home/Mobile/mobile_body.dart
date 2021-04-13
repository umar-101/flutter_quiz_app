import 'package:flutter/material.dart';

import '../../const.dart';
import '../alert_dialog.dart';
import 'package:sizer/sizer.dart';

class MobileBody extends StatelessWidget {
  const MobileBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: kWhiteColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        child: Column(
          children: [
            TopProfileContainer(),
            SizedBox(height: 3.0.h),
            Row(
              children: [
                Text('All courses available',
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
            ),
            SizedBox(height: 5),
            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    mainAxisExtent: 250,
                    maxCrossAxisExtent: 400,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) => GridContainer()),
            )
          ],
        ),
      ),
    );
  }
}

class GridContainer extends StatelessWidget {
  const GridContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(12),
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
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              child: Image(
                image: AssetImage('assets/images/Image.png'),
                width: 25,
                height: 25,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 60.0.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lorem ipsum dolor sit amet.',
                        style: TextStyle(
                            fontSize: 12.0.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor.',
                        style: TextStyle(fontSize: 10.0.sp, height: 1.5),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image(
                      image: AssetImage('assets/icons/watch.png'),
                      width: 12,
                      height: 12,
                      color: kBlackColor,
                    ),
                    SizedBox(width: 5),
                    Text(
                      '2 hours',
                      style: TextStyle(
                        fontSize: 9.0.sp,
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BuyQuizDialog()),
                        );
                      },
                      child: Container(
                        width: 20.0.w,
                        height: 4.0.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xFFFFAB1D),
                        ),
                        child: Center(
                          child: Text(
                            'Buy Quiz',
                            style: TextStyle(
                              color: kWhiteColor,
                              fontSize: 10.0.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TopProfileContainer extends StatelessWidget {
  const TopProfileContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 18.0.w,
      decoration: BoxDecoration(
          color: kOrangeColor, borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 5, 0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Hi Stacey',
                        style: TextStyle(
                            color: kWhiteColor,
                            fontSize: 24,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 1.0.w),
                      Image(
                        image: AssetImage('assets/icons/wave_hand.png'),
                        width: 25,
                        height: 25,
                      )
                    ],
                  ),
                  SizedBox(height: 0.5.h),
                  Container(
                    width: 110,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xFFFFAB1D),
                    ),
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage('assets/icons/medal.png'),
                          width: 15,
                          height: 15,
                        ),
                        SizedBox(width: 5),
                        Text(
                          '452 points',
                          style: TextStyle(
                              color: kWhiteColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Expanded(
              flex: 7,
              child: Image(
                image: AssetImage('assets/images/profile_sideImage.png'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
