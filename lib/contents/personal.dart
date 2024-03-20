import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resume_maker/contents/Education.dart';
import 'package:resume_maker/utils/fontstyle.dart';
import 'package:resume_maker/utils/formField.dart';
import 'package:resume_maker/utils/functions.dart';
import 'package:resume_maker/utils/variables.dart';
import 'package:resume_maker/utils/widgets.dart';

import '../view/screens/resumescreen.dart';

class personal extends StatefulWidget {
  const personal({super.key});

  @override
  State<personal> createState() => _personalState();
}

ResumeController resumeController = ResumeController();
GlobalKey<FormState> personalDetailsKey = GlobalKey<FormState>();

class _personalState extends State<personal> {
  @override
  Widget build(BuildContext context) {
    resumeController.txtFirstName = TextEditingController();
    resumeController.txtLastName = TextEditingController();
    resumeController.txtEmail = TextEditingController();
    resumeController.txtPhone = TextEditingController();
    resumeController.txtAddress = TextEditingController();
    return Form(
      key: personalDetailsKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "PHOTO (OPTIONAL)",
                        style: fontsize15(),
                      ),
                      CupertinoButton(
                          onPressed: () {
                            // selectImage();
                            setState(() {
                              selectImage();
                            });
                          },
                          child: Stack(
                            children: [
                              SizedBox(
                                height: 120,
                                width: 200,
                                child: (imgpath == null)
                                    ? Image.asset(
                                        'assets/images/upload-removebg-preview.png')
                                    : CircleAvatar(
                                        backgroundImage: FileImage(imgpath!),
                                      ),
                              ),
                              (imgpath != null)
                                  ? Positioned(
                                      top: 70,
                                      left: 140,
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            imgpath = null;
                                          });
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 3,
                                                  color: Colors.white),
                                              gradient:
                                                  const LinearGradient(colors: [
                                                Color(0xffFF6F6E),
                                                Color(0xffFFAF70),
                                              ]),
                                              shape: BoxShape.circle),
                                          child: const Icon(Icons.remove),
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                            ],
                          )),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "FIRST NAME*",
                        style: fontsize15(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 55,
                        width: 170,
                        child: fullField(
                            resumeController.txtFirstName, TextInputType.text),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "LAST NAME*",
                        style: fontsize15(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 55,
                        width: 170,
                        child: fullField(
                            resumeController.txtLastName, TextInputType.text),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "EMAIL ID*",
                style: fontsize15(),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 55,
                child: fullField(
                    resumeController.txtEmail, TextInputType.emailAddress),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "PHONE*",
                style: fontsize15(),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 55,
                child:
                    fullField(resumeController.txtPhone, TextInputType.phone),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "ADDRESS*",
                style: fontsize15(),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 80,
                child: moreLineFullField(
                  resumeController.txtAddress,
                  TextInputType.streetAddress,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CupertinoButton(
                    child: addButton("Save"),
                    onPressed: () {
                      setState(() {
                        if (personalDetailsKey.currentState!.validate()) {
                          resumeVariables.firstName =
                              resumeController.txtFirstName.text;
                          resumeVariables.lastName =
                              resumeController.txtLastName.text;
                          resumeVariables.email =
                              resumeController.txtEmail.text;
                          resumeVariables.phone =
                              resumeController.txtPhone.text;
                          resumeVariables.address =
                              resumeController.txtAddress.text;
                          isError = false;
                          pdfGeneratorCount++;
                          print(pdfGeneratorCount);
                          ScaffoldMessenger.of(context)
                              .showSnackBar(snackbar());
                        } else {
                          setState(() {
                            isError = true;
                          });
                        }
                      });
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> selectImage() async {
    XFile? image = await pickimage.pickImage(source: ImageSource.gallery);
    setState(() {
      imgpath = File(image!.path);
    });
  }
}
