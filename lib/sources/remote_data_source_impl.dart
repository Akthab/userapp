import 'package:dio/dio.dart';
import 'package:userapp/models/news_response.dart';
import 'remote_data_source.dart';

class RemoteDataSourceImpl extends RemoteDataSource {
  final _dio = Dio();
  final String _url =
      "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=d1e0af515aa147e3a1c5916a380c9dab";

  RemoteDataSourceImpl();

  /// LOGIN
  @override
  Future<List<Article>> getAllArticles() async {
    try {
      final response = await _dio.get(_url);
      NewsResponse newsResponse = NewsResponse.fromJson(response.data);
      return (newsResponse.articles);
    } on Exception {
      rethrow;
    }
  }
}
