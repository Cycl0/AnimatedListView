import 'package:flutter/material.dart';
import 'package:list_view_animada/counter/routes/home.dart';
import 'package:list_view_animada/counter/routes/cart.dart';

class RouteGenerator {
  static const String home = '/';
  static const String cart = '/cart';

  RouteGenerator._();
  
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const Home());
      case cart:
        return MaterialPageRoute(builder: (_) => Cart());
      default:
        throw FormatException("Route not found");
    }
  }
}

class RouteException implements Exception {
  final String message;
  const RouteException(this.message);
} 
