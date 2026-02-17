import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task4/bloc/language/language_bloc.dart';
import 'package:flutter_task4/bloc/language/language_event.dart';
import 'package:flutter_task4/bloc/session/session_bloc.dart';
import 'package:flutter_task4/bloc/session/session_event.dart';
import 'package:flutter_task4/bloc/session/session_state.dart';
import 'package:flutter_task4/bloc/theme/theme_bloc.dart';
import 'package:flutter_task4/bloc/theme/theme_event.dart';
import 'package:flutter_task4/bloc/usage/usage_block.dart';
import 'package:flutter_task4/bloc/usage/usage_event.dart';
import 'package:flutter_task4/bloc/usage/usage_state.dart';
import 'package:flutter_task4/bloc/user_name/user_bloc.dart';
import 'package:flutter_task4/bloc/user_name/user_state.dart';
import 'package:flutter_task4/widget/drawer_navigation_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocListener<SessionBloc, SessionState>(
  listener: (context, state) async {

    if (state is SessionResetSuccess) {

      context.read<ThemeBloc>().add(const ResetTheme());

      context.read<LanguageBloc>().add(
        const ChangeLanguage(languageCode: 'en'),
      );

      await context.setLocale(const Locale('en'));

      Navigator.pushNamedAndRemoveUntil(
        context,
        '/login',
        (route) => false,
      );

      /// clear session state to avoid any data remain after reset
      context.read<SessionBloc>().add(const SessionClearState());
    }

    if (state is SessionUnauthenticated) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/login',
        (route) => false,
      );
    }
    
  },
      child: Scaffold(
        appBar: AppBar(title: Text('Home'.tr()), centerTitle: true),
        drawer: const HomeDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Welcome Card
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Icon(
                        Icons.home,
                        size: 48,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      const SizedBox(height: 12),

                      //present the name of user if exist in bloc
                      BlocBuilder<UserNameBloc, UserNameState>(
                        builder: (context, state) {
                          if (state is UserNameUpdated) {
                            return Text(
                              'Welcome, ${state.name}!',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          } else {
                            return const Text(
                              'Welcome!',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Usage Counter Placeholder
              BlocProvider(
                create: (_) => UsageBloc()..add(FetchUsageData()),

                // send event to bring data
                child: BlocBuilder<UsageBloc, UsageState>(
                  builder: (context, state) {
                    if (state is UsageSuccess) {
                      return Card(
                        color: Theme.of(context).colorScheme.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.bar_chart,
                                color: Theme.of(context).iconTheme.color,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'opened_items'.tr(args: [state.usageData]),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else if (state is UsageLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ),

              const SizedBox(height: 24),

              // Last Open Time Placeholder
              BlocBuilder<SessionBloc, SessionState>(
                builder: (context, state) {
                  if (state is SessionAuthenticated) {
                    return Text(
                      'Last Opened: ${state.loginTime}',
                      style: const TextStyle(fontSize: 16),
                    );
                  } else {
                    return const Text(
                      'Welcome! This is your first time',
                      style: TextStyle(fontSize: 16),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
