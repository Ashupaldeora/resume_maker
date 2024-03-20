import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_maker/contents/Education.dart';
import 'package:resume_maker/contents/personal.dart';
import 'package:resume_maker/utils/fontstyle.dart';
import 'package:resume_maker/utils/formField.dart';
import 'package:resume_maker/utils/variables.dart';
import 'package:resume_maker/utils/widgets.dart';

import '../utils/functions.dart';

class portfolio extends StatefulWidget {
  const portfolio({super.key});

  @override
  State<portfolio> createState() => _portfolioState();
}

GlobalKey<FormState> portfolioKey = GlobalKey<FormState>();

class _portfolioState extends State<portfolio> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: portfolioKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "LINK TYPE*",
              style: fontsize15(),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 55,
              child: fullField(
                  resumeController.txtPortfolioLinkType, TextInputType.text),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "LINK*",
              style: fontsize15(),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 55,
              child: fullField(
                  resumeController.txtPortfolioLink, TextInputType.url),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CupertinoButton(
                  onPressed: () {
                    if (portfolioKey.currentState!.validate()) {
                      setState(() {
                        resumeVariables.portfolioLinkType =
                            resumeController.txtPortfolioLinkType.text;
                        resumeVariables.portfolioLink =
                            resumeController.txtPortfolioLink.text;
                        pdfGeneratorCount++;
                        isError = false;
                        ScaffoldMessenger.of(context).showSnackBar(snackbar());
                      });
                    } else {
                      setState(() {
                        isError = true;
                      });
                    }
                  },
                  child: addButton("Save"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
