import 'package:flutter/material.dart';
// importing our pages into our route.dart
import 'package:userapp/views/login.dart';
import 'package:userapp/views/edit.dart';
import 'package:userapp/main.dart';
import 'package:userapp/views/newsarticles.dart';

// variable for our route names
const String loginPage = 'login';
const String editPage = 'edit';
const String homePage = 'main';
const String apiPage = 'page';
const String newsArticle = 'newsPage';

void login() {}

// controller function with switch statement to control page route flow
Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case loginPage:
      return MaterialPageRoute(builder: (context) => LoginPage());
    case editPage:
      return MaterialPageRoute(builder: (context) => EditPage());
    case homePage:
      return MaterialPageRoute(builder: (context) => MyCustomForm());  
    case newsArticle:
      return MaterialPageRoute(builder: (context) => NewsArticlePage());
    default:
      throw ('this route name does not exist');
  }
}
