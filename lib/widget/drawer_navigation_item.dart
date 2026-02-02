import 'package:flutter/material.dart';
import 'package:flutter_task4/localization/app_localizations.dart';
import 'package:flutter_task4/providers/session_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
            ),
            child: Text(
              (t.menu),
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),

          ListTile(
            leading: const Icon(Icons.settings),
            title: Text(t.settings),
            onTap: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),

          ListTile(
            leading: const Icon(Icons.logout),
            title: Text(t.logout),
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
            title: const Text('Reset App Data'),
            onTap: () async {
              final sessionProvider = Provider.of<SessionProvider>(
                context,
                listen: false,
              );
              await sessionProvider.resetAppData();

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
