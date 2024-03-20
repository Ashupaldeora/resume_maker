import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_maker/utils/fontstyle.dart';
import 'package:resume_maker/utils/formField.dart';
import 'package:resume_maker/utils/functions.dart';

import '../utils/variables.dart';
import '../utils/widgets.dart';

class interest extends StatefulWidget {
  const interest({super.key});

  @override
  State<interest> createState() => _interestState();
}

GlobalKey<FormState> interestKey = GlobalKey<FormState>();

class _interestState extends State<interest> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: interestKey,
      child: (isInterestAdded)
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
                                "INTEREST / HOBBY",
                                style: fontsize15(),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 55,
                                child: fullField(
                                    interestControllerHandlerList[
                                        interestCount],
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
                                        isInterestAdded = true;
                                      });
                                    },
                                  ),
                                  CupertinoButton(
                                    child: addButton("Save"),
                                    onPressed: () {
                                      setState(() {
                                        if (interestKey.currentState!
                                            .validate()) {
                                          setState(() {
                                            interestListConvertor();
                                            isError = false;
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackbar());
                                            isInterestAdded = true;
                                          });
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
              interestControllerHandlerList.length,
              (index) => Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                    decoration: dataContainerShadow(),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                            children: [
                              SizedBox(
                                width: 100,
                                child: Text(
                                  overflow: TextOverflow.fade,
                                  "${interestControllerHandlerList[index].text}",
                                  style: dynamicFontSize(
                                      20, Colors.black, FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 220,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      interestControllerHandlerList
                                          .removeAt(index);
                                    });
                                    setState(() {
                                      interestCount =
                                          interestControllerHandlerList.length -
                                              2;
                                      interestListConvertor();
                                    });
                                  },
                                  child: deleteButton(),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      isInterestAdded = false;
                                      interestCount = index;
                                    });
                                  },
                                  child: editButton(),
                                )
                              ],
                            ),
                          )
                        ]),
                  )),
          (isInterestAdded)
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ((isInterestAdded))
                        ? Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Add your Interest",
                                  style: fontsize25(),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "You can add multiple Interest",
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
                              TextEditingController diffInterest =
                                  TextEditingController();

                              //when added counts size become lists length, to fill value on latest index

                              interestControllerHandlerList.add(diffInterest);

                              interestCount =
                                  interestControllerHandlerList.length - 1;
                              isInterestAdded = false;
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
