import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_node_api/models/package_model.dart';
import 'package:flutter_node_api/models/post_model.dart';
import 'package:flutter_node_api/pages/login.dart';
import 'package:flutter_node_api/services/http_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final HttpService httpService = HttpService();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        FutureProvider<List<Post>>(
          create: (context) => httpService.getPosts(),
          initialData: [],
        ),
        FutureProvider<List<Packages>>(
          create: (context) => httpService.getPackages(),
          initialData: [],
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (context) => const LoginPage(),
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
