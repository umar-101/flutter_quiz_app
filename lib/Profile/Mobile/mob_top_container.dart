import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../const.dart';

class MobTopContainer extends StatelessWidget {
  const MobTopContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.0.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: kOrangeColor, borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      'Stacey Palmer',
                      style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 18.0.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.edit,
                      color: kWhiteColor,
                      size: 14.0.sp,
                    ),
                  ],
                ),
                SizedBox(height: 5),
                PhoneEmailContainer(
                  title: '+92 314 7891911',
                  icon: Icons.phone,
                ),
                SizedBox(height: 5),
                PhoneEmailContainer(
                  title: 'example@gamil.com',
                  icon: Icons.email,
                ),
              ],
            ),
            Spacer(),
            Expanded(
              child: Image(
                image: AssetImage('assets/images/profile.png'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PhoneEmailContainer extends StatelessWidget {
  final String title;
  final IconData icon;
  const PhoneEmailContainer({
    Key key,
    this.icon,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 5.0.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(0xFFFFAB1D),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: kWhiteColor, size: 16),
          SizedBox(width: 5),
          Text(
            title,
            style: TextStyle(
                color: kWhiteColor, fontSize: 13, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
