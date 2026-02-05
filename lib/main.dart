import 'package:flutter/material.dart';

// Import all panel widgets
import 'widgets/reminder_panel.dart';
import 'widgets/task_detail_panel.dart';
import 'widgets/session_lifetime_panel.dart';
import 'widgets/notes_panel.dart';

/// Main entry point of the ZenTask Manager application
void main() {
  runApp(const ZenTaskApp());
}

/// Root app widget that sets up the Material theme and navigation
class ZenTaskApp extends StatelessWidget {
  const ZenTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ZenTask Manager',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(
          0xFFF9FAFB,
        ), // Light gray background
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

/// Main home screen displaying all task management panels
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
