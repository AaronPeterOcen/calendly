import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  final String label, date, title;
  final Color color;

  const NoteCard({
    super.key,
    required this.label,
    required this.date,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(label, style: TextStyle(color: color)),
                ),
                const Spacer(),
                Text(
                  date,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text(
              "Short preview...",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                child: const Text("View Details"),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotesSection extends StatelessWidget {
  const NotesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: "Search Notes",
              prefixIcon: const Icon(Icons.search),
              suffixIcon: IconButton(
                icon: const Icon(Icons.filter_list),
                onPressed: () {},
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            icon: const Icon(Icons.add),
            label: const Text("Add Note"),
            onPressed: () {},
          ),
          const SizedBox(height: 24),
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              NoteCard(
                label: "Today",
                date: "2025-Aug 03",
                title: "Text Inputs for Design System",
                color: Colors.green,
              ),
              NoteCard(
                label: "Tomorrow",
                date: "2025-Aug 04",
                title: "User Interface Components",
                color: Colors.orange,
              ),
              NoteCard(
                label: "Next Week",
                date: "2025-Aug 10",
                title: "Color Palettes for Branding",
                color: Colors.blue,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
