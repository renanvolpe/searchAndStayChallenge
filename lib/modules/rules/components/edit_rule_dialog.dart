import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_and_stay/models/rule.dart';
import 'package:search_and_stay/modules/rules/bloc/bloc_edit_rule/edit_rule_bloc.dart';

Future<void> editRuleDialog(BuildContext context, HomeRule homeRule) {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameRuleController =
      TextEditingController(text: homeRule.name);
  TextEditingController activeRuleController =
      TextEditingController(text: homeRule.active.toString());
  TextEditingController orderRuleController =
      TextEditingController(text: homeRule.order.toString());
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Edit a rule here'),
        content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: nameRuleController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration:
                    const InputDecoration(hintText: "Tap a rule s name"),
              ),
              TextFormField(
                controller: activeRuleController,
                keyboardType: TextInputType.number,
                decoration:
                    const InputDecoration(hintText: "Tap a active rule"),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: orderRuleController,
                decoration:
                    const InputDecoration(hintText: "Tap a order s name"),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Edit a rule'),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                //create object that will be add
                HomeRule newHomeRule = HomeRule(
                    id: homeRule.id,
                    name: nameRuleController.text,
                    active: int.parse(activeRuleController.text),
                    order: int.parse(orderRuleController.text));
                //call service of edit a rule
                BlocProvider.of<EditRuleBloc>(context)
                    .add(EditRuleStart(newHomeRule));
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      );
    },
  );
}
