import 'package:financy_app/common/models/user_model.dart';
import 'package:financy_app/services/auth_service.dart';

class MockAuthService implements AuthService {
  @override
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await Future.delayed(Duration(seconds: 2));
      return UserModel(id: email.hashCode, email: email);
    } catch (e) {
      throw 'Não foi possível realizar o login.';
    }
  }

  @override
  Future<UserModel> signUp({
    String? name,
    required String email,
    required String password,
  }) async {
    try {
      await Future.delayed(Duration(seconds: 2));
      if (password.startsWith('123')) {
        throw Exception();
      }
      return UserModel(id: email.hashCode, name: name, email: email);
    } catch (e) {
      if (password.startsWith('123')) {
        throw 'Senha insegura, digite uma senha forte';
      }
      throw 'Não foi possível criar sua conta';
    }
  }
}
