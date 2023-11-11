import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_cash_register/repository/firestore_repository.dart';
import 'package:self_cash_register/widgets/tile_button.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productIdController = TextEditingController();

  @override
  void dispose() {
    _productNameController.dispose();
    _productIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _productNameController,
                decoration: const InputDecoration(labelText: '商品名'),
              ),
              SizedBox(height: 16.h),
              TextField(
                controller: _productIdController,
                decoration: const InputDecoration(labelText: '商品ID'),
              ),
              SizedBox(height: 64.h),
              SizedBox(
                height: 0.5.sw,
                child: TileButton(
                  onTap: () => FirestoreRepository.setProduct(
                    id: _productIdController.text,
                    name: _productNameController.text,
                  ),
                  iconData: Icons.send,
                  text: '登録',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
