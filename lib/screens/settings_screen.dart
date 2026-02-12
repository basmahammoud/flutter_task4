import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task4/bloc/theme/theme_bloc.dart';
import 'package:flutter_task4/bloc/theme/theme_event.dart';
import 'package:flutter_task4/bloc/theme/theme_state.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('settings'.tr()), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Appearance Section
            Text('appearance'.tr(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),

            BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, themeState) {
                return Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
               child: SwitchListTile(
                    title: Text('dark_mode'.tr()),
                    subtitle: Text('enable_dark_theme'.tr()),
                    value: themeState.isDarkMode,
                    onChanged: (_) {
                      context
                          .read<ThemeBloc>()
                          .add(const ToggleTheme());
                    },
                  ),
            );
              }
            ),
            const SizedBox(height: 24),

            // Language Section
            Text('language'.tr(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              child: ListTile(
                title: Text('app_language'.tr()),
                trailing: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    //value: settingsProvider.currentLanguage,
                    items: [
                      DropdownMenuItem(value: 'en', child: Text('english'.tr())),
                      DropdownMenuItem(value: 'ar', child: Text('arabic'.tr())),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        //settingsProvider.changeLanguage(context, value);
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
