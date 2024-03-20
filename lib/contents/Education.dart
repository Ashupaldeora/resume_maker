import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_maker/contents/personal.dart';
import 'package:resume_maker/utils/fontstyle.dart';
import 'package:resume_maker/utils/formField.dart';
import 'package:resume_maker/utils/icons.dart';
import 'package:resume_maker/utils/variables.dart';
import 'package:resume_maker/utils/widgets.dart';
import 'package:resume_maker/view/screens/resumescreen.dart';

import '../utils/functions.dart';

class education extends StatefulWidget {
  const education({super.key});

  @override
  State<education> createState() => _educationState();
}

GlobalKey<FormState> educationKey = GlobalKey<FormState>();

class _educationState extends State<education> {
  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    return Form(
        key: educationKey,
        child: (isAdded)
            ? buildSingleChildScrollView(date)
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: List.generate(
                      toShowOneTimeEducation.length,
                      (index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "COURSE / DEGREE*",
                            style: fontsize15(),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 58,
                            child: fullField(
                                educationControllerHandlerList[count]['course'],
                                TextInputType.text),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "SCHOOL / COLLEGE / UNIVERSITY*",
                            style: fontsize15(),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 58,
                            child: fullField(
                                educationControllerHandlerList[count]['school'],
                                TextInputType.text),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "EDUCATION PERIOD*",
                                style: fontsize15(),
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    side: BorderSide(
                                        color: Colors.grey.shade600, width: 2),
                                    activeColor: const Color(0xffFF6F6E),
                                    value: presentlyStudying,
                                    onChanged: (value) {
                                      setState(() {
                                        presentlyStudying = value!;
                                      });
                                    },
                                  ),
                                  Text(
                                    "Presently Studying",
                                    style: fontsize15(),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "START",
                                    style: fontsize15(),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 55,
                                    width: 165,
                                    child: fullField(
                                        educationControllerHandlerList[count]
                                            ['startYear'],
                                        TextInputType.datetime),
                                  ),
                                ],
                              ),
                              (!presentlyStudying)
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "END",
                                          style: fontsize15(),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          height: 55,
                                          width: 165,
                                          child: fullField(
                                              educationControllerHandlerList[
                                                  count]['endYear'],
                                              TextInputType.datetime),
                                        ),
                                      ],
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CupertinoButton(
                                onPressed: () {
                                  setState(() {
                                    isAdded = true;
                                  });
                                },
                                child: cancelButton(),
                              ),
                              CupertinoButton(
                                onPressed: () {
                                  setState(() {
                                    // skillListConvertor();
                                    if (educationKey.currentState!.validate()) {
                                      setState(() {
                                        educationListConvertor();
                                        isError = false;
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackbar());
                                        pdfGeneratorCount++;
                                        isAdded = true;
                                      });
                                    } else {
                                      setState(() {
                                        isError = true;
                                      });
                                    }
                                  });
                                },
                                child: addButton("save"),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ));
  }

  // data showing container
  SingleChildScrollView buildSingleChildScrollView(DateTime date) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...List.generate(
              educationControllerHandlerList.length,
              (index) => Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                    decoration: dataContainerShadow(),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 200,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 4.0),
                                  child: Text(
                                    overflow: TextOverflow.fade,
                                    "${educationControllerHandlerList[index]['course'].text}",
                                    style: fontsize17(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 200,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 15.0),
                                  child: Text(
                                    "${educationControllerHandlerList[index]['school'].text}",
                                    style: fontsize15(),
                                  ),
                                ),
                              ),
                              SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 15.0),
                                  child: Text(
                                    // "${skillsControllerHandlerList![index]['startYear']!.text} to ${skillsControllerHandlerList![index]['endYear']!.text}",
                                    "${educationControllerHandlerList[index]['startYear'].text} to ${(!presentlyStudying) ? educationControllerHandlerList[index]['endYear'].text : date.year}",

                                    style: fontsize15(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    educationControllerHandlerList
                                        .removeAt(index);
                                  });
                                  setState(() {
                                    count =
                                        educationControllerHandlerList.length -
                                            2;
                                    educationListConvertor();
                                  });
                                },
                                child: deleteButton(),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isAdded = false;
                                    count = index;
                                  });
                                },
                                child: editButton(),
                              )
                            ],
                          ),
                        ]),
                  )),
          (isAdded)
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ((isAdded))
                        ? Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Add your Education",
                                  style: fontsize25(),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "You can add multiple education",
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
                              TextEditingController diffCourse =
                                  TextEditingController();
                              TextEditingController diffSchool =
                                  TextEditingController();
                              TextEditingController diffStart =
                                  TextEditingController();
                              TextEditingController diffEnd =
                                  TextEditingController();
                              Map skillsMap = {
                                'course': diffCourse,
                                'school': diffSchool,
                                'startYear': diffStart,
                                'endYear': diffEnd,
                              };

                              educationControllerHandlerList.add(skillsMap);

                              isAdded = false;
                              //when added counts size become lists length, to fill value on latest index
                              count = educationControllerHandlerList.length - 1;
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

ResumeVariables resumeVariables = ResumeVariables();
