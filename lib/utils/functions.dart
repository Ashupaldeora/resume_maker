import 'dart:typed_data';

import 'package:google_fonts/google_fonts.dart';
import 'package:resume_maker/contents/experience.dart';
import 'package:resume_maker/contents/languages.dart';
import 'package:resume_maker/contents/portfolio.dart';
import 'package:resume_maker/utils/variables.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as r;
import 'package:printing/printing.dart';

import '../contents/Education.dart';
import '../view/screens/resumescreen.dart';

void experienceListConvertor() {
  if (resumeVariables.experience.isNotEmpty) {
    resumeVariables.experience.clear();
  }
  for (int i = 0; i < experienceControllerHandlerList.length; i++) {
    Map temp = {
      'jobTitle': experienceControllerHandlerList[i]['jobTitle'].text,
      'companyName': experienceControllerHandlerList[i]['companyName'].text,
      'expStartYear': experienceControllerHandlerList[i]['expStartYear'].text,
      'expEndYear': (presentlyWorkingNot[i] == false)
          ? experienceControllerHandlerList[i]['expEndYear'].text
          : "${dateTime.year}",
      'expDetails': experienceControllerHandlerList[i]['expDetails'].text,
    };
    resumeVariables.experience.add(temp);
  }
}

void educationListConvertor() {
  if (resumeVariables.education.isNotEmpty) {
    resumeVariables.education.clear();
  }
  for (int i = 0; i < educationControllerHandlerList.length; i++) {
    Map temp = {
      'course': educationControllerHandlerList[i]['course'].text,
      'school': educationControllerHandlerList[i]['school'].text,
      'startYear': educationControllerHandlerList[i]['startYear'].text,
      'endYear': (presentlyStudyingNot[i] == false)
          ? educationControllerHandlerList[i]['endYear'].text
          : "${dateTime.year}",
    };
    resumeVariables.education.add(temp);
  }
}

void projectListConvertor() {
  if (resumeVariables.project.isNotEmpty) {
    resumeVariables.project.clear();
  }
  for (int i = 0; i < projectControllerHandlerList.length; i++) {
    Map temp = {
      'projectTitle': projectControllerHandlerList[i]['projectTitle'].text,
      'projectDescription':
          projectControllerHandlerList[i]['projectDescription'].text,
      'projectLink': projectControllerHandlerList[i]['projectLink'].text,
    };
    resumeVariables.project.add(temp);
  }
}

void certificationListConvertor() {
  if (resumeVariables.certification.isNotEmpty) {
    resumeVariables.certification.clear();
  }
  for (int i = 0; i < certificationControllerHandlerList.length; i++) {
    Map temp = {
      'certificationName':
          certificationControllerHandlerList[i]['certificationName'].text,
      'issuing': certificationControllerHandlerList[i]['issuing'].text,
      'issuedDate': certificationControllerHandlerList[i]['issuedDate'].text,
    };
    resumeVariables.certification.add(temp);
  }
}

void achievementListConvertor() {
  if (resumeVariables.achievement.isNotEmpty) {
    resumeVariables.achievement.clear();
  }
  for (int i = 0; i < achievementControllerHandlerList.length; i++) {
    Map temp = {
      'achievementTitle':
          achievementControllerHandlerList[i]['achievementTitle'].text,
      'achievementDescription':
          achievementControllerHandlerList[i]['achievementDescription'].text,
    };
    resumeVariables.achievement.add(temp);
  }
}

void skillsListConvertor() {
  if (resumeVariables.skills.isNotEmpty) {
    resumeVariables.skills.clear();
  }
  for (int i = 0; i < skillsControllerHandlerList.length; i++) {
    Map temp = {
      'skill': skillsControllerHandlerList[i]['skill'].text,
      'level': skillsControllerHandlerList[i]['level'],
    };
    resumeVariables.skills.add(temp);
  }
}

void interestListConvertor() {
  if (resumeVariables.interest.isNotEmpty) {
    resumeVariables.interest.clear();
  }
  for (int i = 0; i < interestControllerHandlerList.length; i++) {
    String txt = "";
    txt = interestControllerHandlerList[i].text;
    resumeVariables.interest.add(txt);
  }
}

void languageListConvertor() {
  if (resumeVariables.languages.isNotEmpty) {
    resumeVariables.languages.clear();
  }
  for (int i = 0; i < languageControllerHandlerList.length; i++) {
    Map temp = {
      'language': languageControllerHandlerList[i]['language'].text,
      'proficiency': languageControllerHandlerList[i]['proficiency'],
    };
    resumeVariables.languages.add(temp);
  }
}

