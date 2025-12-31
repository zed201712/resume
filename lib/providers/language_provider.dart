import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../utils/constants.dart';
import '../models/resume_model.dart';

class LanguageProvider extends ChangeNotifier {
  // Although EasyLocalization handles Locale, we can provide helper methods 
  // or reactive data access here.
  
  ResumeData getResumeData(BuildContext context) {
    if (context.locale.languageCode == 'en') {
      return resumeDataEn;
    } else if (context.locale.languageCode == 'ja') {
      return resumeDataJa;
    }
    return resumeDataZh;
  }
}
