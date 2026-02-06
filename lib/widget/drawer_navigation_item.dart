import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task4/providers/session_provider.dart';
import 'package:flutter_task4/providers/settings_provider.dart';
import 'package:flutter_task4/providers/usage_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // final t = AppLocalizations.of(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
            ),
            child: Text(
              'menu'.tr(),
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),

          ListTile(
            leading: const Icon(Icons.settings),
            title: Text('settings'.tr()),
            onTap: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),

          ListTile(
            leading: const Icon(Icons.logout),
            title: Text('logout'.tr()),
            onTap: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.remove(
                'token',
              ); // إزالة التوكن أو أي بيانات تسجيل دخول
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
          ListTile(
            leading: const Icon(Icons.refresh),
            title: Text('reset app data'.tr()),
            onTap: () async {
               context.read<SessionProvider>().resetAppData();
              context.read<UsageProvider>().resetUsage();
              context.read<SettingsProvider>().resetSettings(context);

              // إعادة التطبيق لصفحة Login (مسح كل الصفحات السابقة)
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/login',
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
