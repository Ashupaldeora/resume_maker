import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_maker/contents/Education.dart';
import 'package:resume_maker/contents/achievements.dart';
import 'package:resume_maker/contents/certifications.dart';
import 'package:resume_maker/contents/experience.dart';
import 'package:resume_maker/contents/interests.dart';
import 'package:resume_maker/contents/languages.dart';
import 'package:resume_maker/contents/personal.dart';
import 'package:resume_maker/contents/portfolio.dart';
import 'package:resume_maker/contents/profile.dart';
import 'package:resume_maker/contents/projects.dart';
import 'package:resume_maker/contents/references.dart';
import 'package:resume_maker/contents/skills.dart';
import 'package:resume_maker/utils/resumedetails.dart';
import 'package:image_picker/image_picker.dart';

class resume extends StatefulWidget {
  const resume({super.key});

  @override
  State<resume> createState() => _resumeState();
}

class _resumeState extends State<resume> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              actions: [
                const Icon(Icons.settings),
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 60,
                  width: 130,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [
                        Color(0xff16B48C),
                        Color(0xff8AC747),
                      ]),
                      borderRadius: BorderRadius.circular(50)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          Icons.picture_as_pdf_outlined,
                          color: Colors.white,
                          size: 20,
                        ),
                        Text(
                          "Generate",
                          style: GoogleFonts.lato(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 13),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                      resumeCategory.length,
                      (index) => Padding(
                            padding: const EdgeInsets.all(10),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  categoryClick = index;
                                  indexedstackcategoryPosition = index;
                                });
                                ;
                              },
                              child: Text(
                                resumeCategory[index],
                                style: GoogleFonts.lato(
                                    color: Colors.black,
                                    fontWeight: (categoryClick == index)
                                        ? FontWeight.w700
                                        : FontWeight.w500,
                                    fontSize:
                                        (categoryClick == index) ? 23 : 15),
                              ),
                            ),
                          )),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                children: [
                  IndexedStack(index: indexedstackcategoryPosition, children: [
                    const personal(),
                    const profile(),
                    const portfolio(),
                    const education(),
                    const experience(),
                    const project(),
                    const certification(),
                    const achievement(),
                    const skills(),
                    const interest(),
                    const language(),
                    const reference(),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

ImagePicker pickimage = ImagePicker();
File? imgpath;
int categoryClick = 0, indexedstackcategoryPosition = 0;
