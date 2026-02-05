import 'package:flutter/material.dart';
// import 'widgets/shared_components.dart';

import 'widgets/reminder_panel.dart';
import 'widgets/task_detail_panel.dart';
import 'widgets/session_lifetime_panel.dart';
import 'widgets/notes_panel.dart';

void main() {
  runApp(const ZenTaskApp());
}

class ZenTaskApp extends StatelessWidget {
  const ZenTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ZenTask Manager',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF9FAFB), // bg-gray-50
        fontFamily: 'Inter',
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          primary: Colors.black,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Column(
                children: const [
                  ReminderPanel(),
                  SizedBox(height: 24),
                  TaskDetailPanel(),
                  SizedBox(height: 24),
                  SessionLifetimePanel(),
                  SizedBox(height: 24),
                  NotesPanel(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
