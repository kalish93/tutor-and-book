abstract class AuthState {}

class Idle extends AuthState {}

class CreatingUser extends AuthState {}

class CreateUserSuccced extends AuthState {}

class CreateUserFail extends AuthState {}
