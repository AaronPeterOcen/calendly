import 'package:flutter/material.dart';

/// Panel for editing and managing task details
class TaskDetailPanel extends StatelessWidget {
  const TaskDetailPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Detail Task',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Icon(Icons.close, size: 20, color: Colors.black26),
          ],
        ),
        const Text(
          'Manage your task detail here.',
          style: TextStyle(color: Colors.black38, fontSize: 12),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: _CustomInput(
                label: 'TITLE TASK',
                value: 'Edit Design System',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(child: _PriorityDropdown()),
          ],
        ),
        const SizedBox(height: 24),
        const Text(
          'ASSIGN TASK TO',
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: Colors.black38,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          children: const [
            _AssigneeTag(name: 'Sophia Williams'),
            _AssigneeTag(name: 'Liam Johnson'),
            _AssigneeTag(name: 'Olivia Smith'),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFF3F4F6)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Text(
              '+ Add other person',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'DESCRIPTION',
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: Colors.black38,
          ),
        ),
        const SizedBox(height: 12),
        const _DescriptionBox(),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                child: const Text('Reset'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 2,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {},
                child: const Text('Save Changes'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// Custom input field widget with label and static value display
class _CustomInput extends StatelessWidget {
  final String label;
  final String value; // Static displayed value
  const _CustomInput({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: Colors.black38,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: const Color(0xFFF9FAFB),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
        ),
      ],
    );
  }
}

/// Priority level selector dropdown widget
class _PriorityDropdown extends StatelessWidget {
  const _PriorityDropdown();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'PRIORITY',
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: Colors.black38,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.red.shade50,
            border: Border.all(color: Colors.red.shade200),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'High',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.red.shade400,
                ),
              ),
              Icon(Icons.expand_more, color: Colors.red.shade400),
            ],
          ),
        ),
      ],
    );
  }
}

/// Tag widget displaying assigned person with remove option
class _AssigneeTag extends StatelessWidget {
  final String name;
  const _AssigneeTag({required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0xFFF3F4F6)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircleAvatar(radius: 8, backgroundColor: Colors.black12),
          const SizedBox(width: 8),
          Text(
            name,
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 6),
          const Icon(Icons.close, size: 12, color: Colors.black26),
        ],
      ),
    );
  }
}

/// Description editor widget with formatting toolbar
class _DescriptionBox extends StatelessWidget {
  const _DescriptionBox();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFF3F4F6)),
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'The goal is to update the current design system with the latest components and styles. This includes reviewing existing elements and identifying areas for improvement...',
              style: TextStyle(
                fontSize: 12,
                height: 1.5,
                color: Colors.black54,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
            ),
            child: Row(
              children: const [
                Text(
                  'Header',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.arrow_drop_down, size: 18),
                SizedBox(width: 12),
                Text('14px', style: TextStyle(fontSize: 12)),
                Icon(Icons.arrow_drop_down, size: 18),
                Spacer(),
                Icon(Icons.format_bold, size: 18, color: Colors.black26),
                SizedBox(width: 12),
                Icon(Icons.format_italic, size: 18, color: Colors.black26),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
