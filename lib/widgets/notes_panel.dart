import 'package:flutter/material.dart';
import 'shared_components.dart';

/// Panel displaying a timeline of notes and tasks
class NotesPanel extends StatelessWidget {
  const NotesPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                CustomIconBox(icon: Icons.sticky_note_2_outlined),
                SizedBox(width: 12),
                Text(
                  'Notes',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            _SmallBlackBtn(icon: Icons.add, label: 'Add Note'),
          ],
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
                    hintText: 'Search Notes...',
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
        const SizedBox(height: 32),
        const _TimelineNoteItem(
          tag: 'Today',
          date: '2025 - Aug 03',
          title: 'Text Inputs for Design System',
          desc:
              'Search for inspiration to provide a rich content experience...',
          buttonLabel: 'View Details',
          tagColor: Colors.blue,
        ),
        const _TimelineNoteItem(
          tag: 'Tomorrow',
          date: '2025 - Aug 04',
          title: 'User Interface Components',
          desc:
              'Gather examples of UI components that enhance interactivity...',
          buttonLabel: 'Explore Components',
          tagColor: Colors.orange,
        ),
        const _TimelineNoteItem(
          tag: 'Next Week',
          date: '2025 - Aug 10',
          title: 'Color Palettes for Branding',
          desc: 'Curate a collection of color palettes that align...',
          buttonLabel: 'See Color Palettes',
          tagColor: Colors.green,
        ),
        const _TimelineNoteItem(
          tag: 'This Month',
          date: '2025 - Jul 15',
          title: 'Responsive Web Design',
          desc: 'Develop layouts that adapt seamlessly to diff...',
          buttonLabel: 'View Designs',
          tagColor: Colors.green,
        ),
      ],
    );
  }
}

/// Small action button with icon and label
class _SmallBlackBtn extends StatelessWidget {
  final IconData icon;
  final String label;
  const _SmallBlackBtn({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.white),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

/// Single note item displayed in the timeline
class _TimelineNoteItem extends StatelessWidget {
  final String tag; // Timeline tag (e.g., 'Today', 'Tomorrow')
  final String date;
  final String title;
  final String desc; // Description preview
  final String buttonLabel;
  final Color tagColor; // Color for the tag badge

  const _TimelineNoteItem({
    required this.tag,
    required this.date,
    required this.title,
    required this.desc,
    this.buttonLabel = 'View Details',
    this.tagColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFF3F4F6), width: 2),
                ),
                child: Center(
                  child: Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: Colors.black12,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(width: 2, color: const Color(0xFFF9FAFB)),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: tagColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '• $tag',
                        style: TextStyle(
                          color: tagColor,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      date,
                      style: const TextStyle(
                        color: Colors.black26,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  desc,
                  style: const TextStyle(color: Colors.black38, fontSize: 11),
                ),
                const SizedBox(height: 12),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 36),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    buttonLabel,
                    style: const TextStyle(fontSize: 11),
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
