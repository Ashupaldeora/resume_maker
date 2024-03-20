import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_maker/contents/Education.dart';
import 'package:resume_maker/contents/personal.dart';
import 'package:resume_maker/utils/fontstyle.dart';
import 'package:resume_maker/utils/formField.dart';
import 'package:resume_maker/utils/variables.dart';

import '../utils/functions.dart';
import '../utils/widgets.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

GlobalKey<FormState> profileKey = GlobalKey<FormState>();

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: profileKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "DESIGNATION",
              style: fontsize15(),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 55,
              child: fullField(
                  resumeController.txtDesignation, TextInputType.text),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "CAREER OBJECTIVE",
              style: fontsize15(),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                height: 300,
                child: timePass(TextInputType.text,
                    resumeController.txtCareerObjective, 6)),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CupertinoButton(
                  child: addButton("Save"),
                  onPressed: () {
                    if (profileKey.currentState!.validate()) {
                      setState(() {
                        resumeVariables.designation =
                            resumeController.txtDesignation.text;
                        resumeVariables.careerObjective =
                            resumeController.txtCareerObjective.text;
                        isError = false;
                        pdfGeneratorCount++;
                        ScaffoldMessenger.of(context).showSnackBar(snackbar());
                      });
                    } else {
                      setState(() {
                        isError = true;
                      });
                    }
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
