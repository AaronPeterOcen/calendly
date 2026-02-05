import 'package:flutter/material.dart';
import 'shared_components.dart';

class ReminderPanel extends StatefulWidget {
  const ReminderPanel({super.key});

  @override
  State<ReminderPanel> createState() => _ReminderPanelState();
}

class _ReminderPanelState extends State<ReminderPanel> {
  late ScrollController _scrollController;
  int _activeIndex = 2;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _updateActiveDate(int index) {
    setState(() {
      _activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Generate dates for the calendar
    final List<Map<String, String>> dates = [
      {'day': 'Fri', 'date': '31'},
      {'day': 'Sat', 'date': '01'},
      {'day': 'Sun', 'date': '02'},
      {'day': 'Mon', 'date': '03'},
      {'day': 'Tue', 'date': '04'},
      {'day': 'Wed', 'date': '05'},
      {'day': 'Thu', 'date': '06'},
      {'day': 'Fri', 'date': '07'},
      {'day': 'Sat', 'date': '08'},
      {'day': 'Sun', 'date': '09'},
    ];

    return SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              CustomIconBox(icon: Icons.calendar_month_outlined),
              SizedBox(width: 12),
              Text(
                'Reminder',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Month Selector
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFF9FAFB),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.chevron_left, size: 20),
                ),
                const Text(
                  'October 2025',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.chevron_right, size: 20),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // Date List - Scrollable with arrows
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  _scrollController.animateTo(
                    _scrollController.offset - 100,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: const Icon(
                  Icons.chevron_left,
                  size: 24,
                  color: Colors.black38,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      dates.length,
                      (index) => Padding(
                        padding: EdgeInsets.only(
                          right: index < dates.length - 1 ? 12 : 0,
                        ),
                        child: GestureDetector(
                          onTap: () => _updateActiveDate(index),
                          child: _DateItem(
                            day: dates[index]['day']!,
                            date: dates[index]['date']!,
                            active: _activeIndex == index,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: () {
                  _scrollController.animateTo(
                    _scrollController.offset + 100,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: const Icon(
                  Icons.chevron_right,
                  size: 24,
                  color: Colors.black38,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Tabs
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: const Color(0xFFF9FAFB),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                _TabItem(title: 'Discussion'),
                _TabItem(title: 'Events', active: true),
                _TabItem(title: 'Vacations'),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // Search Bar
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: const Color(0xFFF3F4F6)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      icon: const Icon(
                        Icons.search,
                        size: 20,
                        color: Colors.black38,
                      ),
                      hintText: 'Search Events...',
                      hintStyle: const TextStyle(
                        color: Colors.black26,
                        fontSize: 14,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFFF3F4F6)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.tune, size: 20, color: Colors.black54),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const EventItem(
            title: 'Workshop on Prototyping Techniques',
            time: '10:30 AM - 12:00 PM (UTC)',
            location: '45 Greenfield Road, CA',
            host: 'Sarah Lee',
            attendees: '12/16',
          ),
          const SizedBox(height: 16),
          const EventItem(
            title: 'Interactive Session: UX Best Practices',
            time: '1:00 PM - 3:00 PM (UTC)',
            location: '78 Elm Street, NY',
            host: 'Daniel Kim',
            attendees: '12/17',
          ),
        ],
      ),
    );
  }
}

class _DateItem extends StatelessWidget {
  final String day;
  final String date;
  final bool active;
  const _DateItem({required this.day, required this.date, this.active = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: active ? Colors.black : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            day.toUpperCase(),
            style: TextStyle(
              fontSize: 10,
              color: active ? Colors.white60 : Colors.black38,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            date,
            style: TextStyle(
              fontSize: 18,
              color: active ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  final String title;
  final bool active;
  const _TabItem({required this.title, this.active = false});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: active ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          boxShadow: active
              ? [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                  ),
                ]
              : null,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: active ? Colors.black : Colors.black38,
            ),
          ),
        ),
      ),
    );
  }
}

class EventItem extends StatelessWidget {
  final String title;
  final String time;
  final String location;
  final String host;
  final String attendees;
  const EventItem({
    super.key,
    required this.title,
    required this.time,
    required this.location,
    required this.host,
    this.attendees = '0/0',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFF3F4F6)),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          Text(
            time,
            style: const TextStyle(color: Colors.black38, fontSize: 11),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'by $host',
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.people_outline,
                    size: 16,
                    color: Colors.black26,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    attendees,
                    style: const TextStyle(fontSize: 11, color: Colors.black45),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF9FAFB),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.add, size: 14, color: Colors.black45),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          location,
                          style: const TextStyle(fontSize: 10),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              _SmallIconBtn(icon: Icons.edit_outlined),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {},
              child: const Text(
                'View Details',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SmallIconBtn extends StatelessWidget {
  final IconData icon;
  const _SmallIconBtn({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Icon(icon, size: 16, color: Colors.black45),
    );
  }
}
