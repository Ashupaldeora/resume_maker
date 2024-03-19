import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_maker/utils/formField.dart';

import '../utils/fontstyle.dart';
import '../utils/variables.dart';
import '../utils/widgets.dart';

class reference extends StatefulWidget {
  const reference({super.key});

  @override
  State<reference> createState() => _referenceState();
}

class _referenceState extends State<reference> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: (isReferenceAdded)
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
                                "REFERENCE NAME",
                                style: fontsize15(),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 55,
                                child: fullField(
                                    referenceControllerHandlerList[
                                        referenceCount]['referenceName'],
                                    TextInputType.text),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "REFERENCE DESIGNATION",
                                style: fontsize15(),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 55,
                                child: fullField(
                                    referenceControllerHandlerList[
                                        referenceCount]['referenceDesignation'],
                                    TextInputType.text),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "REFERENCE EMAIL ID",
                                style: fontsize15(),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 55,
                                child: fullField(
                                    referenceControllerHandlerList[
                                        referenceCount]['referenceEmail'],
                                    TextInputType.emailAddress),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "REFERENCE PHONE",
                                style: fontsize15(),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 55,
                                child: fullField(
                                    referenceControllerHandlerList[
                                        referenceCount]['referencePhone'],
                                    TextInputType.phone),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "DETAILS (OPTIONAL)",
                                style: fontsize15(),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 110,
                                child: moreLineFullField(
                                    referenceControllerHandlerList[
                                        referenceCount]['referenceDetails'],
                                    TextInputType.text),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CupertinoButton(
                                    child: cancelButton(),
                                    onPressed: () {
                                      setState(() {
                                        isReferenceAdded = true;
                                      });
                                    },
                                  ),
                                  CupertinoButton(
                                    child: addButton("Save"),
                                    onPressed: () {
                                      setState(() {
                                        isReferenceAdded = true;
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
              referenceControllerHandlerList.length,
              (index) => Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                    decoration: dataContainerShadow(),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 4.0),
                                    child: Text(
                                      overflow: TextOverflow.fade,
                                      "${referenceControllerHandlerList[index]['referenceName'].text}",
                                      style: dynamicFontSize(
                                          16, Colors.black, FontWeight.w600),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 4.0),
                                  child: SizedBox(
                                    width: double.maxFinite,
                                    child: Text(
                                      "${referenceControllerHandlerList[index]['referenceDesignation'].text}",
                                      style: dynamicFontSize(
                                          14,
                                          Colors.grey.shade600,
                                          FontWeight.w500),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 4.0),
                                  child: SizedBox(
                                    width: double.maxFinite,
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.mail,
                                          size: 20,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          // "${skillsControllerHandlerList![index]['startYear']!.text} to ${skillsControllerHandlerList![index]['endYear']!.text}",
                                          "${referenceControllerHandlerList[index]['referenceEmail'].text}",

                                          style: fontsize15(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 4.0),
                                  child: SizedBox(
                                    width: double.maxFinite,
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.phone,
                                          size: 20,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          // "${skillsControllerHandlerList![index]['startYear']!.text} to ${skillsControllerHandlerList![index]['endYear']!.text}",
                                          "${referenceControllerHandlerList[index]['referencePhone'].text}",

                                          style: fontsize15(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: double.maxFinite,
                                  child: Text(
                                    // "${skillsControllerHandlerList![index]['startYear']!.text} to ${skillsControllerHandlerList![index]['endYear']!.text}",
                                    "${referenceControllerHandlerList[index]['referenceDetails'].text}",

                                    style: fontsize15(),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    referenceControllerHandlerList
                                        .removeAt(index);
                                  });
                                  setState(() {
                                    referenceCount =
                                        referenceControllerHandlerList.length -
                                            2;
                                  });
                                },
                                child: deleteButton(),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isReferenceAdded = false;
                                    referenceCount = index;
                                  });
                                },
                                child: editButton(),
                              )
                            ],
                          ),
                        ]),
                  )),
          (isReferenceAdded)
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ((isReferenceAdded))
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
                              TextEditingController diffReferenceName =
                                  TextEditingController();
                              TextEditingController diffReferenceDesignation =
                                  TextEditingController();
                              TextEditingController diffReferenceEmail =
                                  TextEditingController();
                              TextEditingController diffReferencePhone =
                                  TextEditingController();
                              TextEditingController diffReferenceDetails =
                                  TextEditingController();

                              Map referenceMap = {
                                'referenceName': diffReferenceName,
                                'referenceDesignation':
                                    diffReferenceDesignation,
                                'referenceEmail': diffReferenceEmail,
                                'referencePhone': diffReferencePhone,
                                'referenceDetails': diffReferenceDetails,
                              };

                              referenceControllerHandlerList.add(referenceMap);
                              isReferenceAdded = false;
                              //when added counts size become lists length, to fill value on latest index
                              referenceCount =
                                  referenceControllerHandlerList.length - 1;
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
