part of 'news_bloc.dart';

abstract class NewsEvent {
  const NewsEvent([List props = const <dynamic>[]]);

  @override
  List<Object> get props => props;
}

class GetNewsEvent extends NewsEvent {
  GetNewsEvent() : super([NewsResponse]);
}
