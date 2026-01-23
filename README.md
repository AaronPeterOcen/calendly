# Calendly - Productivity Dashboard

A Flutter-based productivity dashboard application designed to help users manage their tasks, events, and notes in an intuitive and organized manner.

## Features

### 📅 Calendar & Reminders

- Interactive calendar view with month navigation
- Event cards displaying workshop sessions and meetings
- Date selection and focused date management
- Segmented tabs for different event categories (Discussion, Events, Vacations)

### ✅ Task Management

- Detailed task editing through modal bottom sheets
- Task properties including title, priority, assigned team members
- Rich text description support
- Reminder settings and task lifecycle management
- Save and reset functionality

### 📝 Notes Section

- Dedicated notes area for additional productivity tracking
- Integrated with the main dashboard layout

### 🎨 Modern UI/UX

- Material Design 3 implementation
- Responsive card-based layout
- Smooth animations and transitions
- Draggable modal sheets for task details

## Screenshots

_(Add screenshots of your app here)_

## Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK
- Android Studio or VS Code with Flutter extensions
- Android/iOS emulator or physical device

### Installation

1. Clone the repository:

```bash
git clone https://github.com/your-username/calendly.git
cd calendly
```

2. Install dependencies:

```bash
flutter pub get
```

3. Run the app:

```bash
flutter run
```

### Building for Production

#### Android APK:

```bash
flutter build apk --release
```

#### iOS (on macOS):

```bash
flutter build ios --release
```

## Project Structure

```
lib/
├── main.dart                 # App entry point and main dashboard
├── modals/
│   └── task_detail_sheet.dart # Task detail modal bottom sheet
└── screens/
    ├── remainder_calender_section.dart # Calendar and events section
    └── notes_section.dart     # Notes section
```

## Dependencies

- `flutter/material.dart` - Material Design components
- `table_calendar` - Calendar widget implementation

## Key Components

### ReminderCalendarSection

Handles the calendar display, event cards, and date navigation. Features:

- Month/year header with navigation arrows
- TableCalendar integration
- Event cards with edit functionality
- Segmented button tabs for event filtering

### TaskDetailSection

Modal bottom sheet for task editing with:

- Title and priority fields
- Team member assignment with chips
- Rich description text area
- Reminder toggle
- Save/Reset actions

### NotesSection

Simple notes area for additional productivity notes.

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Built with Flutter
- Uses Material Design 3 for modern UI
- Inspired by productivity and calendar management apps
# calendly
