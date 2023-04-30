import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_and_stay/modules/login/login_page.dart';
import 'package:search_and_stay/modules/rules/bloc/bloc_add_rule/add_rule_bloc.dart';
import 'package:search_and_stay/modules/rules/bloc/bloc_delete_rule/delete_rule_bloc.dart';
import 'package:search_and_stay/modules/rules/bloc/bloc_get_a_rule/get_a_rule_bloc.dart';
import 'package:search_and_stay/modules/rules/bloc/bloc_get_rule_list/get_rule_list_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => GetRuleListBloc(),
      ),
      BlocProvider(
        create: (context) => AddRuleBloc(),
      ),
      BlocProvider(
        create: (context) => DeleteRuleBloc(),
      ),
      BlocProvider(
        create: (context) => GetARuleBloc(),
      ),
    ],
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
