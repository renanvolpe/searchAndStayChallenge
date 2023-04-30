import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_and_stay/core/colors_app.dart';
import 'package:search_and_stay/core/resumed_sized_box.dart';
import 'package:search_and_stay/modules/rules/bloc_add_rule.dart/add_rule_bloc.dart';
import 'package:search_and_stay/modules/rules/bloc_get_rule_list/get_rule_list_bloc.dart';
import 'package:search_and_stay/modules/rules/components/add_rule_dialog.dart';
import 'package:search_and_stay/modules/rules/components/rule_component.dart';

class HomeRules extends StatefulWidget {
  const HomeRules({Key? key}) : super(key: key);

  @override
  State<HomeRules> createState() => _HomeRulesState();
}

class _HomeRulesState extends State<HomeRules> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetRuleListBloc>(context).add(GetRuleListStart());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Challange Search and Stay",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: ColorsApp.mainColor,
              borderRadius: BorderRadius.circular(10)),
          child: IconButton(
            icon: const Icon(
              Icons.chevron_left,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        actions: [const FlutterLogo(), 15.sizeW],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsApp.mainColor,
        onPressed: () async =>
            addRuleDialog(context), // call the dialog to add a rule here
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: BlocListener<AddRuleBloc, AddRuleState>(
            listener: (context, stateAddRule) {
              if (stateAddRule is AddRuleFailure) {
                Flushbar(
                  title: "Error",
                  message: stateAddRule.errorMessage,
                  duration: const Duration(seconds: 3),
                  backgroundColor: Colors.red,
                ).show(context);
              }
              if (stateAddRule is AddRuleSucces) {
                BlocProvider.of<GetRuleListBloc>(context)
                    .add(GetRuleListStart());
                Flushbar(
                  title: "Succes :)",
                  message: stateAddRule.successMessage,
                  duration: const Duration(seconds: 3),
                  backgroundColor: Colors.green,
                ).show(context);
              }
            },
            child: BlocBuilder<GetRuleListBloc, GetRuleListState>(
              //TODO MAKE PAGINATION HERE
              builder: (context, ruleListState) {
                if (ruleListState is GetRuleListFailure) {
                  return const Center(
                    child: Text("Ocorreu um erro na requisição"),
                  );
                }
                if (ruleListState is GetRuleListProgress) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (ruleListState is GetRuleListSuccess) {
                  return Column(
                    children: [
                      Text(
                        "Rules above",
                        style: TextStyle(color: ColorsApp.dark, fontSize: 16),
                      ),
                      15.sizeH,
                      for (int i = 0; i < ruleListState.listRules.length; i++)
                        Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: RuleComponent(
                                homeRule: ruleListState.listRules[i]))
                    ],
                  );
                }
                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }
}