void referenceListConvertor() {
  if (resumeVariables.references.isNotEmpty) {
    resumeVariables.references.clear();
  }
  for (int i = 0; i < referenceControllerHandlerList.length; i++) {
    Map temp = {
      'referenceName': referenceControllerHandlerList[i]['referenceName'].text,
      'referenceDesignation':
          referenceControllerHandlerList[i]['referenceDesignation'].text,
      'referenceEmail':
          referenceControllerHandlerList[i]['referenceEmail'].text,
      'referencePhone':
          referenceControllerHandlerList[i]['referencePhone'].text,
      'referenceDetails':
          referenceControllerHandlerList[i]['referenceDetails'].text,
    };
    resumeVariables.references.add(temp);
  }
}

SnackBar snackbar() {
  return const SnackBar(
    content: Text(
      "Saved",
      style: TextStyle(color: Colors.white),
    ),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.orangeAccent,
    duration: Duration(seconds: 2),
    margin: EdgeInsets.only(bottom: 90, left: 100, right: 100),
  );
}

SnackBar pdfsnackbar() {
  return const SnackBar(
    content: Text(
      "All Fields with (*) are Required ",
      style: TextStyle(color: Colors.white),
    ),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.orangeAccent,
    duration: Duration(seconds: 2),
    margin: EdgeInsets.only(bottom: 90, left: 100, right: 100),
  );
}

