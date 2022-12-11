import 'dart:convert';

import '../pages/page_welcome.dart';
import '../pages/page_myaccount.dart';
import 'profile.dart';
import 'token.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import 'package:http/http.dart' as http;

class Helper {
  static Uri linkRegister =
      Uri.parse("https://chocaycanh.club/public/api/register");
  static Uri linkLogin = Uri.parse("https://chocaycanh.club/public/api/login");
  static Uri linkProfile = Uri.parse("https://chocaycanh.club/public/api/me");
  static Uri linkUpdateProfile =
      Uri.parse("https://chocaycanh.club/public/api/me/details");
  static Uri linkuploadavatar =
      Uri.parse("https://chocaycanh.club/public/api/me/avatar");
  static String baseurl = "https://chocaycanh.club/public/api/me/base/";
  static String token = "";
  static Widget createBottomNaviItem(IconData icon, Function() press) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: press,
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void nextPage(BuildContext context, Widget page) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return page;
    }));
  }

  static void newPage(BuildContext context, Widget page) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
      return page;
    }));
  }

  static void newUniquePage(BuildContext context, Widget page) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => page),
        (Route<dynamic> route) => false);
  }

  static Future<void> postSignup(
      BuildContext context, String username, String mail, String pass) async {
    final http.Response response = await http.post(
      linkRegister,
      headers: <String, String>{
        'Content-Type': 'aplication/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "username": username,
        "email": mail,
        "password": pass,
        "password_confirmation": pass,
        "tos": 'true',
      }),
    );
    debugPrint('trong phuong thuc dang nhap');
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    if (response.statusCode == 201) {
      Helper.nextPage(context, PageWelcome());
    } else {
      throw Exception('Khong xac dinh loi trong dang ky');
    }
  }

  static Future<void> getProfile(BuildContext context) async {
    final http.Response response = await http.get(
      linkProfile,
      headers: <String, String>{
        'Content-Type': 'aplication/json; charset=UTF-8',
        'Authorization': 'Bearer ' + Token.value,
        'Accept': 'application/json',
      },
    );
    debugPrint('.. get Profile ..');
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      Profile.fromJson((body['data']));
      Helper.newUniquePage(context, MyaccountPage());
    } else {
      // throw Exception('Khong xac dinh loi trong dang ky');
    }
  }
}

//Thanh bar tim kiem
class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    'Bi mat Phan Thien An',
    'Con duoc la chinh minh',
    'Cay cam ngot cua toi',
    'Hanh tinh cua mot ke nghi nhieu',
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear)),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var books in searchTerms) {
      if (books.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(books);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var books in searchTerms) {
      if (books.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(books);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
