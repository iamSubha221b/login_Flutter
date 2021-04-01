
import 'dart:async';
import '../resources/news_api_provider.dart';
import '../resources/news_db_provider.dart';
import '../models/item_model.dart';
//import '../resources/abstract.dart';


class Repository{
  NewsApiProvider apiProvider = NewsApiProvider();
  NewsDbProvider dbProvider = NewsDbProvider();

  fetchTopIds(){
    return apiProvider.fetchIds();
  }

  fetchItem(int id) async{

   var item = await dbProvider.fetchItem(id);
   if (item != null)
     {
       return item;
     }
   item = await apiProvider.fetchItem(id);
   dbProvider.addItem(item);
  }
}