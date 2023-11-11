import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:self_cash_register/models/registration_state.dart';
import 'package:self_cash_register/repository/firestore_repository.dart';

final registrationProvider =
    StateNotifierProvider<RegistrationNotifier, RegistrationState>(
  (ref) => RegistrationNotifier(),
);

class RegistrationNotifier extends StateNotifier<RegistrationState> {
  RegistrationNotifier() : super(kDefaultRegistrationState) {
    _setIdController(TextEditingController());
    _setNameController(TextEditingController());
  }

  void _setLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }

  void _setIdController(TextEditingController controller) {
    state = state.copyWith(idController: controller);
  }

  void _setNameController(TextEditingController controller) {
    state = state.copyWith(nameController: controller);
  }

  Future<void> registerProduct() async {
    if (state.isLoading) {
      return;
    }
    _setLoading(true);
    try {
      await FirestoreRepository.setProduct(
        id: state.idController!.text,
        name: state.nameController!.text,
      );
    } catch (e) {
      rethrow;
    } finally {
      _setLoading(false);
    }
  }

  @override
  void dispose() {
    state.idController?.dispose();
    state.nameController?.dispose();
    super.dispose();
  }
}
