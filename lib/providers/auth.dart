import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import '../keys/firebase_token.dart' as fbTokenKeyInGitignore;

class Auth with ChangeNotifier {
  String _token = fbTokenKeyInGitignore.fbToken;
  late DateTime _expiryDate;
  late String _userId;

  Future<void> signup(String email, String password) async {
    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_token');
    final response = await http.post(
      url,
      body: json.encode(
        {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      ),
    );
    print(json.decode(response.body));
  }
}
