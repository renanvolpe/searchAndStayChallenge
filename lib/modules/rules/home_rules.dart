import 'package:flutter/material.dart';
import 'package:search_and_stay/core/colors_app.dart';
import 'package:search_and_stay/core/resumed_sized_box.dart';
import 'package:search_and_stay/modules/rules/components/rule_component.dart';

class HomeRules extends StatefulWidget {
  const HomeRules({Key? key}) : super(key: key);

  @override
  State<HomeRules> createState() => _HomeRulesState();
}

class _HomeRulesState extends State<HomeRules> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Text(
              "Rules above",
              style: TextStyle(color: ColorsApp.dark, fontSize: 16),
            ),
            15.sizeH,
            const RuleComponent()
          ],
        ),
      ),
    );
  }
}
