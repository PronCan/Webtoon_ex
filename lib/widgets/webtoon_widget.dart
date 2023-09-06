import 'package:flutter/material.dart';
import 'package:webtoon_ex/screens/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;

  const Webtoon({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // 제스처 감지
      onTap: () {
        // print('object');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DetailScreen(title: title, thumb: thumb, id: id),
            // card형태와 스크린 구분 가능
            // false -> 가로에서 이미지 나옴 / true -> 아래에서 위로 이미지 나옴
            // + 이미지 설정가능!
            fullscreenDialog: true,
          ),
        );
      },
      child: Column(
        children: [
          // cors 403 error
          Container(
            width: 250,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  blurRadius: 15,
                  offset: const Offset(10, 10),
                  color: Colors.black.withOpacity(0.5),
                ),
              ],
            ),
            child: Image.network(
              thumb,
              headers: const {'Referer': 'https://comic.naver.com'},
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}
