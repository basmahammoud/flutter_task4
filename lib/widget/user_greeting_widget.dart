import 'package:flutter/material.dart';

class UserGreetingWidget extends StatefulWidget {
  final String? username;

  const UserGreetingWidget({super.key, this.username});

  @override
  State<UserGreetingWidget> createState() => _UserGreetingWidgetState();
}

class _UserGreetingWidgetState extends State<UserGreetingWidget> {
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
      'Hello, ${widget.username ?? 'Guest'} ',
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
