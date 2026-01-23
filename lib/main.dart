// main.dart
import 'package:calendly/modals/task_detail_sheet.dart';
import 'package:calendly/screens/notes_section.dart';
import 'package:calendly/screens/remainder_calender_section.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        cardTheme: CardThemeData(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      home: const RootWithBottomNav(),
    );
  }
}

class RootWithBottomNav extends StatefulWidget {
  const RootWithBottomNav({super.key});

  @override
  State<RootWithBottomNav> createState() => _RootWithBottomNavState();
}

class _RootWithBottomNavState extends State<RootWithBottomNav> {
  DateTime _focusedDate = DateTime(2025, 10);

  void _showTaskDetail(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollController) => TaskDetailSection(
          scrollController: scrollController,
          onSave: () {},
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Productivity Dashboard")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. Calendar / Reminder at the top
            ReminderCalendarSection(
              focusedDate: _focusedDate,
              onDateChanged: (d) => setState(() => _focusedDate = d),
              onEventTap: () => _showTaskDetail(context),
              onEditTap: () => _showTaskDetail(context),
            ),

            // Divider
            const Divider(),

            // 2. Task Detail below
            // TaskDetailSection(
            //   onSave: () {},
            //   scrollController: ScrollController(),
            // ),

            // 3. Notes at the bottom
            NotesSection(),
          ],
        ),
      ),
    );
  }
}
