import 'package:flutter/material.dart';
import 'package:flutter_task4/localization/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_task4/providers/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    // final languageProvider = Provider.of<LanguageProvider>(context);
    // final t = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text("Settings"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //  Appearance Section 
             Text(
              "Appearance",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              child: SwitchListTile(
                title:  Text("Dark Mode"),
                subtitle:  Text("Enable dark theme"),
                value: themeProvider.isDarkMode,
                onChanged: (value) {
                  themeProvider.toggleTheme(value);
                },
              ),
            ),

            const SizedBox(height: 24),

            // Language Section 
             Text(
              "Language",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              // child: ListTile(
              //   title:  Text(t.appLanguage),
              //   subtitle: Text(
              //     languageProvider.currentLanguage == 'en'
              //         ? t.english
              //         : t.arabic,
              //   ),
              //   trailing: DropdownButtonHideUnderline(
              //     child: DropdownButton<String>(
              //       value: languageProvider.currentLanguage,
              //       items: [
              //         DropdownMenuItem(value: 'en', child: Text(t.english)),
              //         DropdownMenuItem(value: 'ar', child: Text(t.arabic)),
              //       ],
              //       onChanged: (value) {
              //         if (value != null) {
              //           languageProvider.changeLanguage(value);
              //         }
              //       },
              //     ),
              //   ),
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
