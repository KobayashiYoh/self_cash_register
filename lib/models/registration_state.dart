import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'registration_state.freezed.dart';

@freezed
class RegistrationState with _$RegistrationState {
  const factory RegistrationState({
    required bool isLoading,
    required TextEditingController? idController,
    required TextEditingController? nameController,
  }) = _RegistrationState;
}

const RegistrationState kDefaultRegistrationState = RegistrationState(
  isLoading: false,
  idController: null,
  nameController: null,
);
