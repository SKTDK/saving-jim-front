import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:saving_jim/services/IApiService.dart';
import 'package:saving_jim/models/User.dart';
import 'package:saving_jim/utils/constants.dart' as constants;

class ApiService implements IApiService {
  //login
  Future<User> login(String username, String password) async {
    Map map = {'username': username, 'password': password};
    String remote = _localhost();
    String url = remote + ':' + constants.SERVER_PORT.toString() + "/login";

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
      print(body.toString());
      return new User.fromJson(body['user']);
    } else {
      await sharedPreferences.setString('token', null);
      await sharedPreferences.setString('user', null);
      return null;
    }
  }

// add manager
  Future<bool> addManager(String firstname, String lastname, String username,
      String password) async {
    Map map = {
      'firstname': firstname,
      'lastname': lastname,
      'username': username,
      'password': password
    };
    String remote = _localhost();
    String url = remote +
        ':' +
        constants.SERVER_PORT.toString() +
        "/accounts/addManager";

    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    // auth with jwt token
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    request.headers.set('authorization', sharedPreferences.get('token'));

    request.add(utf8.encode(jsonEncode(map)));

    HttpClientResponse response = await request.close();

    String reply = await response.transform(utf8.decoder).join();

    httpClient.close();
    final body = jsonDecode(reply);
    if (body['success']) {
      print('User created!');
      return true;
    } else {
      return false;
    }
  }

// user
  Future<List<User>> fetchUsers(int accountType) async {
    Map map = {'accountType': accountType};
    String remote = _localhost();
    String url = remote +
        ':' +
        constants.SERVER_PORT.toString() +
        "/accounts/usersByAccountType";

    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json; charset=utf-8');
    // auth with jwt token
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    request.headers.set('authorization', sharedPreferences.get('token'));

    request.add(utf8.encode(jsonEncode(map)));

    HttpClientResponse response = await request.close();

    String reply = await response.transform(utf8.decoder).join();
    // print(reply);
    httpClient.close();
    final body = json.decode(reply);
    if (body != null) {
      //print('Users fetched!');
      print(body.toString());
      Iterable i = body;
      List<User> myThing =
          (jsonDecode(reply) as List).map((e) => new User.fromJson(e)).toList();
      List<User> users = List<User>();
      i.forEach((res) {
        users.add(new User.fromJson(res));
      });
      return myThing;
    } else {
      return null;
    }
  }

// change account state
  Future<bool> changeAccountState(User user) async {
    Map map = {'username': user.username, 'active': !user.active};
    String remote = _localhost();
    String url = remote +
        ':' +
        constants.SERVER_PORT.toString() +
        "/accounts/changeAccountState";

    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    // auth with jwt token
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    request.headers.set('authorization', sharedPreferences.get('token'));

    request.add(utf8.encode(jsonEncode(map)));

    HttpClientResponse response = await request.close();

    String reply = await response.transform(utf8.decoder).join();

    httpClient.close();
    final body = jsonDecode(reply);
    if (body['success']) {
      print('Done');
      return true;
    } else {
      return false;
    }
  }

  String _localhost() {
    if (Platform.isAndroid) {
      return constants.SERVER_ADDRESS_ANDROID;
    } else {
      return constants.SERVER_ADDRESS_IOS;
    }
  }
}
