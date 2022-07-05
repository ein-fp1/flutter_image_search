import 'package:flutter/material.dart';
import 'package:flutter_image_search/data/data_source/pixabay_api.dart';
import 'package:flutter_image_search/data/repository/photo_api_repository_impl.dart';
import 'package:flutter_image_search/ui/home_screen.dart';
import 'package:flutter_image_search/ui/home_view_model.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (_) => HomeViewModel(
          PhotoApiRepositoryImpl(
            PixabayApi(http.Client()),
          ),
        ),
        child: const HomeScreen(),
      ),
    );
  }
}
