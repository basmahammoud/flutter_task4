import 'package:flutter/material.dart';
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
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final usageProvider = Provider.of<UsageProvider>(context, listen: false);
      usageProvider.incrementUsage();
    });
  }

  @override
  void dispose() {
    debugPrint('HomeScreen closed');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sessionProvider = Provider.of<SessionProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Home'), centerTitle: true),
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
                    const Icon(Icons.home, size: 48, color: Colors.blue),
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
                  color: Colors.blue.shade50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.bar_chart, color: Colors.blue),
                        const SizedBox(width: 10),
                        Text(
                          'Opened: ${usageProvider.usageCount} times',
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

            const SizedBox(height: 32),

            // Logout Button
            // ElevatedButton.icon(
            //   icon: const Icon(Icons.logout),
            //   label: const Text(
            //     'Logout',
            //     style: TextStyle(fontSize: 18),
            //   ),
            //   style: ElevatedButton.styleFrom(
            //     padding: const EdgeInsets.symmetric(vertical: 14),
            //     backgroundColor: Colors.redAccent,
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(14),
            //     ),
            //   ),
            //   onPressed: () {
            //     Navigator.pushReplacement(
            //       context,
            //       MaterialPageRoute(builder: (_) => const LoginScreen()),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
