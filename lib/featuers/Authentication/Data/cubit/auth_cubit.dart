import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:maro/featuers/Authentication/Data/auth_api_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService _authService;

  AuthCubit(this._authService) : super(AuthInitial());

  Future<void> registerUser({
    required String userName,
    required String email,
    required String phoneNumber,
    required String invitationBy,
  }) async {
    emit(AuthLoading());
    try {
      await _authService.registerUser(
        userName: userName,
        email: userName,
        phoneNumber: phoneNumber,
        invitationBy: phoneNumber,
      );

        await _authService.verifyAccount(
        phoneNumber: phoneNumber,
        code: '', // OTP code will be handled in the verification screen
      );

      emit(AuthSuccess(phoneNumber: phoneNumber));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  
  Future<void> loginUser({
    required String phoneNumber,
  }) async {
    emit(AuthLoading());
    try {
      await _authService.loginUser(phoneNumber: phoneNumber);

      // Request to resend verification code after login
      await _authService.resendVerificationCode(phoneNumber: phoneNumber);

      emit(AuthSuccess(phoneNumber: phoneNumber));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> verifyAccount({
    required String phoneNumber,
    required String code,
  }) async {
    emit(AuthLoading());
    try {
      await _authService.verifyAccount(phoneNumber: phoneNumber, code: code);
      emit(AuthVerificationSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
