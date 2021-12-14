import 'package:dio/dio.dart';
import 'package:userapp/models/news_response.dart';

abstract class RemoteDataSource {
  Future<List<Article>> getAllArticles();
}
