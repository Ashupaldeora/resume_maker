import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_maker/utils/fontstyle.dart';
import 'package:resume_maker/utils/formField.dart';
import 'package:resume_maker/utils/functions.dart';

import '../utils/variables.dart';
import '../utils/widgets.dart';

class certification extends StatefulWidget {
  const certification({super.key});

  @override
  State<certification> createState() => _certificationState();
}

GlobalKey<FormState> certificationKey = GlobalKey<FormState>();

class _certificationState extends State<certification> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: certificationKey,
      child: (isCertificationAdded)
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
                                "CERTIFICATION NAME",
                                style: fontsize15(),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 55,
                                child: fullField(
                                    certificationControllerHandlerList[
                                            certificationCount]
                                        ['certificationName'],
                                    TextInputType.text),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "ISSUING ORGANIZATION",
                                style: fontsize15(),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 55,
                                child: fullField(
                                    certificationControllerHandlerList[
                                        certificationCount]['issuing'],
                                    TextInputType.text),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "ISSUED DATE",
                                style: fontsize15(),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 55,
                                child: fullField(
                                    certificationControllerHandlerList[
                                        certificationCount]['issuedDate'],
                                    TextInputType.datetime),
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
                                      onPressed: () {
                                        setState(() {
                                          // skillListConvertor();
                                          if (certificationKey.currentState!
                                              .validate()) {
                                            certificationListConvertor();
                                            isError = false;
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackbar());
                                            isCertificationAdded = true;
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
              certificationControllerHandlerList.length,
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
                                    "${certificationControllerHandlerList[index]['certificationName'].text}",
                                    style: dynamicFontSize(
                                        16, Colors.black, FontWeight.w600),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 150,
                                  child: Text(
                                    "${certificationControllerHandlerList[index]['issuing'].text}",
                                    style: dynamicFontSize(14,
                                        Colors.grey.shade600, FontWeight.w500),
                                  ),
                                ),
                                Text(
                                  // "${skillsControllerHandlerList![index]['startYear']!.text} to ${skillsControllerHandlerList![index]['endYear']!.text}",
                                  "${certificationControllerHandlerList[index]['issuedDate'].text}",

                                  style: fontsize15(),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    certificationControllerHandlerList
                                        .removeAt(index);
                                  });
                                  setState(() {
                                    certificationCount =
                                        certificationControllerHandlerList
                                                .length -
                                            2;
                                    certificationListConvertor();
                                  });
                                },
                                child: deleteButton(),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isCertificationAdded = false;
                                    certificationCount = index;
                                  });
                                },
                                child: editButton(),
                              )
                            ],
                          ),
                        ]),
                  )),
          (isCertificationAdded)
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ((isCertificationAdded))
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
                              TextEditingController diffCertificationName =
                                  TextEditingController();
                              TextEditingController diffIssuingOrganization =
                                  TextEditingController();
                              TextEditingController diffIssuedDate =
                                  TextEditingController();

                              Map certificationMap = {
                                'certificationName': diffCertificationName,
                                'issuing': diffIssuingOrganization,
                                'issuedDate': diffIssuedDate,
                              };

                              certificationControllerHandlerList
                                  .add(certificationMap);
                              isCertificationAdded = false;
                              //when added counts size become lists length, to fill value on latest index
                              certificationCount =
                                  certificationControllerHandlerList.length - 1;
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
