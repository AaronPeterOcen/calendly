import 'package:flutter/material.dart';

// Import all panel widgets
import 'widgets/reminder_panel.dart';
import 'widgets/task_detail_panel.dart';
import 'widgets/session_lifetime_panel.dart';
import 'widgets/notes_panel.dart';

// Import screens and services
import 'screens/login_screen.dart';
import 'services/auth_service.dart';

/// Main entry point of the ZenTask Manager application
void main() {
  runApp(const ZenTaskApp());
}

/// Root app widget that sets up the Material theme and navigation
class ZenTaskApp extends StatefulWidget {
  const ZenTaskApp({super.key});

  @override
  State<ZenTaskApp> createState() => _ZenTaskAppState();
}

class _ZenTaskAppState extends State<ZenTaskApp> {
  late Future<bool> _loginStatusFuture;

  @override
  void initState() {
    super.initState();
    _loginStatusFuture = AuthService.isLoggedIn();
  }

  void _handleLoginSuccess() {
    setState(() {
      _loginStatusFuture = AuthService.isLoggedIn();
    });
  }

  void _handleLogout() {
    setState(() {
      _loginStatusFuture = AuthService.logout().then((_) => false);
    });
  }

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
      home: FutureBuilder<bool>(
        future: _loginStatusFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          if (snapshot.data == true) {
            return HomeScreen(onLogout: _handleLogout);
          } else {
            return LoginScreen(onLoginSuccess: _handleLoginSuccess);
          }
        },
      ),
    );
  }
}

/// Main home screen with drawer navigation
class HomeScreen extends StatefulWidget {
  final VoidCallback onLogout;

  const HomeScreen({super.key, required this.onLogout});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<String> _titles = ['', '', '', ''];

  final List<Widget> _pages = const [
    ReminderPage(),
    TaskDetailPage(),
    SessionLifetimePage(),
    NotesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      drawer: NavigationDrawer(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
          Navigator.pop(context);
        },
        children: [
          DrawerHeader(
            child: Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                'ZenTask Manager',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          NavigationDrawerDestination(
            label: const Text('Reminder'),
            icon: const Icon(Icons.notifications),
            selectedIcon: const Icon(Icons.notifications_active),
          ),
          NavigationDrawerDestination(
            label: const Text('Task Detail'),
            icon: const Icon(Icons.task),
            selectedIcon: const Icon(Icons.task_alt),
          ),
          NavigationDrawerDestination(
            label: const Text('Session Lifetime'),
            icon: const Icon(Icons.schedule),
            selectedIcon: const Icon(Icons.schedule_outlined),
          ),
          NavigationDrawerDestination(
            label: const Text('Notes'),
            icon: const Icon(Icons.note),
            selectedIcon: const Icon(Icons.note_outlined),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  widget.onLogout();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[200],
                  foregroundColor: Colors.black,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout, size: 20),
                    SizedBox(width: 8),
                    Text('Logout'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: _pages[_selectedIndex],
            ),
          ),
        ),
      ),
    );
  }
}

/// Reminder panel page
class ReminderPage extends StatelessWidget {
  const ReminderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ReminderPanel();
  }
}

/// Task detail panel page
class TaskDetailPage extends StatelessWidget {
  const TaskDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const TaskDetailPanel();
  }
}

/// Session lifetime panel page
class SessionLifetimePage extends StatelessWidget {
  const SessionLifetimePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SessionLifetimePanel();
  }
}

/// Notes panel page
class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const NotesPanel();
  }
}
