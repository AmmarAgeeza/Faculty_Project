import 'package:flutter/material.dart';

import '../styles/colors_manager.dart';

class SubjectItem extends StatelessWidget {
  const SubjectItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 15,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'programming 1',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'click here to go to page',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(width: 160,),
            Container(
              padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: ColorManager.blueGrey,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Icon(Icons.forward))
          ],
        ),
      ),
    );
  }
}
