import 'package:flutter/material.dart';
import 'package:webtoon_ex/screens/home_screen.dart';
import 'package:webtoon_ex/services/api_service.dart';

// https://webtoon-crawler.nomadcoders.workers.dev/

// /today: Returns today's comics (kids friendly).
// /:id: Returns a comic's information by `:id`
// /:id/episodes: Returns the latest episodes for a comic by `:id`

// 화면2개, 화면이동, API사용, 화면 전환 애니메이션

void main() {
  // ApiService().getTodayToons();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
