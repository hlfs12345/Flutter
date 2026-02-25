import 'package:financy_app/common/models/user_model.dart';
import 'package:financy_app/features/sign_up/sign_up_controller.dart';
import 'package:financy_app/features/sign_up/sign_up_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mock/mock_classes.dart';

void main() {
  late SignUpController signUpController;
  late MockSecureStorage mockSecureStorage;
  late MockFirebaseAuthService mockFirebaseAuthService;
  late UserModel user;

  setUp(() {
    mockSecureStorage = MockSecureStorage();
    mockFirebaseAuthService = MockFirebaseAuthService();
    user = UserModel(name: 'User', email: 'user@email.com', id: '1254Abf');
    signUpController = SignUpController(
      mockFirebaseAuthService,
      mockSecureStorage,
    );
  });

  test('Tests Sign Up Controller Sucess State', () async {
    expect(signUpController.state, isInstanceOf<SignUpInitialState>());

    when(
      () => mockSecureStorage.write(key: "CURRENT_USER", value: user.toJson()),
    ).thenAnswer((_) async {});

    when(
      () => mockFirebaseAuthService.signUp(
        name: 'User',
        email: 'user@email.com',
        password: 'user@123',
      ),
    ).thenAnswer((_) async => user);

    await signUpController.signUp(
      name: 'User',
      email: 'user@email.com',
      password: 'user@123',
    );

    expect(signUpController.state, isInstanceOf<SignUpStateSuccess>());
  });

  test('Tests Sign Up Controller Error State', () async {
    expect(signUpController.state, isInstanceOf<SignUpInitialState>());

    when(
      () => mockSecureStorage.write(key: "CURRENT_USER", value: user.toJson()),
    ).thenAnswer((_) async {});

    when(
      () => mockFirebaseAuthService.signUp(
        name: 'User',
        email: 'user@email.com',
        password: 'user@123',
      ),
    ).thenThrow(Exception());

    await signUpController.signUp(
      name: 'User',
      email: 'user@email.com',
      password: 'user@123',
    );

    expect(signUpController.state, isInstanceOf<SignUpStateError>());
  });
}
