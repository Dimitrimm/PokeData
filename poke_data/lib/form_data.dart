
enum AuthMode {signup, login}

class FormData {
  String name = "";
  String email = "";
  String password = "";
  AuthMode _mode = AuthMode.login;

  bool get isLogin{
    return _mode == AuthMode.login;
  }

  bool get isSignup{
    return _mode == AuthMode.signup;
  }

  void toggleMode(){
    _mode = isLogin ? AuthMode.signup : AuthMode.login;
  }

}