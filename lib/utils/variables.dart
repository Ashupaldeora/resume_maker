import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:resume_maker/contents/personal.dart';

bool presentlyStudying = false;
bool presentlyWorking = false;
double skillLevel = 0, languageProficiencyLevel = 0;
int? categoryClick = 0, indexedStackCategoryPosition = 0;
bool isAdded = false,
    isExperienceAdded = false,
    isProjectAdded = false,
    isCertificationAdded = false,
    isAchievementAdded = false,
    isSkillAdded = false,
    isInterestAdded = false,
    isLanguageAdded = false,
    isReferenceAdded = false,
    isEditedEducation = false,
    isEditedExperience = false;
List toShowOneTimeEducation = ["education"];
int count = 0,
    experienceCount = 0,
    projectCount = 0,
    certificationCount = 0,
    achievementCount = 0,
    skillCount = 0,
    interestCount = 0,
    languageCount = 0,
    referenceCount = 0,
    pdfGeneratorCount = 0;

List? interestControllerList, languagesControllerList;
List educationControllerHandlerList = [
  {
    'course': resumeController.txtCourseDegree,
    'school': resumeController.txtSchoolCollegeUniversity,
    'startYear': resumeController.txtStartYear,
    'endYear': resumeController.txtEndYear,
  }
];
List experienceControllerHandlerList = [
  {
    'jobTitle': resumeController.txtJobTitle,
    'companyName': resumeController.txtCompanyName,
    'expStartYear': resumeController.txtExperienceStartYear,
    'expEndYear': resumeController.txtExperienceEndYear,
    'expDetails': resumeController.txtExperienceDetails,
  }
];
List projectControllerHandlerList = [
  {
    'projectTitle': resumeController.txtProjectTitle,
    'projectDescription': resumeController.txtProjectDescription,
    'projectLink': resumeController.txtProjectLinkOptional,
  }
];
List certificationControllerHandlerList = [
  {
    'certificationName': resumeController.txtCertificationName,
    'issuing': resumeController.txtIssuingOrganization,
    'issuedDate': resumeController.txtIssuedDate,
  }
];

List achievementControllerHandlerList = [
  {
    'achievementTitle': resumeController.txtAchievementTitle,
    'achievementDescription': resumeController.txtAchievementDescription,
  }
];

List skillsControllerHandlerList = [
  {
    'skill': resumeController.txtSkills,
    'level': "advanced",
  }
];

List interestControllerHandlerList = [resumeController.txtInterest];

List languageControllerHandlerList = [
  {
    'language': resumeController.txtLanguage,
    'proficiency': "Elementary Proficiency",
  }
];

List referenceControllerHandlerList = [
  {
    'referenceName': resumeController.txtReferenceName,
    'referenceDesignation': resumeController.txtReferenceDesignation,
    'referenceEmail': resumeController.txtReferenceEmail,
    'referencePhone': resumeController.txtReferencePhone,
    'referenceDetails': resumeController.txtReferenceDetailsOptional,
  }
];

List presentlyStudyingNot = [];
List presentlyWorkingNot = [];

//Data Storing Variables
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
  List skills = [],
      interest = [],
      languages = [],
      experience = [],
      education = [],
      project = [],
      certification = [],
      achievement = [],
      references = [];
  String? referenceName,
      referenceDesignation,
      referenceEmail,
      referencePhone,
      referenceDetailsOptional;
}

//All controllers

class ResumeController {
  //Personal field controllers
  TextEditingController txtFirstName = TextEditingController(),
      txtLastName = TextEditingController(),
      txtEmail = TextEditingController(),
      txtPhone = TextEditingController(),
      txtAddress = TextEditingController();
  //Profile field controllers
  TextEditingController txtDesignation = TextEditingController(),
      txtCareerObjective = TextEditingController();

  //Portfolio field controllers
  TextEditingController txtPortfolioLinkType = TextEditingController(),
      txtPortfolioLink = TextEditingController();

  //Education field controllers
  TextEditingController? txtCourseDegree = TextEditingController(),
      txtSchoolCollegeUniversity = TextEditingController(),
      txtStartYear = TextEditingController(),
      txtEndYear = TextEditingController();

  //Experience field controllers
  TextEditingController? txtJobTitle = TextEditingController(),
      txtCompanyName = TextEditingController(),
      txtExperienceStartYear = TextEditingController(),
      txtExperienceEndYear = TextEditingController(),
      txtExperienceDetails = TextEditingController();

  //Project field controllers
  TextEditingController? txtProjectTitle = TextEditingController(),
      txtProjectDescription = TextEditingController(),
      txtProjectLinkOptional = TextEditingController();

  //Certification field controllers
  TextEditingController? txtCertificationName = TextEditingController(),
      txtIssuingOrganization = TextEditingController(),
      txtIssuedDate = TextEditingController();

  //Achievement field controllers
  TextEditingController? txtAchievementTitle = TextEditingController(),
      txtAchievementDescription = TextEditingController();

  //skills field controllers
  TextEditingController txtSkills = TextEditingController();

//Reference field controllers

  TextEditingController? txtReferenceName = TextEditingController(),
      txtReferenceDesignation = TextEditingController(),
      txtReferenceEmail = TextEditingController(),
      txtReferencePhone = TextEditingController(),
      txtReferenceDetailsOptional = TextEditingController();

//Interest field controllers
  TextEditingController txtInterest = TextEditingController();

//Language field controllers
  TextEditingController txtLanguage = TextEditingController();
}
