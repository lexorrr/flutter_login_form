import 'package:flutter/material.dart';
import 'package:flutter_login_form/models/login_class.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _key = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  static const maxLength = 10;

  String? _validateEmail(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return 'Field cannot be empty';
      } else {
        return null;
      }
    }

    return null;
  }

  String? _validatePassword(String? value) {
    if (value != null) {
      if (value.length < 8) {
        return 'At least 8 chars!';
      } else {
        return null;
      }
    }

    return null;
  }

  void _login() {
    if (_key.currentState?.validate() ?? false) {
      final email = emailController.text;
      final password = passwordController.text;

      final login = LoginClass(e: email, p: password);

      debugPrint('Yay! :)');
      debugPrint('login: email: ${login.email}, password: ${login.password}');

      if (emailController.text != '') {
        final start = emailController.selection.start;
        final end = emailController.selection.end;

        final selectedText = emailController.text.substring(start, end);
        debugPrint(selectedText);
      }
    } else {
      return null;
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          // Email
          TextFormField(
            maxLength: maxLength,
            controller: emailController,
            decoration: InputDecoration(
                counterText:
                    'Chars left: ${maxLength - emailController.text.length}',
                icon: Icon(Icons.email),
                hintText: 'Email'),
            validator: _validateEmail,
          ),
          // Password
          TextFormField(
            maxLength: 16,
            controller: passwordController,
            decoration: const InputDecoration(
                icon: Icon(Icons.vpn_key), hintText: 'Password'),
            obscureText: true,
            validator: _validatePassword,
          ),
          // Confirm Button
          ElevatedButton(
            child: const Text('Login'),
            onPressed: _login,
          ),
        ],
      ),
    );
  }
}
