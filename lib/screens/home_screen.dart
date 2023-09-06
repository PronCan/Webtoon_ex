import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:webtoon_ex/models/webtoon_model.dart';
import 'package:webtoon_ex/services/api_service.dart';
import 'package:webtoon_ex/widgets/webtoon_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodayToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //그림자
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: const Text(
          'Today\'s Webtoon',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                dragDevices: {
                  PointerDeviceKind.mouse,
                },
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Expanded(
                    // 무한한 높이 해결하기 위해 Listview가 남는 공간 채움
                    child: makeList(snapshot),
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      // ListView.builder
      // 모든 아이템을 한번에 만드는 대신, 만드는 아이템에 itemBuilder 함수를 실행함
      // index로 접근이 가능
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      itemBuilder: (context, index) {
        var webtoon = snapshot.data![index];
        return Webtoon(
            title: webtoon.title, thumb: webtoon.thumb, id: webtoon.id);
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 40,
      ),
    );
  }
}
