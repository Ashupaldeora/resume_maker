import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_maker/utils/fontstyle.dart';
import 'package:resume_maker/utils/formField.dart';
import 'package:resume_maker/utils/functions.dart';
import 'package:resume_maker/utils/widgets.dart';

import '../utils/variables.dart';

class project extends StatefulWidget {
  const project({super.key});

  @override
  State<project> createState() => _projectState();
}

GlobalKey<FormState> projectKey = GlobalKey<FormState>();

class _projectState extends State<project> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: projectKey,
      child: (isProjectAdded)
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
                          "PROJECT TITLE",
                          style: fontsize15(),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 55,
                          child: fullField(
                              projectControllerHandlerList[projectCount]
                                  ['projectTitle'],
                              TextInputType.text),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "DESCRIPTION",
                          style: fontsize15(),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 150,
                          child: moreLineFullField(
                              projectControllerHandlerList[projectCount]
                                  ['projectDescription'],
                              TextInputType.text),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "PROJECT LINK (OPTIONAL)",
                          style: fontsize15(),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 55,
                          child: timePass(
                              TextInputType.url,
                              projectControllerHandlerList[projectCount]
                                  ['projectLink'],
                              2),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CupertinoButton(
                              onPressed: () {
                                setState(() {
                                  isProjectAdded = true;
                                });
                              },
                              child: cancelButton(),
                            ),
                            CupertinoButton(
                              onPressed: () {
                                setState(() {
                                  // skillListConvertor();
                                  if (projectKey.currentState!.validate()) {
                                    projectListConvertor();
                                    isError = false;
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackbar());
                                    isProjectAdded = true;
                                  }
                                });
                              },
                              child: addButton("Save"),
                            )
                          ],
                        )
                      ],
                    ),
                  )
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
              projectControllerHandlerList.length,
              (index) => Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                    decoration: dataContainerShadow(),
                    child: textRowContainers(index),
                  )),
          (isProjectAdded) ? addYourProjectShow() : const SizedBox(),
        ],
      ),
    );
  }

  Column addYourProjectShow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ((isProjectAdded))
            ? Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Add your Project",
                      style: fontsize25(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "You can add multiple Project",
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
                  TextEditingController diffProjectTitle =
                      TextEditingController();
                  TextEditingController diffProjectDescription =
                      TextEditingController();
                  TextEditingController diffProjectLink =
                      TextEditingController();

                  Map projectMap = {
                    'projectTitle': diffProjectTitle,
                    'projectDescription': diffProjectDescription,
                    'projectLink': diffProjectLink,
                  };

                  projectControllerHandlerList.add(projectMap);
                  isProjectAdded = false;
                  //when added ,counts size become lists length, to fill value on latest index
                  projectCount = projectControllerHandlerList.length - 1;
                });
              },
              child: addButton("add"),
            ),
          ],
        ),
      ],
    );
  }

  Widget textRowContainers(int index) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: SizedBox(
                  width: double.maxFinite,
                  child: Text(
                    overflow: TextOverflow.fade,
                    "${projectControllerHandlerList[index]['projectTitle'].text}",
                    style: dynamicFontSize(16, Colors.black, FontWeight.w600),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  overflow: TextOverflow.fade,
                  "${projectControllerHandlerList[index]['projectDescription'].text}",
                  style: dynamicFontSize(
                      14, Colors.grey.shade600, FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Text(
                  overflow: TextOverflow.fade,
                  // "${skillsControllerHandlerList![index]['startYear']!.text} to ${skillsControllerHandlerList![index]['endYear']!.text}",
                  "${projectControllerHandlerList[index]['projectLink'].text}",

                  style: dynamicFontSize(
                      14, Colors.grey.shade700, FontWeight.w500),
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
                    projectControllerHandlerList.removeAt(index);
                  });
                  setState(() {
                    projectCount = projectControllerHandlerList.length - 2;
                    projectListConvertor();
                  });
                },
                child: deleteButton(),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isProjectAdded = false;
                    projectCount = index;
                  });
                },
                child: editButton(),
              ),
            ],
          )
        ]);
  }
}
