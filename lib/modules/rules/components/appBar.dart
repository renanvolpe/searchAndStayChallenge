import 'package:flutter/material.dart';
import 'package:search_and_stay/core/colors_app.dart';
import 'package:search_and_stay/core/resumed_sized_box.dart';

AppBar appBarComponent(context) => AppBar(
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
    );
