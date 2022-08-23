import 'package:faculty_project/shared/styles/assets_manager.dart';
import 'package:faculty_project/shared/styles/strings_manager.dart';
import 'package:flutter/material.dart';

import '../shared/styles/colors_manager.dart';
import '../shared/styles/styles_manager.dart';
import '../shared/styles/values_manager.dart';
import '../shared/styles/assets_manager.dart';

class Sign extends StatefulWidget {
  const Sign({Key? key}) : super(key: key);

  @override
  SignState createState() => SignState();
}

class SignState extends State<Sign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.sign,
          softWrap: false,
        ),
        backgroundColor: ColorManager.primary,
        titleTextStyle: getBoldStyle(color: ColorManager.white),
      ),
      body: Container(
        height: 300.0,
        width: 300.0,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageAssets.sign),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p25),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 140.0,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              onFieldSubmitted: (String value) {
                print(value);
              },
              decoration: const InputDecoration(
                labelText: AppStrings.email,
                prefixIcon: Icon(
                  Icons.email,
                ),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              onFieldSubmitted: (String value) {
                print(value);
              },
              decoration: const InputDecoration(
                labelText: AppStrings.password,
                prefixIcon: Icon(
                  Icons.password,
                ),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            Container(
              width: double.infinity,
              color: ColorManager.primary,
              alignment: Alignment.center,
              child: MaterialButton(
                onPressed: () {},
                child: Text(
                  AppStrings.sign,
                  style: getBoldStyle(color: ColorManager.white),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
