import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task4/widget/drawer_navigation_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // يمكنك لاحقًا إضافة أي متغيرات من Bloc هنا إذا أحببت

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    // يمكنك وضع اسم المستخدم هنا بعد ربطه بالـ Bloc
                    Text(
                      'Welcome!',
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Usage Counter Placeholder
            Card(
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
                      'opened_items'.tr(args: ['0']), // مؤقتًا 0
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Last Open Time Placeholder
            Text(
              'Welcome! This is your first time', // مؤقتًا نص ثابت
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
