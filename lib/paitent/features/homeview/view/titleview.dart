import 'package:flutter/material.dart';
import 'package:mindwell/paitent/features/homeview/model/illness_model.dart';
import 'package:mindwell/shared_features/appbar/appbar.dart';
import 'package:mindwell/shared_utils/components/app_local.dart';

import '../widgets/expansion.dart';
class IllnessDescribtion extends StatelessWidget {
  const IllnessDescribtion({Key? key, required this.illnessModel}) : super(key: key);
  final IllnessModel illnessModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(getLang(context, 'Illness Description')),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/White Green Minimalist Quotes Instagram Story (1).png"),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              expansion(getLang(context, 'About'), illnessModel.identification!),
              expansion(getLang(context, 'Reasons'), illnessModel.reasons!),
              expansion(getLang(context, 'Symptoms'), illnessModel.symptoms!),
              expansion(getLang(context, 'Treatment'), illnessModel.treatment!),
              expansion(getLang(context, 'When to see a doctor'), illnessModel.whentoseedoctor!),
            ],
          ),
        ),
      ),
    );
  }}