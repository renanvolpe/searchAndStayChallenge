import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_and_stay/core/colors_app.dart';
import 'package:search_and_stay/core/resumed_sized_box.dart';
import 'package:search_and_stay/models/rule.dart';
import 'package:search_and_stay/modules/rules/bloc/bloc_delete_rule/delete_rule_bloc.dart';
import 'package:search_and_stay/modules/rules/pages/show_rule_information_page.dart';

class RuleComponent extends StatelessWidget {
  RuleComponent({
    required this.homeRule,
    required this.disableMoreInformation,
    super.key,
  });
  HomeRule homeRule;
  //this varialbe is to disable "more information" button
  bool disableMoreInformation;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: ColorsApp.mainColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5))),
                child: const Text(
                  "RULE",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Rule information: ${homeRule.name}",
                    style: TextStyle(
                        color: ColorsApp.dark,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  25.sizeH,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Active - ${homeRule.active}",
                        style: TextStyle(color: ColorsApp.dark, fontSize: 14),
                      ),
                      Text(
                        "Order - ${homeRule.order}",
                        style: TextStyle(color: ColorsApp.dark, fontSize: 14),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        child: Icon(
                          Icons.delete,
                          color: ColorsApp.dark,
                          size: 17,
                        ),
                        onTap: () {
                          BlocProvider.of<DeleteRuleBloc>(context)
                              .add(DeleteRuleStart(homeRule.id));
                        },
                      ),
                      10.sizeW,
                      InkWell(
                        child: Icon(
                          Icons.edit,
                          color: ColorsApp.dark,
                          size: 17,
                        ),
                        onTap: () {
                          //TODO edit a rule here
                        },
                      ),
                    ],
                  ),
                  10.sizeH,
                  disableMoreInformation
                      ? Container()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      ShowRuleInformationPage(
                                    idRule: homeRule.id,
                                  ),
                                ),
                              ),
                              child: const Text(
                                "More information here",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                ),
                              ),
                            )
                          ],
                        )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
