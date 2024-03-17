import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_maker/contents/personal.dart';

bool presentlyStudying = false;
bool presentlyWorking = false;
double skillLevel = 0;
int? categoryClick = 0, indexedStackCategoryPosition = 0;

List<TextEditingController>? interestControllerList, languagesControllerList;
List<Map<String, TextEditingController?>>? skillsControllerHandlerList = [
  {
    'course': resumeController.txtCourseDegree,
    'school': resumeController.txtSchoolCollegeUniversity,
    'startYear': resumeController.txtStartYear,
    'endYear': resumeController.txtEndYear,
  }
];
Map<String, TextEditingController?>? skillsMap = {
  'course': resumeController.txtCourseDegree,
  'school': resumeController.txtSchoolCollegeUniversity,
  'startYear': resumeController.txtStartYear,
  'endYear': resumeController.txtEndYear,
};

class ResumeVariables {
  String? firstName,
      lastName,
      email,
      phone,
      address,
      designation,
      careerObjective;
  String? portfolioLinkType, portfolioLink;
  String? courseDegree, schoolCollegeUniversity, startYear, endYear;
  String? jobTitle,
      companyName,
      experienceStartYear,
      experienceEndYear,
      experienceDetails;
  String? projectTitle, projectDescription, projectLinkOptional;
  String? certificationName, issuingOrganization, issuedDate;
  String? achievementTitle, achievementDescription;
  List<String>? skills, interest, languages;
  String? referenceName,
      referenceDesignation,
      referenceEmail,
      referencePhone,
      referenceDetailsOptional;
}

class ResumeController {
  TextEditingController? txtFirstName,
      txtLastName,
      txtEmail,
      txtPhone,
      txtAddress;
  TextEditingController? txtDesignation, txtCareerObjective;
  TextEditingController? txtPortfolioLinkType, txtPortfolioLink;
  TextEditingController? txtCourseDegree,
      txtSchoolCollegeUniversity,
      txtStartYear,
      txtEndYear;
  Map? txtEducation;
  TextEditingController? txtJobTitle,
      txtCompanyName,
      txtExperienceStartYear,
      txtExperienceEndYear,
      txtExperienceDetails;
  TextEditingController? txtProjectTitle,
      txtProjectDescription,
      txtProjectLinkOptional;
  TextEditingController? txtCertificationName,
      txtIssuingOrganization,
      txtIssuedDate;
  TextEditingController? txtAchievementTitle, txtAchievementDescription;

  TextEditingController? txtReferenceName,
      txtReferenceDesignation,
      txtReferenceEmail,
      txtReferencePhone,
      txtReferenceDetailsOptional;
}
