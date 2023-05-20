import 'package:flutter/material.dart';
import 'package:flutter_task/styles/colors.dart';
import 'package:flutter_task/utils/extensions.dart';

class LanguagePicker extends StatefulWidget {
  const LanguagePicker({Key? key}) : super(key: key);

  @override
  State<LanguagePicker> createState() => _LanguagePickerState();
}

class _LanguagePickerState extends State<LanguagePicker> {
  final List<String> _languages = ['English', 'हिन्दी', 'తెలుగు', 'ಕನ್ನಡ', 'मराठी', '...'];
  String _selectedLanguage = 'English';
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/strip.png',
          height: 10.h,
          fit: BoxFit.fitHeight,
        ),
        Positioned.fill(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ..._languages.map(
                (e) => InkWell(
                  onTap: () {
                    setState(() {
                      _selectedLanguage = e;
                    });
                  },
                  child: Text(
                    e,
                    style: TextStyle(
                      color: _selectedLanguage == e ? AppColors.accentColor3 : Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
