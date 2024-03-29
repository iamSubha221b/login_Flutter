import 'package:login_stateful/news/resources/news_api_provider.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';


void main () {
  test('FetchTopIds returns a list of ids',() async{
    //setup case
    final newsApi = NewsApiProvider();
    MockClient ((request) async{

      return Response(json.encode([1,2,3,4]),200);

    });


    final ids = await newsApi.fetchIds();
    //expect
    expect(ids,[1,2,3,4]);

  });

  test('FetchItem returns item model', () async {
    final newsApi = NewsApiProvider();

    newsApi.client = MockClient((request) async {
      final jsonMap = {'id': 123};
      return Response(json.encode(jsonMap), 200);
    });

    final item = await newsApi.fetchItem(999);

    expect(item.id, 123);
  });
}