import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_and_stay/modules/login/login_page.dart';
import 'package:search_and_stay/modules/rules/bloc/get_rule_list_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => GetRuleListBloc(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Challenge Stay and Search',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}
