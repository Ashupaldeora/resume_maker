import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resume_maker/utils/variables.dart';

import '../view/screens/resumescreen.dart';

class personal extends StatefulWidget {
  const personal({super.key});

  @override
  State<personal> createState() => _personalState();
}

ResumeController resumeController = ResumeController();
GlobalKey personalDetailsKey = GlobalKey();

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
                    style: GoogleFonts.lato(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
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
                          Container(
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
                                      decoration: const BoxDecoration(
                                          color: Color(0xffFF6F6E),
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
                    "FIRST NAME",
                    style: GoogleFonts.lato(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 55,
                    width: 170,
                    child: TextFormField(
                      controller: resumeController.txtFirstName,
                      onTapOutside: (event) {
                        FocusManager.instance.primaryFocus!.unfocus();
                      },
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400)),
                          focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Color(0xffFF6F6E)))),
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "LAST NAME",
                    style: GoogleFonts.lato(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 55,
                    width: 170,
                    child: TextFormField(
                      controller: resumeController.txtLastName,
                      onTapOutside: (event) {
                        FocusManager.instance.primaryFocus!.unfocus();
                      },
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400)),
                          focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Color(0xffFF6F6E)))),
                    ),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "EMAIL ID",
            style: GoogleFonts.lato(
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
                fontSize: 15),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 55,
            child: TextFormField(
              controller: resumeController.txtEmail,
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus!.unfocus();
              },
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffFF6F6E)))),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "PHONE",
            style: GoogleFonts.lato(
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
                fontSize: 15),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 55,
            child: TextFormField(
              controller: resumeController.txtPhone,
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus!.unfocus();
              },
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                  prefixText: "+91",
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffFF6F6E)))),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "ADDRESS",
            style: GoogleFonts.lato(
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
                fontSize: 15),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 80,
            child: TextFormField(
              controller: resumeController.txtAddress,
              maxLines: null,
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus!.unfocus();
              },
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400)),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffFF6F6E))),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 50,
                width: 120,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(50),
                    gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xffFF6F6E),
                          Color(0xffFFAF70),
                        ]),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 7),
                          blurRadius: 10)
                    ]),
                child: Text(
                  "SAVE",
                  style: GoogleFonts.lato(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
              )
            ],
          )
        ],
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
