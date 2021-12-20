import 'package:flutter/material.dart';
import 'package:userapp/navigation/constants/navigation_route_constant.dart';

// importing our pages into our route.dart
import 'package:userapp/views/edit.dart';
import 'package:userapp/views/counterapp.dart';
import 'package:userapp/main.dart';
import 'package:userapp/views/newsarticles.dart';

// controller function with switch statement to control page route flow
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case NavigationRouteConstant.edit:
      return MaterialPageRoute(
          builder: (_) => EditPage(),
          settings: const RouteSettings(name: NavigationRouteConstant.edit)); 
    case NavigationRouteConstant.newsArticle:
      return MaterialPageRoute(
          builder: (_) => NewsArticlePage(),
          settings:
              const RouteSettings(name: NavigationRouteConstant.newsArticle));
    case NavigationRouteConstant.counter:
      return MaterialPageRoute(
          builder: (_) => CounterApp(),
          settings: const RouteSettings(name: NavigationRouteConstant.counter));
    default:
      throw ('this route name does not exist');
  }
}
