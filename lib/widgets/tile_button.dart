import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TileButton extends StatelessWidget {
  const TileButton({
    Key? key,
    required this.onTap,
    required this.iconData,
    required this.text,
  }) : super(key: key);
  final void Function()? onTap;
  final IconData iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Container(
          padding: EdgeInsets.all(16.w),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.indigo[900],
            borderRadius: BorderRadius.circular(16.sp),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: 64.w,
                color: Colors.white,
              ),
              SizedBox(height: 8.h),
              Text(
                text,
                style: TextStyle(
                  fontSize: 24.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
