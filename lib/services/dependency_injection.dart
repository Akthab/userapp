import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:userapp/bloc/login/login_block.dart/login_block.dart';
import 'package:userapp/bloc/newsbloc/news_bloc.dart';
import 'package:userapp/services/news_api.dart';

final injection = GetIt.instance;

void setUpLocator() {
  /// Register DIO
  injection.registerSingleton(Dio());

  /// Blocs
  injection.registerFactory<LoginBloc>(() => LoginBloc());
  // injection.registerFactory<NewsBloc>(() => NewsBloc());
  injection.registerFactory(() => NewsBloc(newsApiServices: injection()));

  injection.registerLazySingleton<NewsApiServices>(() =>
      NewsApiServices(networkInfo: injection(), remoteDataSource: injection()));

  // injection.registerFactory<NewsApiServices>(
  //     () => NewsApiServices(networkInfo: injection()));
}
