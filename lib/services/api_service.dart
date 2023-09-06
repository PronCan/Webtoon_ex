import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webtoon_ex/models/webtoon_model.dart';

class ApiService {
  static const String _url = 'https://webtoon-crawler.nomadcoders.workers.dev';
  static const String today = 'today';

  static Future<List<WebtoonModel>> getTodayToons() async {
    List<WebtoonModel> webtooInstances = [];
    final url = Uri.parse('$_url/$today');
    final res = await http.get(url);
    if (res.statusCode == 200) {
      // print(res.body);
      final List<dynamic> webtoons = jsonDecode(res.body);
      for (var webtoon in webtoons) {
        // print(webtoon);
        webtooInstances.add(WebtoonModel.fromJson(webtoon));
        // print(toon.title);
      }
      return webtooInstances;
    }
    throw Error();
  }
}
