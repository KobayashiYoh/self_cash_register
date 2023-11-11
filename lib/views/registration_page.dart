import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_cash_register/providers/registration_notifier.dart';
import 'package:self_cash_register/widgets/tile_button.dart';

class RegistrationPage extends ConsumerWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(registrationProvider);
    final notifier = ref.read(registrationProvider.notifier);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: state.idController,
                decoration: const InputDecoration(labelText: '商品ID'),
              ),
              TextField(
                controller: state.nameController,
                decoration: const InputDecoration(labelText: '商品名'),
              ),
              SizedBox(height: 64.h),
              Row(
                children: [
                  Expanded(
                    child: TileButton(
                      onTap: notifier.registerProduct,
                      iconData: Icons.barcode_reader,
                      text: 'ID自動入力',
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: TileButton(
                      onTap: notifier.registerProduct,
                      iconData: Icons.send,
                      text: '登録',
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
