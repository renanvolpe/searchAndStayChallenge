import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_and_stay/modules/rules/bloc/bloc_get_a_rule/get_a_rule_bloc.dart';
import 'package:search_and_stay/modules/rules/components/appBar.dart';
import 'package:search_and_stay/modules/rules/components/rule_component.dart';

class ShowRuleInformationPage extends StatefulWidget {
  ShowRuleInformationPage({Key? key, required this.idRule}) : super(key: key);
  int idRule;

  @override
  State<ShowRuleInformationPage> createState() =>
      _ShowRuleInformationPageState();
}

class _ShowRuleInformationPageState extends State<ShowRuleInformationPage> {
  @override
  void initState() {
    BlocProvider.of<GetARuleBloc>(context).add(GetARuleStart(widget.idRule));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarComponent(context),
      body: Center(child: BlocBuilder<GetARuleBloc, GetARuleState>(
        builder: (context, state) {
          if (state is GetARuleProgress) {
            return const CircularProgressIndicator();
          }
          if (state is GetARuleFailure) {
            return Text(state.errorMessage);
          }
          if (state is GetARuleSuccess) {
            return RuleComponent(
              disableMoreInformation: true,
              homeRule: state.homeRule,
            );
          }
          return Container();
        },
      )),
    );
  }
}
