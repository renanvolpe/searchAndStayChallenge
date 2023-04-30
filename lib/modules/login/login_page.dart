import 'package:flutter/material.dart';
import 'package:search_and_stay/core/colors_app.dart';
import 'package:search_and_stay/core/resumed_sized_box.dart';
import 'package:search_and_stay/modules/rules/pages/home_rules_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: ColorsApp.mainColor),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                const FlutterLogo(
                  size: 100,
                ),
                25.sizeH,
                const Text(
                  "Name app logo",
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
              ],
            ),
            Column(
              children: [
                TextFormField(
                  //textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 20),
                    hintText: "Username",
                    hintStyle:
                        const TextStyle(color: Colors.white, fontSize: 16),
                    filled: true,
                    fillColor: ColorsApp.mainColor,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                20.sizeH,
                TextFormField(
                  //textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 20),
                    hintText: "Password",
                    hintStyle:
                        const TextStyle(color: Colors.white, fontSize: 16),
                    filled: true,
                    fillColor: ColorsApp.mainColor,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                100.sizeH,
                Material(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.black,
                  child: InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const HomeRulesPage(),
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: const Text(
                        "Login",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Text(
              "Develop by Renan Volpe",
              textAlign: TextAlign.center,
              style: TextStyle(color: ColorsApp.mainColor, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
