class LoginClass {
  final String _email;
  final String _password;

  const LoginClass({required e, required p})
      : this._email = e,
        this._password = p;

  String get email => _email;
  String get password => _password;
}
