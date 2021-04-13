import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SubmittButton extends StatelessWidget {
  final String title;
  final Color color, titleColor;
  final double width, height;
  final Function ontap;
  const SubmittButton({
    Key key,
    this.title,
    this.color,
    this.width,
    this.height,
    this.ontap,
    this.titleColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 35,
        ),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: color,
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 10.0.sp,
                  color: titleColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
