import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:maro/featuers/Authentication/Data/auth_api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService _authService;
  final SharedPreferences _preferences;

  AuthCubit(this._authService, this._preferences) : super(AuthInitial()) {
    _checkAuthState(); // Check if the user is already logged in on app start
  }

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
        email: email,
        phoneNumber: phoneNumber,
        invitationBy: invitationBy,
      );

      await _authService.verifyAccount(
        phoneNumber: phoneNumber,
        code: '', // OTP code will be handled in the verification screen
      );

      // Save the phone number and username in shared preferences
      await _preferences.setString('phoneNumber', phoneNumber);
      await _preferences.setString('userName', userName);
      await _preferences.setString('invitationBy', invitationBy);


      emit(AuthSuccess(phoneNumber: phoneNumber, userName: userName, invtationCode: invitationBy));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> loginUser({
    required String phoneNumber,
    required String userName,
  }) async {
    emit(AuthLoading());
    try {
      await _authService.loginUser(phoneNumber: phoneNumber);

      // Save the phone number and username in shared preferences
      await _preferences.setString('phoneNumber', phoneNumber);
      await _preferences.setString('userName', userName);

      emit(AuthSuccess(phoneNumber: phoneNumber, userName: userName, invtationCode: ''));
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

  Future<void> logout() async {
    await _preferences.remove('phoneNumber'); // Remove saved state
    await _preferences.remove('userName'); // Remove saved username
    emit(AuthInitial());
  }

  Future<void> _checkAuthState() async {
    final String? phoneNumber = _preferences.getString('phoneNumber');
    final String? userName = _preferences.getString('userName');
    if (phoneNumber != null && userName != null) {
      emit(AuthSuccess(phoneNumber: phoneNumber, userName: userName, invtationCode: ''));
    } else {
      emit(AuthInitial());
    }
  }
}
