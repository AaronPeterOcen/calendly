import 'package:flutter/material.dart';

class TaskDetailSection extends StatelessWidget {
  final ScrollController scrollController;

  const TaskDetailSection({
    super.key,
    required this.scrollController,
    required Null Function() onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Detail Task",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const SizedBox(height: 16),

            TextField(
              decoration: const InputDecoration(
                labelText: "Title Task",
                border: OutlineInputBorder(),
              ),
              controller: TextEditingController(text: "Edit Design System"),
            ),

            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              initialValue: "High",
              items: [
                "Low",
                "Medium",
                "High",
              ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (v) {},
              decoration: const InputDecoration(
                labelText: "Priority",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 24),
            const Text(
              "Assign Task To",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            Wrap(
              spacing: 8,
              children: [
                _buildAvatarChip("Sophia Williams"),
                _buildAvatarChip("Liam Johnson"),
                _buildAvatarChip("Olivia Smith"),
                ActionChip(
                  label: const Text("+ Add other person"),
                  onPressed: () {},
                ),
              ],
            ),

            const SizedBox(height: 24),
            const Text("Description"),
            TextField(
              maxLines: 5,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "The goal is to update the current design system...",
              ),
            ),

            // Rich text toolbar simulation (you can use flutter_quill or custom Row)
            const SizedBox(height: 8),
            Row(
              children: const [
                Icon(Icons.format_bold),
                Icon(Icons.format_italic),
                Icon(Icons.link),
                Spacer(),
                Text("100/200"),
              ],
            ),

            const SizedBox(height: 32),
            SwitchListTile(
              title: const Text("Reminder Task"),
              value: true,
              onChanged: (v) {},
            ),

            // ... add the rest: session lifetime, app reminder, etc.
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    child: const Text("Reset"),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: FilledButton(
                    child: const Text("Save Changes"),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatarChip(String name) {
    return Chip(
      avatar: const CircleAvatar(child: Text("S")),
      label: Text(name),
      onDeleted: () {},
    );
  }
}
