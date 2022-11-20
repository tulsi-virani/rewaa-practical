import 'package:rxdart/rxdart.dart';

import '../Model/news_model.dart';
import '../Repo/repository.dart';

class NewsBloc {
  Repository _repository = Repository();

  final _newsFetcher = PublishSubject<NewsResponse>();

  Stream<NewsResponse> get news => _newsFetcher.stream;

  fetchLondonNews() async {
    NewsResponse newsResponse = await _repository.fetchLondonNews();
    _newsFetcher.sink.add(newsResponse);
  }

  dispose() {
    _newsFetcher.close();
  }
}

final newsBloc = NewsBloc();
