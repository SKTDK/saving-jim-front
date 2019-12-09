import 'dart:convert';
import 'dart:io';
import 'package:saving_jim/models/Game.dart';
import 'package:saving_jim/views/pages/ChildDashboard/GameListPage.dart';
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
  Future<bool> addUser(String firstname, String lastname, String username,
      String password, int accountType) async {
    Map map = {
      'accountType': accountType,
      'firstname': firstname,
      'lastname': lastname,
      'username': username,
      'password': password
    };
    String remote = _localhost();
    String url =
        remote + ':' + constants.SERVER_PORT.toString() + "/accounts/addUser";

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

  // change account state
  Future<bool> updateAccount(int currentId, String newFirstname,
      String newLastname, String newPassword) async {
    Map map = {
      'id': currentId,
      'firstname': newFirstname,
      'lastname': newLastname,
      'password': newPassword,
    };
    String remote = _localhost();
    String url = remote +
        ':' +
        constants.SERVER_PORT.toString() +
        "/accounts/updateAccount";

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

  Future<List<Game>> fetchGames(int typeInt) {}
}
