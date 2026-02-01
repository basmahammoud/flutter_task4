import 'package:flutter/material.dart';
import 'package:flutter_task4/localization/app_localizations.dart';
import 'package:flutter_task4/providers/session_provider.dart';
import 'package:flutter_task4/providers/usage_provider.dart';
import 'package:flutter_task4/widget/drawer_navigation_item.dart';
import 'package:flutter_task4/widget/user_greeting_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
// initState is called once when the State object is first created.
// We use it to do initial setup or initialize values.
// Here, we increment the usage count after the widget is rendered using addPostFrameCallback.
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final usageProvider = Provider.of<UsageProvider>(context, listen: false);
      usageProvider.incrementUsage();
    });
  }
// dispose is called when the widget is removed from the widget tree.
// We use it to clean up resources or stop any listeners.
// Here, we just print a message for debugging purposes.
  @override
  void dispose() {
    debugPrint('HomeScreen closed');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sessionProvider = Provider.of<SessionProvider>(context);
    final t = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(t.home), centerTitle: true),
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

                    UserGreetingWidget(username: sessionProvider.username),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Usage Counter
            Consumer<UsageProvider>(
              builder: (context, usageProvider, child) {
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
                          '${t.opened}: ${usageProvider.usageCount} ${t.items}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
