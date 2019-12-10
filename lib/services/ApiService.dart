import 'dart:convert';
import 'dart:io';
import 'package:saving_jim/models/Category.dart';
import 'package:saving_jim/models/Game.dart';
import 'package:saving_jim/models/Habit.dart';
import 'package:saving_jim/models/Statistic.dart';
import 'package:saving_jim/views/pages/ChildDashboard/GameListPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:saving_jim/services/IApiService.dart';
import 'package:saving_jim/models/User.dart';
import 'package:saving_jim/utils/constants.dart' as constants;

import 'HabitRepository.dart';

class ApiService implements IApiService {
  //login
  Future<User> login(String username, String password) async {
    Map map = {'username': username, 'password': password};
    String url = _remote() + "/login";

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
    String url = _remote() + "/accounts/addUser";

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

    String url = _remote() + "/accounts/usersByAccountType";

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
    String url = _remote() + "/accounts/changeAccountState";

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
    String url = _remote() + "/accounts/updateAccount";

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

  String _remote() {
    if (Platform.isAndroid) {
      return constants.SERVER_ADDRESS_ANDROID;
    } else {
      return constants.SERVER_ADDRESS_IOS;
    }
  }

  Future<List<Game>> fetchGames(int typeInt) {}

  List<Category> fetchCategories() {
    List<Category> ret = new List<Category>();
    ret.add(Category(
        1, 'deplacement', 'desc', 'assets/img/categories/deplacement.jpg'));
    ret.add(Category(
        2, 'habitation', 'desc', 'assets/img/categories/habitation.jpg'));
    ret.add(
        Category(3, 'loisirs', 'desc', 'assets/img/categories/loisirs.jpg'));
    ret.add(Category(
        4, 'nutrition', 'desc', 'assets/img/categories/nutrition.jpg'));
    ret.add(Category(5, 'relations, communication', 'desc',
        'assets/img/categories/relationscom.jpg'));
    ret.add(Category(6, 'responsabilités', 'desc',
        'assets/img/categories/responsabilites.jpg'));
    ret.add(Category(7, 'soins personnels', 'desc',
        'assets/img/categories/soinspersonnels.jpg'));
    return ret;
  }

  Future<List<Statistic>> fetchStatistics() async {
    String url = _remote() + "/accounts/statistics";

    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json; charset=utf-8');
    // auth with jwt token
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    request.headers.set('authorization', sharedPreferences.get('token'));

    HttpClientResponse response = await request.close();

    String reply = await response.transform(utf8.decoder).join();
    httpClient.close();
    final body = json.decode(reply);
    if (body != null) {
      print(body.toString());
      Iterable i = body;
      List<Statistic> myThing = (jsonDecode(reply) as List)
          .map((e) => new Statistic.fromJson(e))
          .toList();
      List<Statistic> users = List<Statistic>();
      i.forEach((res) {
        users.add(new Statistic.fromJson(res));
      });
      return myThing;
    } else {
      return null;
    }
  }

  List<Habit> fetchHabits(int categoryId) {
    return new HabitRepository()
        .getHabits()
        .where((i) => i.categoryId == categoryId.toString())
        .toList();
  }
}
