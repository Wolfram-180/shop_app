import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import '../keys/firebase_token.dart';
import '../models/http_exception.dart';

class Auth with ChangeNotifier {
  String _DBtoken = fbToken;

  DateTime _userTokenExpiryDate = DateTime(1999, 1, 1);
  late String _userId;
  String _token = '';

  bool get isAuth {
    return token != '';
  }

  String get token {
    if (_userTokenExpiryDate != null &&
        _userTokenExpiryDate.isAfter(DateTime.now()) &&
        _token != '') {
      return _token;
    } else
      return '';
  }

  String get userId {
    return _userId;
  }

  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=$_DBtoken');
    try {
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
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _userTokenExpiryDate = DateTime.now()
          .add(Duration(seconds: int.parse(responseData['expiresIn'])));
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }

  void logout() {
    _token = '';
    _userId = '';
    _userTokenExpiryDate = DateTime(1999, 1, 1);
    notifyListeners();
  }
}
