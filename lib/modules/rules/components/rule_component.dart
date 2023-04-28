import 'package:flutter/material.dart';
import 'package:search_and_stay/core/colors_app.dart';
import 'package:search_and_stay/core/resumed_sized_box.dart';
import 'package:search_and_stay/models/rule.dart';

class RuleComponent extends StatelessWidget {
  RuleComponent({
    required this.homeRule,
    super.key,
  });
  HomeRule homeRule;
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
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
                  10.sizeH,
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
