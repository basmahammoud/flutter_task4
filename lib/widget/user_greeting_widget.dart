import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class UserGreetingWidget extends StatefulWidget {
  final String? username;

  const UserGreetingWidget({super.key, this.username});

  @override
  State<UserGreetingWidget> createState() => _UserGreetingWidgetState();
}

class _UserGreetingWidgetState extends State<UserGreetingWidget> {
  
// didUpdateWidget is called whenever the widget configuration changes
// while the State object is still active.
// We use it to respond to changes in widget properties.
// Here, we check if the username changed and print a message if it did.
  @override
  void didUpdateWidget(covariant UserGreetingWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.username != widget.username) {
      debugPrint('Username updated');
    }
  }

  @override
  Widget build(BuildContext context) {
     return Text(
      'hello, ${widget.username ?? 'Guest'} '.tr(),
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
