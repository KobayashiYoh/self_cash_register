import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_cash_register/widgets/tile_button.dart';

class TopPage extends StatelessWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ご利用のサービスを選択してください',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: TileButton(
                      onTap: () {},
                      iconData: Icons.cloud_upload,
                      text: '商品登録',
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: TileButton(
                      onTap: () {},
                      iconData: Icons.barcode_reader,
                      text: 'お会計',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
