import 'package:adsk_forge_flutter/API/forgeAPI.dart' as forgeAPI;
import 'package:adsk_forge_flutter/classes/utils.dart';
import 'package:adsk_forge_flutter/models/register_model.dart';
import 'package:dio/dio.dart';

// Post the data for user registration
Future<RegisterModel?> postRegisterURL(
    String name, String email, String password) async {
  Response? response;

  // Generate MD5 from password
  password = generateMD5(password);

  try {
    response = await forgeAPI.client.post(
        '${forgeAPI.registerURI}?name=$name&email=$email&password=$password');
    print(response);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return RegisterModel.fromJson(response.data);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to make the request to server');
    }
  } on DioError catch (e) {
    // The request was made and the server responded with a status code
    // that falls out of the range of 2xx and is also not 304.
    if (e.response != null) {
      print(e.response!.data);
      print(e.response!.headers);
    } else {
      // Something happened in setting up or sending the request that triggered an Error
      print(e.message);
    }
    return null;
  }
}

String? validateEmail(String input) {
  if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(input)) {
    return 'Please enter a valid Email';
  }
  return null;
}

String? validatePassword(String input) {
  bool hasUppercase = input.contains(RegExp(r'[A-Z]'));
  bool hasDigits = input.contains(RegExp(r'[0-9]'));
  bool hasLowercase = input.contains(RegExp(r'[a-z]'));
  bool hasSpecialCharacters = input.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  bool hasMinLength = input.length >= 8;

  String errorText = "";

  if (!hasMinLength) errorText += "8 characters | ";
  if (!hasUppercase) errorText += "1 uppercase letter | ";
  if (!hasLowercase) errorText += "1 lowercase letter | ";
  if (!hasDigits) errorText += "1 number | ";
  if (!hasSpecialCharacters) errorText += "1 special character | ";

  if (errorText == "") return null;
  return errorText;
}

String? validateName(String input) {
  if (!RegExp(r'[a-zA-Z]').hasMatch(input)) {
    return 'Please enter a valid name';
  }
  return null;
}

String? validateConfirmPassword(String input, String compareInput) {
  if (input != compareInput) return 'Passwords doesn\'t match';
  return null;
}