Future<Uint8List> generatePdf() async {
  final pdf = r.Document();
  final imageBytes = r.MemoryImage(imgpath!.readAsBytesSync());
  var font = await PdfGoogleFonts.latoRegular();
  var font2 = await PdfGoogleFonts.latoBlack();
  var italic = await PdfGoogleFonts.latoLightItalic();
  var darkitalic = await PdfGoogleFonts.latoBlackItalic();
  var light = await PdfGoogleFonts.latoLight();
  final contactIcon =
      await imageFromAssetBundle('assets/images/og contact.png');
  final locationIcon = await imageFromAssetBundle('assets/images/location.png');
  final phoneIcon = await imageFromAssetBundle('assets/images/phone.png');
  final mailIcon = await imageFromAssetBundle('assets/images/email.png');
  final skillIcon = await imageFromAssetBundle('assets/images/og skill.png');
  final portfoliolIcon =
      await imageFromAssetBundle('assets/images/og education.png');

  pdf.addPage(r.Page(
    margin: r.EdgeInsets.all(0),
    pageFormat: PdfPageFormat.a4,
    build: (context) => r.Row(children: [
      r.Padding(
        padding: r.EdgeInsets.only(top: 50, bottom: 50, right: 50),
        child:
            r.Column(crossAxisAlignment: r.CrossAxisAlignment.start, children: [
          r.Padding(
              padding: r.EdgeInsets.only(left: 50, bottom: 20),
              child: r.Container(
                  child: r.Column(
                      crossAxisAlignment: r.CrossAxisAlignment.start,
                      mainAxisAlignment: r.MainAxisAlignment.spaceEvenly,
                      children: [
                    r.Container(
                        margin: r.EdgeInsets.only(bottom: 20),
                        height: 140,
                        width: 140,
                        decoration: r.BoxDecoration(
                          border: r.Border.all(
                              width: 15, color: PdfColor.fromHex("#E3E2DC")),
                        ),
                        child: r.Image(imageBytes, fit: r.BoxFit.cover)),
                    r.Text(resumeVariables.firstName!,
                        style: r.TextStyle(font: font, fontSize: 30)),
                    r.Text(resumeVariables.lastName!,
                        style: r.TextStyle(font: font2, fontSize: 40)),
                    r.Text(resumeVariables.designation!,
                        style: r.TextStyle(font: italic, fontSize: 20)),
                  ]))),
          r.Container(
              height: 35,
              padding: r.EdgeInsets.only(left: 50),
              width: 260,
              margin: r.EdgeInsets.only(bottom: 10),
              decoration: r.BoxDecoration(
                  color: PdfColor.fromHex("#2F3237"),
                  borderRadius: r.BorderRadius.only(
                      topRight: r.Radius.circular(18),
                      bottomRight: r.Radius.circular(18))),
              child: r.Row(
                  mainAxisAlignment: r.MainAxisAlignment.start,
                  children: [
                    r.Image(contactIcon, height: 25),
                    r.SizedBox(width: 15),
                    r.Text("Contact",
                        style: r.TextStyle(
                            font: font2, fontSize: 20, color: PdfColors.white)),
                  ])),
          r.Padding(
              padding: r.EdgeInsets.only(left: 50, bottom: 30),
              child: r.Container(
                  height: 120,
                  width: 200,
                  child: r.Column(
                      mainAxisAlignment: r.MainAxisAlignment.spaceEvenly,
                      children: [
                        r.Row(children: [
                          r.Image(locationIcon, height: 20),
                          r.SizedBox(width: 20),
                          r.Text(resumeVariables.address!,
                              overflow: r.TextOverflow.visible,
                              style: r.TextStyle(
                                font: font,
                                fontSize: 15,
                              )),
                        ]),
                        r.Row(children: [
                          r.Image(phoneIcon, height: 20),
                          r.SizedBox(width: 20),
                          r.Text(resumeVariables.phone!,
                              overflow: r.TextOverflow.visible,
                              style: r.TextStyle(
                                font: font,
                                fontSize: 15,
                              )),
                        ]),
                        r.Row(children: [
                          r.Image(mailIcon, height: 20),
                          r.SizedBox(width: 20),
                          r.Text(resumeVariables.email!,
                              overflow: r.TextOverflow.visible,
                              style: r.TextStyle(
                                font: font,
                                fontSize: 15,
                              )),
                        ])
                      ]))),
          r.Container(
              padding: r.EdgeInsets.only(left: 50),
              height: 35,
              width: 260,
              margin: r.EdgeInsets.only(bottom: 10),
              decoration: r.BoxDecoration(
                  color: PdfColor.fromHex("#2F3237"),
                  borderRadius: r.BorderRadius.only(
                      topRight: r.Radius.circular(18),
                      bottomRight: r.Radius.circular(18))),
              child: r.Row(
                  mainAxisAlignment: r.MainAxisAlignment.start,
                  children: [
                    r.Image(skillIcon, height: 25),
                    r.SizedBox(width: 15),
                    r.Text("Skills",
                        style: r.TextStyle(
                            font: font2, fontSize: 20, color: PdfColors.white)),
                  ])),
          r.Padding(
              padding: r.EdgeInsets.only(left: 50),
              child: r.Container(
                  height: 210,
                  width: 200,
                  child: r.Column(
                      mainAxisAlignment: r.MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: r.CrossAxisAlignment.start,
                      children: [
                        ...List.generate(
                            resumeVariables.skills.length,
                            (index) => (index <= 3)
                                ? r.Column(
                                    crossAxisAlignment:
                                        r.CrossAxisAlignment.start,
                                    children: [
                                        r.Text(
                                            resumeVariables.skills[index]
                                                ['skill'],
                                            overflow: r.TextOverflow.visible,
                                            style: r.TextStyle(
                                              font: font,
                                              fontSize: 17,
                                            )),
                                        r.SizedBox(height: 10),
                                        r.LinearProgressIndicator(
                                          minHeight: 5,
                                          value: (resumeVariables.skills[index]
                                                      ['level'] ==
                                                  "Beginner")
                                              ? 0.25
                                              : (resumeVariables.skills[index]
                                                          ['level'] ==
                                                      "Intermediate")
                                                  ? 0.5
                                                  : (resumeVariables
                                                                  .skills[index]
                                                              ['level'] ==
                                                          "Advanced")
                                                      ? 0.75
                                                      : (resumeVariables.skills[
                                                                      index]
                                                                  ['level'] ==
                                                              "Expert")
                                                          ? 1
                                                          : 0,
                                          backgroundColor: PdfColors.grey,
                                          valueColor: PdfColors.black,
                                        ),
                                        r.SizedBox(height: 5),
                                        r.Text(
                                            resumeVariables.skills[index]
                                                ['level'],
                                            overflow: r.TextOverflow.visible,
                                            style: r.TextStyle(
                                              font: font,
                                              fontSize: 10,
                                            )),
                                      ])
                                : r.SizedBox()),
                      ]))),
        ]),
      ),
      r.Padding(
        padding: r.EdgeInsets.symmetric(vertical: 50),
        child:
            r.Column(crossAxisAlignment: r.CrossAxisAlignment.start, children: [
          r.Container(
              padding: r.EdgeInsets.only(left: 50),
              height: 35,
              width: 290,
              margin: r.EdgeInsets.only(bottom: 10),
              decoration: r.BoxDecoration(
                  color: PdfColor.fromHex("#2F3237"),
                  borderRadius: r.BorderRadius.only(
                      topLeft: r.Radius.circular(18),
                      bottomLeft: r.Radius.circular(18))),
              child: r.Row(
                  mainAxisAlignment: r.MainAxisAlignment.start,
                  children: [
                    r.Image(portfoliolIcon, height: 25),
                    r.SizedBox(width: 15),
                    r.Text("Portfolio",
                        style: r.TextStyle(
                            font: font2, fontSize: 20, color: PdfColors.white)),
                  ])),
          r.Container(
            width: 250,
            child: r.Text(
                textAlign: r.TextAlign.start,
                "PortFolio Type - ${resumeVariables.portfolioLinkType} ",
                // overflow: r.TextOverflow.visible,
                style: r.TextStyle(
                  font: font,
                  fontSize: 15,
                )),
          ),
          r.SizedBox(height: 10),
          r.Container(
            margin: r.EdgeInsets.only(bottom: 20),
            width: 250,
            child: r.Text(
                textAlign: r.TextAlign.start,
                "PortFolio Link - ${resumeVariables.portfolioLink}",
                // overflow: r.TextOverflow.visible,
                style: r.TextStyle(
                  font: light,
                  fontSize: 15,
                )),
          ),
          r.Container(
              padding: r.EdgeInsets.only(left: 50),
              height: 35,
              width: 290,
              margin: r.EdgeInsets.only(bottom: 10),
              decoration: r.BoxDecoration(
                  color: PdfColor.fromHex("#2F3237"),
                  borderRadius: r.BorderRadius.only(
                      topLeft: r.Radius.circular(18),
                      bottomLeft: r.Radius.circular(18))),
              child: r.Row(
                  mainAxisAlignment: r.MainAxisAlignment.start,
                  children: [
                    r.Image(contactIcon, height: 25),
                    r.SizedBox(width: 15),
                    r.Text("Languages",
                        style: r.TextStyle(
                            font: font2, fontSize: 20, color: PdfColors.white)),
                  ])),
          ...List.generate(
              resumeVariables.languages.length,
              (index) => r.Padding(
                  padding: r.EdgeInsets.only(bottom: 8),
                  child: r.Column(
                      crossAxisAlignment: r.CrossAxisAlignment.start,
                      children: [
                        r.Text(
                            textAlign: r.TextAlign.start,
                            "- ${resumeVariables.languages[index]['language']}",
                            // overflow: r.TextOverflow.visible,
                            style: r.TextStyle(
                              font: light,
                              fontSize: 15,
                            )),
                        r.Text(
                            textAlign: r.TextAlign.start,
                            "  ${resumeVariables.languages[index]['proficiency']}",
                            // overflow: r.TextOverflow.visible,
                            style: r.TextStyle(
                              font: darkitalic,
                              fontSize: 15,
                            )),
                      ]))),
          r.Container(
              padding: r.EdgeInsets.only(left: 50),
              height: 35,
              width: 290,
              margin: r.EdgeInsets.only(bottom: 20),
              decoration: r.BoxDecoration(
                  color: PdfColor.fromHex("#2F3237"),
                  borderRadius: r.BorderRadius.only(
                      topLeft: r.Radius.circular(18),
                      bottomLeft: r.Radius.circular(18))),
              child: r.Row(
                  mainAxisAlignment: r.MainAxisAlignment.start,
                  children: [
                    r.Image(portfoliolIcon, height: 25),
                    r.SizedBox(width: 15),
                    r.Text("Education",
                        style: r.TextStyle(
                            font: font2, fontSize: 20, color: PdfColors.white)),
                  ])),
          r.Container(
              width: 250,

              //education
              child: r.Column(
                  crossAxisAlignment: r.CrossAxisAlignment.start,
                  children: [
                    ...List.generate(
                        resumeVariables.education.length,
                        (index) => r.Padding(
                            padding: r.EdgeInsets.only(bottom: 10),
                            child: r.Column(children: [
                              r.Row(
                                  crossAxisAlignment:
                                      r.CrossAxisAlignment.start,
                                  children: [
                                    r.Container(
                                        height: 15,
                                        width: 15,
                                        decoration: r.BoxDecoration(
                                            color: PdfColors.black,
                                            borderRadius:
                                                r.BorderRadius.circular(8))),
                                    r.SizedBox(width: 20),
                                    r.Text(
                                        resumeVariables.education[index]
                                            ['course'],
                                        // overflow: r.TextOverflow.visible,
                                        style: r.TextStyle(
                                          font: font,
                                          fontSize: 15,
                                        )),
                                  ]),
                              r.Row(
                                  crossAxisAlignment:
                                      r.CrossAxisAlignment.center,
                                  children: [
                                    r.SizedBox(width: 5),
                                    r.Container(
                                        height: 50,
                                        width: 3,
                                        color: PdfColors.black),
                                    r.SizedBox(width: 20),
                                    r.Text(
                                        "${resumeVariables.education[index]['startYear']} - ${resumeVariables.education[index]['endYear']}",
                                        // overflow: r.TextOverflow.visible,
                                        style: r.TextStyle(
                                          font: light,
                                          fontSize: 15,
                                        )),
                                  ]),
                              r.Row(
                                  crossAxisAlignment:
                                      r.CrossAxisAlignment.start,
                                  children: [
                                    r.Container(
                                        height: 15,
                                        width: 15,
                                        decoration: r.BoxDecoration(
                                            color: PdfColors.black,
                                            borderRadius:
                                                r.BorderRadius.circular(8))),
                                    r.SizedBox(width: 20),
                                    r.SizedBox(
                                      width: 250,
                                      child: r.Text(
                                          resumeVariables.education[index]
                                              ['school'],
                                          // overflow: r.TextOverflow.visible,
                                          style: r.TextStyle(
                                            font: darkitalic,
                                            fontSize: 15,
                                          )),
                                    )
                                  ])
                            ])))
                  ])),
          r.Container(
              padding: r.EdgeInsets.only(left: 50),
              height: 35,
              width: 290,
              margin: r.EdgeInsets.only(bottom: 20),
              decoration: r.BoxDecoration(
                  color: PdfColor.fromHex("#2F3237"),
                  borderRadius: r.BorderRadius.only(
                      topLeft: r.Radius.circular(18),
                      bottomLeft: r.Radius.circular(18))),
              child: r.Row(
                  mainAxisAlignment: r.MainAxisAlignment.start,
                  children: [
                    r.Image(contactIcon, height: 25),
                    r.SizedBox(width: 15),
                    r.Text("Experience",
                        style: r.TextStyle(
                            font: font2, fontSize: 20, color: PdfColors.white)),
                  ])),
          r.Container(
              width: 250,
              margin: r.EdgeInsets.only(bottom: 20),
              //education
              child: r.Column(
                  crossAxisAlignment: r.CrossAxisAlignment.start,
                  children: [
                    ...List.generate(
                        resumeVariables.experience.length,
                        (index) => r.Padding(
                            padding: r.EdgeInsets.only(bottom: 10),
                            child: r.Column(children: [
                              r.Row(
                                  crossAxisAlignment:
                                      r.CrossAxisAlignment.start,
                                  children: [
                                    r.Container(
                                        height: 15,
                                        width: 15,
                                        decoration: r.BoxDecoration(
                                            color: PdfColors.black,
                                            borderRadius:
                                                r.BorderRadius.circular(8))),
                                    r.SizedBox(width: 20),
                                    r.Text(
                                        resumeVariables.experience[index]
                                            ['companyName'],
                                        // overflow: r.TextOverflow.visible,
                                        style: r.TextStyle(
                                          font: font,
                                          fontSize: 15,
                                        )),
                                  ]),
                              r.Row(
                                  crossAxisAlignment:
                                      r.CrossAxisAlignment.center,
                                  children: [
                                    r.SizedBox(width: 5),
                                    r.Column(children: [
                                      r.Container(
                                          height: 50,
                                          width: 3,
                                          color: PdfColors.black),
                                    ]),
                                    r.SizedBox(width: 25),
                                    r.Column(
                                        crossAxisAlignment:
                                            r.CrossAxisAlignment.start,
                                        children: [
                                          r.Text(
                                              "${resumeVariables.experience[index]['expStartYear']} - ${resumeVariables.experience[index]['expEndYear']}",
                                              // overflow: r.TextOverflow.visible,
                                              style: r.TextStyle(
                                                font: light,
                                                fontSize: 15,
                                              )),
                                          r.SizedBox(
                                            width: 250,
                                            child: r.Text(
                                                resumeVariables
                                                        .experience[index]
                                                    ['expDetails'],
                                                // overflow: r.TextOverflow.visible,
                                                style: r.TextStyle(
                                                  font: font,
                                                  fontSize: 15,
                                                )),
                                          )
                                        ])
                                  ]),
                              r.Row(
                                  crossAxisAlignment:
                                      r.CrossAxisAlignment.start,
                                  children: [
                                    r.Container(
                                        height: 15,
                                        width: 15,
                                        decoration: r.BoxDecoration(
                                            color: PdfColors.black,
                                            borderRadius:
                                                r.BorderRadius.circular(8))),
                                    r.SizedBox(width: 20),
                                    r.SizedBox(
                                      width: 250,
                                      child: r.Text(
                                          resumeVariables.experience[index]
                                              ['jobTitle'],
                                          // overflow: r.TextOverflow.visible,
                                          style: r.TextStyle(
                                            font: font,
                                            fontSize: 15,
                                          )),
                                    )
                                  ])
                            ])))
                  ])),
        ]),
      )
    ]),
  ));

  return await pdf.save();
}
