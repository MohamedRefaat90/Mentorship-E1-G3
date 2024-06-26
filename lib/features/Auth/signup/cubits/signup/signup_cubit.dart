import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spacexx/core/helpers/functions/snakbar.dart';
import 'package:spacexx/core/networking/auth_exception.dart';
import 'package:spacexx/features/Auth/signup/cubits/fields_validator/fields_validator_cubit.dart';
import 'package:spacexx/features/Auth/signup/data/models/user_model.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  late UserModel user;

  emitSignupUser(
      FieldsValidatorCubit fieldsValidatorCubit, BuildContext context) {
    if (fieldsValidatorCubit.validateAllFields()) {
      signupUserToFireBase(context);
    } else {
      emit(SignupFailure(errorMSG: "Enter Valid Data"));
    }
  }

  signupUserToFireBase(BuildContext context) async {
    emit(SignupLoading());
    try {
      debugPrint(user.email);
      debugPrint(user.password);
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      emit(SignupSuccess());
    } on FirebaseAuthException catch (error) {
      emit(SignupInitial());
      if (!context.mounted) return;
      showSnackBar(context, AuthExceptionHandler.handleException(error));
    }
  }
}
