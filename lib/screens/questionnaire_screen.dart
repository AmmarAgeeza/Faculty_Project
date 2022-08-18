import 'package:flutter/material.dart';

import '../shared/components/subject_item.dart';
import '../shared/styles/colors_manager.dart';

class QuestionnaireScreen extends StatelessWidget {
  const QuestionnaireScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 8,left: 8,right: 8,),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Text('Questionnaire',style: Theme.of(context).textTheme.headlineLarge,),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Subject Name(7)',style: Theme.of(context).textTheme.bodyLarge,),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: ColorManager.blueGrey,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: const Center(
                  child: Text('25% CLEANED'),
                ),
              )
                ],
              ),
              const SizedBox(height: 20,),
              Expanded(
                child: ListView.builder(itemBuilder: (context,index){
                  return const SubjectItem();
                },
                itemCount: 10,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
