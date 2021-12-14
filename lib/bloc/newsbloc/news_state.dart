part of 'news_bloc.dart';

abstract class NewsState {
  const NewsState();
}

// Initial Documents State
class InitialNewsState extends NewsState {
  const InitialNewsState();
}

class GetNewsLoading extends NewsState {
  const GetNewsLoading();
}

class GetNewsError extends NewsState {
  final ErrorResponseModel errorResponseModel;

  const GetNewsError({required this.errorResponseModel});

  @override
  List<Object> get props => [errorResponseModel];
}

class GetNewSuccess extends NewsState {
  final NewsResponse newsResponse;

  const GetNewSuccess({required this.newsResponse});

  @override
  List<Object> get props => [newsResponse];
}
