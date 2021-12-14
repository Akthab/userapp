import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:userapp/error/error_response_model.dart';
import 'package:userapp/error/failures.dart';
// import 'package:userapp/model/request/login_request_model.dart';
// import 'package:userapp/models/login_response_model.dart';
import 'package:userapp/models/news_response.dart';
import 'package:userapp/services/news_api.dart';
// import '../../../common_success_response_model.dart';
// import 'package:userapp/error/error_response_model.dart';

part 'news_event.dart';

part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  List<String> list = <String>[];
  final NewsApiServices? _newsApiServices;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  NewsBloc({NewsApiServices? newsApiServices})
      : _newsApiServices = newsApiServices,
        super(InitialNewsState());

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if (event is GetNewsEvent) {
      yield const GetNewsLoading();

      final failureOrSuccess = await _newsApiServices?.fetchNewsArticle();
      // print('failureOrSuccess');

      yield* _eitherFailureOrErrorState(failureOrSuccess!);
    }
  }

  Stream<NewsState> _eitherFailureOrErrorState(
      Either<Failure, List<Article>> failOrSuccess) async* {
    final obj = failOrSuccess.fold((failure) => failure, (user) {
      return user;
    });

    if (obj is Failure) {
      yield GetNewsError(
          errorResponseModel: _mapFailureToErrorResponseModel(obj));
    } else {
      yield GetNewSuccess(newsResponse: obj as NewsResponse);
    }
  }

  ErrorResponseModel _mapFailureToErrorResponseModel(Failure failure) {
    switch (failure.runtimeType) {
      case ConnectionFailure:
        return ErrorResponseModel(message: 'No Internet ');
      case ServerFailure:
        final serverFailure = failure as ServerFailure;
        return serverFailure.errorResponseModel;
      default:
        return ErrorResponseModel(message: 'Something Went Wrong');
    }
  }
}
