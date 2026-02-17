import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task4/bloc/session/session_bloc.dart';
import 'package:flutter_task4/bloc/session/session_event.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
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
            onTap: () {
              context.read<SessionBloc>().add(SessionLogout());
            },
          ),

          ListTile(
            leading: const Icon(Icons.refresh),
            title: Text('reset app data'.tr()),
            onTap: () {
              context.read<SessionBloc>().add(const SessionReset());
            },
          ),
        ],
      ),
    );
  }
}
