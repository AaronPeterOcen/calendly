import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ReminderCalendarSection extends StatelessWidget {
  final DateTime focusedDate;
  final ValueChanged<DateTime> onDateChanged;
  final VoidCallback onEventTap;
  final VoidCallback? onEditTap;

  const ReminderCalendarSection({
    super.key,
    required this.focusedDate,
    required this.onDateChanged,
    required this.onEventTap,
    this.onEditTap,
  });

  String _getMonthName(int month) {
    const monthNames = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return monthNames[month - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Month header + arrows
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left),
                onPressed: () {
                  /* prev month */
                },
              ),
              Text(
                "${_getMonthName(focusedDate.month)} ${focusedDate.year}",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              IconButton(
                icon: const Icon(Icons.chevron_right),
                onPressed: () {
                  /* next month */
                },
              ),
            ],
          ),

          // Tabs: Discussion / Events / Vacations
          SegmentedButton<String>(
            segments: const [
              ButtonSegment(value: "Discussion", label: Text("Discussion")),
              ButtonSegment(value: "Events", label: Text("Events")),
              ButtonSegment(value: "Vacations", label: Text("Vacations")),
            ],
            selected: const {"Events"},
            onSelectionChanged: (v) {},
          ),
          const SizedBox(height: 16),

          // Calendar widget (table_calendar example)
          Card(
            child: TableCalendar(
              firstDay: DateTime.utc(2020),
              lastDay: DateTime.utc(2030),
              focusedDay: focusedDate,
              calendarFormat: CalendarFormat.month,
              onDaySelected: (selected, focused) => onDateChanged(focused),
              // Add event markers, etc.
            ),
          ),

          const SizedBox(height: 16),

          // Event cards list
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              EventCard(
                title: "Workshop on Prototyping Techniques",
                time: "10:30 AM - 12:00 PM (UTC)",
                person: "Sarah Lee",
                location: "45 Greenfield Road, CA",
                onTap: onEventTap,
                onEditPressed: onEditTap,
              ),
              EventCard(
                title: "Interactive Session: UX Best Practices",
                time: "1:00 PM - 3:00 PM (UTC)",
                person: "Daniel Kim",
                location: "78 Elm Street, NY",
                onTap: onEventTap,
                onEditPressed: onEditTap,
              ),
              // more...
            ],
          ),
        ],
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String title, time, person, location;
  final VoidCallback onTap;
  final VoidCallback? onEditPressed;

  const EventCard({
    super.key,
    required this.title,
    required this.time,
    required this.person,
    required this.location,
    required this.onTap,
    this.onEditPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: const Icon(Icons.event, color: Colors.blue),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(time),
            Text("by $person"),
            Text(location, style: const TextStyle(fontSize: 12)),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.edit_outlined),
          onPressed: onEditPressed ?? onTap,
        ),
        onTap: onTap,
      ),
    );
  }
}
