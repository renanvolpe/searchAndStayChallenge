import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_and_stay/core/colors_app.dart';
import 'package:search_and_stay/core/resumed_sized_box.dart';
import 'package:search_and_stay/modules/rules/bloc/bloc_add_rule/add_rule_bloc.dart';
import 'package:search_and_stay/modules/rules/bloc/bloc_delete_rule/delete_rule_bloc.dart';
import 'package:search_and_stay/modules/rules/bloc/bloc_edit_rule/edit_rule_bloc.dart';
import 'package:search_and_stay/modules/rules/bloc/bloc_get_rule_list/get_rule_list_bloc.dart';
import 'package:search_and_stay/modules/rules/components/add_rule_dialog.dart';
import 'package:search_and_stay/modules/rules/components/appBar.dart';
import 'package:search_and_stay/modules/rules/components/rule_component.dart';

class HomeRulesPage extends StatefulWidget {
  const HomeRulesPage({Key? key}) : super(key: key);

  @override
  State<HomeRulesPage> createState() => _HomeRulesPageState();
}

class _HomeRulesPageState extends State<HomeRulesPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetRuleListBloc>(context).add(GetRuleListStart());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarComponent(context),
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
              child: BlocConsumer<EditRuleBloc, EditRuleState>(
                  listener: (context, editRuleState) {
                if (editRuleState is EditRuleFailure) {
                  Flushbar(
                    title: "Error",
                    message: editRuleState.errorMessage,
                    duration: const Duration(seconds: 3),
                    backgroundColor: Colors.red,
                  ).show(context);
                }
                if (editRuleState is EditRuleSuccess) {
                  BlocProvider.of<GetRuleListBloc>(context)
                      .add(GetRuleListStart());
                  Flushbar(
                    title: "Succes :)",
                    message: editRuleState.successMessage,
                    duration: const Duration(seconds: 3),
                    backgroundColor: Colors.green,
                  ).show(context);
                }
              }, builder: (context, editRuleState) {
                if (editRuleState is EditRuleProgress) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return BlocConsumer<DeleteRuleBloc, DeleteRuleState>(
                  listener: (context, deleteRuleState) {
                    if (deleteRuleState is DeleteRuleFailure) {
                      Flushbar(
                        title: "Error",
                        message: deleteRuleState.erroMessage,
                        duration: const Duration(seconds: 3),
                        backgroundColor: Colors.red,
                      ).show(context);
                    }
                    if (deleteRuleState is DeleteRuleSucces) {
                      BlocProvider.of<GetRuleListBloc>(context)
                          .add(GetRuleListStart());
                      Flushbar(
                        title: "Succes :)",
                        message: deleteRuleState.successMessage,
                        duration: const Duration(seconds: 3),
                        backgroundColor: Colors.green,
                      ).show(context);
                    }
                  },
                  builder: (context, deleteRuleState) {
                    if (deleteRuleState is DeleteRuleProgress) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return BlocBuilder<GetRuleListBloc, GetRuleListState>(
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
                                style: TextStyle(
                                    color: ColorsApp.dark, fontSize: 16),
                              ),
                              15.sizeH,
                              for (int i = 0;
                                  i < ruleListState.listRules.length;
                                  i++)
                                Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: RuleComponent(
                                        disableMoreInformation: false,
                                        homeRule: ruleListState.listRules[i]))
                            ],
                          );
                        }
                        return Container();
                      },
                    );
                  },
                );
              }),
            ),
          ),
        ));
  }
}
