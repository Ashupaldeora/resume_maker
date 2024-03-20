import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_maker/utils/formField.dart';
import 'package:resume_maker/utils/functions.dart';

import '../utils/fontstyle.dart';
import '../utils/variables.dart';
import '../utils/widgets.dart';

class language extends StatefulWidget {
  const language({super.key});

  @override
  State<language> createState() => _languageState();
}

GlobalKey<FormState> languageKey = GlobalKey<FormState>();

class _languageState extends State<language> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: languageKey,
      child: (isLanguageAdded)
          ? buildSingleChildScrollView()
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ...List.generate(
                      toShowOneTimeEducation.length,
                      (index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "LANGUAGE*",
                                style: GoogleFonts.lato(
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 55,
                                child: fullField(
                                    languageControllerHandlerList[languageCount]
                                        ['language'],
                                    TextInputType.text),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "LEVEL: ",
                                    style: fontsize15(),
                                  ),
                                  Text(
                                    (languageProficiencyLevel == 0)
                                        ? "Elementary Proficiency"
                                        : (languageProficiencyLevel == 1)
                                            ? "Limited Working Proficiency"
                                            : (languageProficiencyLevel == 2)
                                                ? "Professional Working Proficiency"
                                                : (languageProficiencyLevel ==
                                                        3)
                                                    ? "Full Professional Proficiency"
                                                    : "Native / Bilingual Proficiency",
                                    style: dynamicFontSize(16,
                                        Colors.grey.shade800, FontWeight.w600),
                                  ),
                                ],
                              ),
                              SliderTheme(
                                data: const SliderThemeData(
                                  activeTrackColor: Color(0xffFF6F6E),
                                  activeTickMarkColor: Colors.white,
                                  inactiveTickMarkColor: Color(0xffFF6F6E),
                                  trackHeight: 7,
                                ),
                                child: Slider(
                                  value: languageProficiencyLevel,
                                  min: 0,
                                  max: 4,
                                  inactiveColor:
                                      const Color(0xffFF6F6E).withOpacity(0.2),
                                  thumbColor: const Color(0xffFF6F6E),
                                  divisions: 4,
                                  onChanged: (value) {
                                    setState(() {
                                      languageProficiencyLevel = value;
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CupertinoButton(
                                    child: cancelButton(),
                                    onPressed: () {
                                      setState(() {
                                        isLanguageAdded = true;
                                      });
                                    },
                                  ),
                                  CupertinoButton(
                                    child: addButton("Save"),
                                    onPressed: () {
                                      setState(() {
                                        if (languageKey.currentState!
                                            .validate()) {
                                          languageControllerHandlerList[
                                                  languageCount][
                                              'proficiency'] = (languageProficiencyLevel ==
                                                  0)
                                              ? "Elementary Proficiency"
                                              : (languageProficiencyLevel == 1)
                                                  ? "Limited Working Proficiency"
                                                  : (languageProficiencyLevel ==
                                                          2)
                                                      ? "Professional Working Proficiency"
                                                      : (languageProficiencyLevel ==
                                                              3)
                                                          ? "Full Professional Proficiency"
                                                          : "Native / Bilingual Proficiency";
                                          languageListConvertor();
                                          isError = false;
                                          pdfGeneratorCount++;
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackbar());
                                          isLanguageAdded = true;
                                          languageProficiencyLevel = 0;
                                        }
                                      });
                                    },
                                  )
                                ],
                              )
                            ],
                          ))
                ],
              ),
            ),
    );
  }

  SingleChildScrollView buildSingleChildScrollView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...List.generate(
              languageControllerHandlerList.length,
              (index) => Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                    decoration: dataContainerShadow(),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: SizedBox(
                                  width: double.maxFinite,
                                  child: Text(
                                    overflow: TextOverflow.fade,
                                    "${languageControllerHandlerList[index]['language'].text}",
                                    style: dynamicFontSize(
                                        16, Colors.black, FontWeight.w600),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: Text(
                                  overflow: TextOverflow.fade,
                                  "${languageControllerHandlerList[index]['proficiency']}",
                                  style: dynamicFontSize(16,
                                      Colors.grey.shade700, FontWeight.w500),
                                ),
                              ),
                              //show level progress indicator
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: LinearProgressIndicator(
                                  value: (languageControllerHandlerList[index]
                                              ['proficiency'] ==
                                          "Elementary Proficiency")
                                      ? 0
                                      : (languageControllerHandlerList[index]
                                                  ['proficiency'] ==
                                              "Limited Working Proficiency")
                                          ? 0.25
                                          : (languageControllerHandlerList[
                                                      index]['proficiency'] ==
                                                  "Professional Working Proficiency")
                                              ? 0.5
                                              : (languageControllerHandlerList[
                                                              index]
                                                          ['proficiency'] ==
                                                      "Full Professional Proficiency")
                                                  ? 0.75
                                                  : 1,
                                  valueColor: const AlwaysStoppedAnimation(
                                      Color(0xffFF6F6E)),
                                  borderRadius: BorderRadius.circular(50),
                                  minHeight: 7,
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    languageControllerHandlerList
                                        .removeAt(index);
                                  });
                                  setState(() {
                                    languageCount =
                                        languageControllerHandlerList.length -
                                            2;
                                    languageListConvertor();
                                  });
                                },
                                child: deleteButton(),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isLanguageAdded = false;
                                    languageCount = index;
                                    if (languageControllerHandlerList[index]
                                            ['proficiency'] ==
                                        "Elementary Proficiency") {
                                      languageProficiencyLevel = 0;
                                    } else if (languageControllerHandlerList[
                                            index]['proficiency'] ==
                                        "Limited Working Proficiency") {
                                      languageProficiencyLevel = 1;
                                    } else if (languageControllerHandlerList[
                                            index]['proficiency'] ==
                                        "Professional Working Proficiency") {
                                      languageProficiencyLevel = 2;
                                    } else if (languageControllerHandlerList[
                                            index]['proficiency'] ==
                                        "Full Professional Proficiency") {
                                      languageProficiencyLevel = 3;
                                    } else if (languageControllerHandlerList[
                                            index]['proficiency'] ==
                                        "Native / Bilingual Proficiency") {
                                      languageProficiencyLevel = 4;
                                    }
                                    print(pdfGeneratorCount);
                                  });
                                },
                                child: editButton(),
                              ),
                            ],
                          )
                        ]),
                  )),
          (isLanguageAdded)
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ((isLanguageAdded))
                        ? Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Add your Language",
                                  style: fontsize25(),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "You can add multiple Language",
                                  style: fontsize15(),
                                ),
                              ],
                            ),
                          )
                        : const SizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CupertinoButton(
                          onPressed: () {
                            setState(() {
                              TextEditingController diffLanguage =
                                  TextEditingController();

                              //when added counts size become lists length, to fill value on latest index

                              Map languageMap = {
                                'language': diffLanguage,
                                'proficiency': "Elementary Proficiency",
                              };

                              languageControllerHandlerList.add(languageMap);

                              languageCount =
                                  languageControllerHandlerList.length - 1;
                              isLanguageAdded = false;
                            });
                          },
                          child: addButton("add"),
                        ),
                      ],
                    ),
                  ],
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
