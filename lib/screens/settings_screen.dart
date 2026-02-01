import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_task4/providers/theme_provider.dart';
import 'package:flutter_task4/providers/language_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ===== Appearance Section =====
            const Text(
              'Appearance',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              child: SwitchListTile(
                title: const Text('Dark Mode'),
                subtitle: const Text('Enable dark theme'),
                value: themeProvider.isDarkMode,
                onChanged: (value) {
                  themeProvider.toggleTheme(value);
                },
              ),
            ),

            const SizedBox(height: 24),

            // ===== Language Section =====
            const Text(
              'Language',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

           Card(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(14),
  ),
  child: ListTile(
    title: const Text('App Language'),
    subtitle: Text(
      languageProvider.currentLanguage == 'en' ? 'English' : 'Arabic',
    ),
    trailing: DropdownButton<String>(
      value: languageProvider.currentLanguage, 
      underline: const SizedBox(),
      items: const [
        DropdownMenuItem(
          value: 'en',
          child: Text('English'),
        ),
        DropdownMenuItem(
          value: 'ar',
          child: Text('Arabic'),
        ),
      ],
      onChanged: (value) {
        if (value != null) {
          languageProvider.changeLanguage(value);
        }
      },
    ),
  ),
),

          ],
        ),
      ),
    );
  }
}
