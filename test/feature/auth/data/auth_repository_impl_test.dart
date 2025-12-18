import 'package:flutter_test/flutter_test.dart';

import 'package:boilerplate_getx/feature/auth/data/datasource/auth_datasource.dart';
import 'package:boilerplate_getx/feature/auth/data/models/user_model.dart';
import 'package:boilerplate_getx/feature/auth/data/repositories/auth_repository_impl.dart';
import 'package:boilerplate_getx/feature/auth/domain/entities/user.dart';


/// DataSource Fake: 실제 Dio 호출 대신 고정된 DTO 반환
class FakeAuthDataSource implements AuthDataSource {
  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    return UserModel(
      id: '999',
      email: email,
      name: 'Remote User',
    );
  }
}

void main() {
  group('AuthRepositoryImpl', () {
    test('DataSource의 UserModel을 User 엔티티로 변환한다', () async {
      // given
      final ds = FakeAuthDataSource();
      final repo = AuthRepositoryImpl(ds);

      // when
      final user = await repo.login(
        email: 'test@test.com',
        password: '1234',
      );

      // then
      expect(user, isA<User>());
      expect(user.id, '999');
      expect(user.email, 'test@test.com');
      expect(user.name, 'Remote User');
    });
  });
}
