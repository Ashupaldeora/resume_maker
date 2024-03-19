import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_maker/utils/formField.dart';

import '../utils/fontstyle.dart';
import '../utils/variables.dart';
import '../utils/widgets.dart';

class achievement extends StatefulWidget {
  const achievement({super.key});

  @override
  State<achievement> createState() => _achievementState();
}

class _achievementState extends State<achievement> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: (isAchievementAdded)
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
                                "ACHIEVEMENT TITLE",
                                style: fontsize15(),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 55,
                                child: fullField(
                                    achievementControllerHandlerList[
                                        achievementCount]['achievementTitle'],
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
                                    achievementControllerHandlerList[
                                            achievementCount]
                                        ['achievementDescription'],
                                    TextInputType.text),
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
                                        isCertificationAdded = true;
                                      });
                                    },
                                  ),
                                  CupertinoButton(
                                    child: addButton("Save"),
                                    onPressed: () {
                                      setState(() {
                                        isAchievementAdded = true;
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
              achievementControllerHandlerList.length,
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
                              SizedBox(
                                width: double.maxFinite,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 4),
                                  child: Text(
                                    overflow: TextOverflow.fade,
                                    "${achievementControllerHandlerList[index]['achievementTitle'].text}",
                                    style: dynamicFontSize(
                                        16, Colors.black, FontWeight.w600),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: double.maxFinite,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: Text(
                                    overflow: TextOverflow.fade,
                                    "${achievementControllerHandlerList[index]['achievementDescription'].text}",
                                    style: dynamicFontSize(14,
                                        Colors.grey.shade600, FontWeight.w500),
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
                                    achievementControllerHandlerList
                                        .removeAt(index);
                                  });
                                  setState(() {
                                    achievementCount =
                                        achievementControllerHandlerList
                                                .length -
                                            2;
                                  });
                                },
                                child: deleteButton(),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isAchievementAdded = false;
                                    achievementCount = index;
                                  });
                                },
                                child: editButton(),
                              ),
                            ],
                          )
                        ]),
                  )),
          (isAchievementAdded)
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ((isAchievementAdded))
                        ? Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Add your Certification",
                                  style: fontsize25(),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "You can add multiple certification",
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
                              TextEditingController diffAchievementTitle =
                                  TextEditingController();
                              TextEditingController diffAchievementDescription =
                                  TextEditingController();

                              Map achievementMap = {
                                'achievementTitle': diffAchievementTitle,
                                'achievementDescription':
                                    diffAchievementDescription,
                              };

                              achievementControllerHandlerList
                                  .add(achievementMap);
                              isAchievementAdded = false;
                              //when added counts size become lists length, to fill value on latest index
                              achievementCount =
                                  achievementControllerHandlerList.length - 1;
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
