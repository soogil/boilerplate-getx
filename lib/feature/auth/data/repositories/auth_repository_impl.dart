import 'package:boilerplate_getx/feature/auth/data/datasource/auth_datasource.dart';
import 'package:boilerplate_getx/feature/auth/data/models/user_model.dart';
import 'package:boilerplate_getx/feature/auth/domain/entities/user.dart';
import 'package:boilerplate_getx/feature/auth/domain/repositories/auth_repository.dart';


// 도메인과 data 연결 해주는 구현
class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _dataSource;

  AuthRepositoryImpl(this._dataSource);

  @override
  Future<User> login({
    required String email,
    required String password,
  }) async {
    final model = await _dataSource.login(email: email, password: password);

    return model.toEntity();
  }
}

