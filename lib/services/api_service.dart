import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webtoon_ex/models/webtoon_detail_model.dart';
import 'package:webtoon_ex/models/webtoon_episode_model.dart';
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

  static Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse('$_url/$id');
    final res = await http.get(url);
    if (res.statusCode == 200) {
      final webtoon = jsonDecode(res.body);
      return WebtoonDetailModel.fromJson(webtoon);
    }
    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getLatestEpisodesById(
      String id) async {
    List<WebtoonEpisodeModel> episodesInstances = [];
    final url = Uri.parse('$_url/$id/episodes');
    final res = await http.get(url);
    if (res.statusCode == 200) {
      final episodes = jsonDecode(res.body);
      for (var epi in episodes) {
        episodesInstances.add(WebtoonEpisodeModel.fromJson(epi));
      }
      return episodesInstances;
    }
    throw Error();
  }
}
