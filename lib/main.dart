import 'package:flutter/material.dart';
import 'package:test_aspins/models/user.dart';
import 'package:test_aspins/pages/main_page.dart';
import 'package:test_aspins/provider/api_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final ApiProvider apiProvider =
      ApiProvider('https://api.npoint.io/7fb29e8eda082141a9d5');
  List<User>? users;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final result = await apiProvider.fetchData();
      List<dynamic> items = result['items'];

      setState(() {
        users = items.map((item) {
          return User(
            name: item['name'],
            isPro: item['isPro'],
            price: item['price'],
            avatar: item['avatar'],
          );
        }).toList();
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 152, 139, 235),
                  Color.fromARGB(255, 115, 70, 199),
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
          ),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          title: const Center(child: Text('Лидеры')),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
        body: Center(
          child: users == null
              ? const CircularProgressIndicator(
                  color: Color.fromARGB(255, 116, 68, 198),
                  backgroundColor: Color.fromARGB(255, 236, 234, 251),
                )
              : MainPage(users: users),
        ),
      ),
    );
  }
}
