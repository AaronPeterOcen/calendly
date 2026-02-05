import 'package:flutter/material.dart';
import 'shared_components.dart';

/// Panel for configuring session timeout and app usage limits
class SessionLifetimePanel extends StatelessWidget {
  const SessionLifetimePanel({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Session Lifetime',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Configure session timeout by setting the idle session\ntimeout or maximum session lifetime.',
                      style: TextStyle(color: Colors.black38, fontSize: 12),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.close, size: 20, color: Colors.black26),
            ],
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              const Icon(Icons.info_outline, size: 16, color: Colors.black26),
              const SizedBox(width: 8),
              const Text(
                'Reminder Using App',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(flex: 2, child: _TimeInput(value: '4')),
              const SizedBox(width: 12),
              Expanded(child: _UnitDropdown()),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'Set maximum time using each apps for a day',
            style: TextStyle(fontSize: 12, color: Colors.black54),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              _CustomSwitch(active: true),
              const SizedBox(width: 12),
              const Text(
                'Set also for reminder specific app',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'APP',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Colors.black38,
            ),
          ),
          const SizedBox(height: 12),
          _CustomInput(label: '', value: 'Instagram'),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFF3F4F6)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Text(
                '+ Add other apps',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
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
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    // borderRadius: BorderRadius.circular(8),
                  ),
                  onPressed: () {},
                  child: const Text('Save Changes'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Input field for displaying time values
class _TimeInput extends StatelessWidget {
  final String value; // Time value to display
  const _TimeInput({required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFF3F4F6)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        value,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
      ),
    );
  }
}

/// Dropdown selector for time unit (Hour, Day, etc.)
class _UnitDropdown extends StatelessWidget {
  const _UnitDropdown();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFF3F4F6)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'Hour',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
          Icon(Icons.unfold_more, size: 18, color: Colors.black54),
        ],
      ),
    );
  }
}

/// Custom input field with optional label
class _CustomInput extends StatelessWidget {
  final String label;
  final String value;
  const _CustomInput({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty)
          Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Colors.black38,
            ),
          ),
        if (label.isNotEmpty) const SizedBox(height: 8),
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

/// Custom toggle switch widget
class _CustomSwitch extends StatelessWidget {
  final bool active; // Current toggle state
  const _CustomSwitch({required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 22,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: active ? Colors.black : Colors.black12,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Align(
        alignment: active ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          width: 16,
          height: 16,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
