import 'package:adsk_forge_flutter/API/forgeAPI.dart' as forgeAPI;
import 'package:adsk_forge_flutter/models/login_model.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';

Future<LoginModel?> getLoginURL(String email, String password) async {
  Response? response;

  // Get general device info
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  // Create web device info
  WebBrowserInfo webBrowserInfo;
  webBrowserInfo = await deviceInfo.webBrowserInfo;
  try {
    response = await forgeAPI.client
        .get('${forgeAPI.loginURI}?email=$email&password=$password');

    print("Browser::appCodeName::${webBrowserInfo.appCodeName}");
    print("Browser::appName::${webBrowserInfo.appName}");
    print("Browser::appVersion::${webBrowserInfo.appVersion}");
    print("Browser::browserName::${webBrowserInfo.browserName}");
    print("Browser::deviceMemory::${webBrowserInfo.deviceMemory}");
    print(
        "Browser::hardwareConcurrency::${webBrowserInfo.hardwareConcurrency}");
    print("Browser::language::${webBrowserInfo.language}");
    print("Browser::languages::${webBrowserInfo.languages}");
    print("Browser::maxTouchPoints::${webBrowserInfo.maxTouchPoints}");
    print("Browser::platform::${webBrowserInfo.platform}");
    print("Browser::product::${webBrowserInfo.product}");
    print("Browser::productSub::${webBrowserInfo.productSub}");
    print("Browser::userAgent::${webBrowserInfo.userAgent}");
    print("Browser::vendor::${webBrowserInfo.vendor}");
    print("Browser::vendorSub::${webBrowserInfo.vendorSub}");

    print(response);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return LoginModel.fromJson(response.data);
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
