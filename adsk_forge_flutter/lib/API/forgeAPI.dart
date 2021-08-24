import 'package:dio/dio.dart';

// New Dio with a BaseOptions instance.
var options = BaseOptions(
    baseUrl: 'https://autodesk-forge-api.herokuapp.com',
    connectTimeout: 30000,
    receiveTimeout: 30000,
    headers: {
      'Content-Type': 'application/json',
    });

// Create Dio client for requests
Dio client = Dio(options);

// Path for user login
String loginURI = '/user/login';

// Path for user registration
String registerURI = '/user/register';

// Path for Autodesk auth
String forgeAuth = '/forge/login';
