import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_maker/utils/fontstyle.dart';
import 'package:resume_maker/utils/formField.dart';
import 'package:resume_maker/utils/variables.dart';
import 'package:resume_maker/utils/widgets.dart';

class experience extends StatefulWidget {
  const experience({super.key});

  @override
  State<experience> createState() => _experienceState();
}

DateTime dateTime = DateTime.now();

class _experienceState extends State<experience> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: (isExperienceAdded)
          ? buildSingleChildScrollView(dateTime)
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
                          "JOB TITLE",
                          style: fontsize15(),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 55,
                          child: fullField(
                              experienceControllerHandlerList[experienceCount]
                                  ['jobTitle'],
                              TextInputType.text),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "COMPANY NAME",
                          style: fontsize15(),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 55,
                          child: fullField(
                              experienceControllerHandlerList[experienceCount]
                                  ['companyName'],
                              TextInputType.text),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "WORKING PERIOD",
                              style: fontsize15(),
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  side: BorderSide(
                                      color: Colors.grey.shade600, width: 2),
                                  activeColor: const Color(0xffFF6F6E),
                                  value: presentlyWorking,
                                  onChanged: (value) {
                                    setState(() {
                                      presentlyWorking = value!;
                                    });
                                  },
                                ),
                                Text(
                                  "Presently Working",
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
                                Container(
                                  height: 55,
                                  width: 165,
                                  child: fullField(
                                      experienceControllerHandlerList[
                                          experienceCount]['expStartYear'],
                                      TextInputType.datetime),
                                ),
                              ],
                            ),
                            (!presentlyWorking)
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
                                            experienceControllerHandlerList[
                                                experienceCount]['expEndYear'],
                                            TextInputType.datetime),
                                      ),
                                    ],
                                  )
                                : const SizedBox(),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "DETAILS",
                          style: fontsize15(),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 150,
                          child: moreLineFullField(
                              experienceControllerHandlerList[experienceCount]
                                  ['expDetails'],
                              TextInputType.text),
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
                                  isExperienceAdded = true;
                                });
                              },
                              child: cancelButton(),
                            ),
                            CupertinoButton(
                              onPressed: () {
                                setState(() {
                                  // skillListConvertor();
                                  isExperienceAdded = true;
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

  SingleChildScrollView buildSingleChildScrollView(DateTime date) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...List.generate(
              experienceControllerHandlerList.length,
              (index) => Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                    decoration: dataContainerShadow(),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: double.maxFinite,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 4.0),
                                  child: Text(
                                    overflow: TextOverflow.fade,
                                    "${experienceControllerHandlerList[index]['jobTitle'].text} at ${experienceControllerHandlerList[index]['companyName'].text}",
                                    style: dynamicFontSize(
                                        16, Colors.black, FontWeight.w600),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 4.0),
                                child: Text(
                                  "${experienceControllerHandlerList[index]['expDetails'].text}",
                                  style: dynamicFontSize(
                                      14, Colors.grey, FontWeight.w500),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Text(
                                  // "${skillsControllerHandlerList![index]['startYear']!.text} to ${skillsControllerHandlerList![index]['endYear']!.text}",
                                  "${experienceControllerHandlerList[index]['expStartYear'].text} to ${(!presentlyWorking) ? experienceControllerHandlerList[index]['expEndYear'].text : date.year}",

                                  style: GoogleFonts.lato(
                                      color: Colors.grey.shade700,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      fontStyle: FontStyle.italic),
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
                                    experienceControllerHandlerList
                                        .removeAt(index);
                                  });
                                  setState(() {
                                    count =
                                        experienceControllerHandlerList.length -
                                            2;
                                  });
                                },
                                child: deleteButton(),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isExperienceAdded = false;
                                    experienceCount = index;
                                  });
                                },
                                child: editButton(),
                              ),
                            ],
                          )
                        ]),
                  )),
          (isExperienceAdded)
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ((isExperienceAdded))
                        ? Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Add your Experience",
                                  style: fontsize25(),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "You can add multiple experience",
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
                              TextEditingController diffTitle =
                                  TextEditingController();
                              TextEditingController diffCompanyName =
                                  TextEditingController();
                              TextEditingController diffExpStart =
                                  TextEditingController();
                              TextEditingController diffExpEnd =
                                  TextEditingController();
                              TextEditingController diffExpDetails =
                                  TextEditingController();
                              Map experienceMap = {
                                'jobTitle': diffTitle,
                                'companyName': diffCompanyName,
                                'expStartYear': diffExpStart,
                                'expEndYear': diffExpEnd,
                                'expDetails': diffExpDetails,
                              };

                              experienceControllerHandlerList
                                  .add(experienceMap);
                              isExperienceAdded = false;
                              //when added counts size become lists length, to fill value on latest index
                              experienceCount =
                                  experienceControllerHandlerList.length - 1;
                            });
                          },
                          child: addButton("Add"),
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
