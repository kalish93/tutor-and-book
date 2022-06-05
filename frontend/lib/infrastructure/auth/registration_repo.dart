
import 'package:meta/meta.dart';
import '../../domain/auth/user_model.dart';
import '../../infrastructure/auth/user_data.dart';


class UserRepository{ 
  final UserDataProvider dataProvider;
  UserRepository(this.dataProvider);

  Future<Future> create(User user) async {
    return dataProvider.create(user);
  }
}
