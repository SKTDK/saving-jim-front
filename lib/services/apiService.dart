import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:saving_jim/services/IApiService.dart';
import 'package:saving_jim/models/User.dart';

class ApiService implements IApiService {
  Future<User> login(String username, String password) async {
    Map map = {'username': username, 'password': password};
    String remote = _localhost();
    String url = remote + ':' + '8080' + "/login";

    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    request.add(utf8.encode(jsonEncode(map)));

    HttpClientResponse response = await request.close();

    String reply = await response.transform(utf8.decoder).join();

    httpClient.close();
    final body = jsonDecode(reply);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (body['success']) {
      await sharedPreferences.setString('token', body['token']);
      await sharedPreferences.setString('user', jsonEncode(body['user']));
      print(jsonEncode(body['user']));
      return new User.fromJson(body['user']);
    } else {
      await sharedPreferences.setString('token', null);
      await sharedPreferences.setString('user', null);
      return null;
    }
  }

  String _localhost() {
    if (Platform.isAndroid) {
      return 'http://10.0.2.2';
    } else {
      return 'http://localhost';
    }
  }
}
