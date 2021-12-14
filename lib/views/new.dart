import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/base_view.dart';
import 'package:userapp/bloc/newsbloc/news_bloc.dart';
import 'package:userapp/models/news_response.dart';
import 'package:userapp/services/dependency_injection.dart';
import 'package:userapp/services/news_api.dart';

class NewsArticlePage extends BaseView {
  const NewsArticlePage({Key? key}) : super(key: key);

  @override
  _NewsArticlePageState createState() => _NewsArticlePageState();
}

class _NewsArticlePageState extends BaseViewState<NewsArticlePage> {
  // final NewsBloc _bloc = injection<NewsBloc>();
  final _bloc = NewsBloc();

  @override
  void initState() {
    _bloc.add(GetNewsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Discover",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const Text(
                "Find intresting article and news",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20),
              BlocProvider(
                  create: (BuildContext context) => _bloc,
                  child: BlocConsumer<NewsBloc, NewsState>(
                    listener: (BuildContext context, NewsState state) {
                      if (state is GetNewsLoading) {}
                      // return Container(child: Text('No text here'));
                    },
                    builder: (BuildContext context, NewsState state) {
                      if (state is GetNewSuccess) {}
                      return const CircularProgressIndicator();
                    },
                  ))
              // Expanded(
              //   // child:
              //   child: FutureBuilder<List<Article>>(
              //     future: NewsApiServices().fetchNewsArticle(),
              //     builder: (context, snapshot) {
              //       if (!snapshot.hasData) {
              //         return Center(child: CircularProgressIndicator());
              //       } else {
              //         List<Article>? newsArticle = snapshot.data;
              //         return ListView.builder(
              //           itemCount: newsArticle!.length,
              //           itemBuilder: (context, index) {
              //             return NewsTile(article: newsArticle[index]);
              //           },
              //         );
              //       }
              //     },
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget buildView(BuildContext context, Size size) {
    // TODO: implement buildView
    throw UnimplementedError();
  }
}

class NewsTile extends StatelessWidget {
  final Article article;

  const NewsTile({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      child: ListTile(
        title: Text(
          article.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          article.description,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
        ),
        leading: article.urlToImage != null
            ? Container(
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(article.urlToImage),
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
