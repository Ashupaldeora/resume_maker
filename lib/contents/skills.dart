import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_maker/utils/fontstyle.dart';
import 'package:resume_maker/utils/formField.dart';
import 'package:resume_maker/utils/functions.dart';
import 'package:resume_maker/utils/variables.dart';
import 'package:resume_maker/utils/widgets.dart';

class skills extends StatefulWidget {
  const skills({super.key});

  @override
  State<skills> createState() => _skillsState();
}

GlobalKey<FormState> skillKey = GlobalKey<FormState>();

class _skillsState extends State<skills> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: skillKey,
      child: (isSkillAdded)
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
                                "SKILL*",
                                style: fontsize15(),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 60,
                                child: fullField(
                                    skillsControllerHandlerList[skillCount]
                                        ['skill'],
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
                                    (skillLevel == 0)
                                        ? "Beginner"
                                        : (skillLevel == 1)
                                            ? "Intermediate"
                                            : (skillLevel == 2)
                                                ? "Advanced"
                                                : (skillLevel == 3)
                                                    ? "Expert"
                                                    : "",
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
                                  value: skillLevel,
                                  min: 0,
                                  max: 3,
                                  inactiveColor:
                                      const Color(0xffFF6F6E).withOpacity(0.2),
                                  thumbColor: const Color(0xffFF6F6E),
                                  divisions: 3,
                                  onChanged: (value) {
                                    setState(() {
                                      skillLevel = value;
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
                                        isSkillAdded = true;
                                      });
                                    },
                                  ),
                                  CupertinoButton(
                                      onPressed: () {
                                        setState(() {
                                          if (skillKey.currentState!
                                              .validate()) {
                                            skillsListConvertor();
                                            isError = false;
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackbar());
                                            skillsControllerHandlerList[
                                                    skillCount]['level'] =
                                                (skillLevel == 0)
                                                    ? "Beginner"
                                                    : (skillLevel == 1)
                                                        ? "Intermediate"
                                                        : (skillLevel == 2)
                                                            ? "Advanced"
                                                            : (skillLevel == 3)
                                                                ? "Expert"
                                                                : "";
                                            pdfGeneratorCount++;
                                            isSkillAdded = true;
                                            skillLevel = 0;
                                          }
                                        });
                                      },
                                      child: addButton("Save")),
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
              skillsControllerHandlerList.length,
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
                                    "${skillsControllerHandlerList[index]['skill'].text}",
                                    style: dynamicFontSize(
                                        16, Colors.black, FontWeight.w600),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: Text(
                                  overflow: TextOverflow.fade,
                                  "${skillsControllerHandlerList[index]['level']}",
                                  style: dynamicFontSize(16,
                                      Colors.grey.shade700, FontWeight.w500),
                                ),
                              ),
                              //show level progress indicator
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: LinearProgressIndicator(
                                  value: (skillsControllerHandlerList[index]
                                              ['level'] ==
                                          "Beginner")
                                      ? 0.25
                                      : (skillsControllerHandlerList[index]
                                                  ['level'] ==
                                              "Intermediate")
                                          ? 0.5
                                          : (skillsControllerHandlerList[index]
                                                      ['level'] ==
                                                  "Advanced")
                                              ? 0.75
                                              : (skillsControllerHandlerList[
                                                          index]['level'] ==
                                                      "Expert")
                                                  ? 1
                                                  : null,
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
                                    skillsControllerHandlerList.removeAt(index);
                                  });
                                  setState(() {
                                    skillCount =
                                        skillsControllerHandlerList.length - 2;
                                    // skillsListConvertor();
                                  });
                                },
                                child: deleteButton(),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isSkillAdded = false;
                                    skillCount = index;
                                    if (skillsControllerHandlerList[index]
                                            ['level'] ==
                                        "Beginner") {
                                      skillLevel = 0;
                                    } else if (skillsControllerHandlerList[
                                            index]['level'] ==
                                        "Intermediate") {
                                      skillLevel = 1;
                                    } else if (skillsControllerHandlerList[
                                            index]['level'] ==
                                        "Advanced") {
                                      skillLevel = 2;
                                    } else if (skillsControllerHandlerList[
                                            index]['level'] ==
                                        "Expert") {
                                      skillLevel = 3;
                                    }
                                  });
                                },
                                child: editButton(),
                              ),
                            ],
                          )
                        ]),
                  )),
          (isSkillAdded)
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ((isSkillAdded))
                        ? Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Add your Skill",
                                  style: fontsize25(),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "You can add multiple Skills",
                                  style: fontsize15(),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "NOTE*: ONLY 4 SKILLS WILL BE SHOWN IN RESUME ",
                                  style: dynamicFontSize(
                                      10, Colors.black, FontWeight.w600),
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
                              TextEditingController diffSkill =
                                  TextEditingController();

                              //when added counts size become lists length, to fill value on latest index

                              Map skillMap = {
                                'skill': diffSkill,
                                'level': "Beginner",
                              };

                              skillsControllerHandlerList.add(skillMap);

                              skillCount =
                                  skillsControllerHandlerList.length - 1;
                              isSkillAdded = false;
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
