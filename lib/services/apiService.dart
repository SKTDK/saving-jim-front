import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/User.dart';

class ApiService {
  Future<User> login(String username, String password) async {
    Map map = {'username': username, 'password': password};
    String remote = _localhost();

    String url = remote + ':' + '8080' + "/login";

    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    request.add(utf8.encode(json.encode(map)));
    //log(json.encode(map).toString());

    HttpClientResponse response = await request.close();

    // TODO: check response.statusCode
    String reply = await response.transform(utf8.decoder).join();

    httpClient.close();
    final body = json.decode(reply);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (body['success']) {
      final String token = body['token'];
      await sharedPreferences.setString('token', token);
      return new User(username, password);
    } else {
      await sharedPreferences.setString('token', null);
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
