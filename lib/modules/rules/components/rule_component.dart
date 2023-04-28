import 'package:flutter/material.dart';
import 'package:search_and_stay/core/colors_app.dart';
import 'package:search_and_stay/core/resumed_sized_box.dart';

class RuleComponent extends StatelessWidget {
  const RuleComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15, vertical: 15),
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
              margin: const EdgeInsets.symmetric(
                  horizontal: 15, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Rule information:",
                    style:
                        TextStyle(color: ColorsApp.dark, fontSize: 16),
                  ),
                  10.sizeH,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Active -" " 10",
                        style: TextStyle(
                            color: ColorsApp.dark, fontSize: 14),
                      ),
                      Text(
                        "Order -" " 10",
                        style: TextStyle(
                            color: ColorsApp.dark, fontSize: 14),
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