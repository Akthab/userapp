import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:userapp/error/exceptions.dart';
import 'package:userapp/error/failures.dart';
import 'package:userapp/models/news_response.dart';
import 'package:userapp/network/network_info.dart';
import 'package:userapp/sources/remote_data_source.dart';

class NewsApiServices {
  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  NewsApiServices(
      {required this.networkInfo, required this.remoteDataSource}) {}

  // <List<Article>
  Future<Either<Failure, List<Article>>> fetchNewsArticle() async {
    if (await networkInfo.isConnected == ConnectivityResult.none) {
      return Left(ConnectionFailure());
    } else {
      try {
        final response = await remoteDataSource.getAllArticles();
        return Right(response);
      } on ServerException catch (ex) {
        return Left(ServerFailure(ex.errorResponseModel));
      }
      // } on DioError catch (e) {
      //   if (e.response != null) {
      //     print(e.response!.data);
      //   }
      // throw '';
    }
  }
}
