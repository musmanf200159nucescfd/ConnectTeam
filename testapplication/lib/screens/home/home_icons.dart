import 'package:flutter/material.dart';

class HomeIcons extends StatelessWidget {
  const HomeIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildIconColumn(Icons.task, "Quick Task",
                const Color.fromARGB(255, 33, 243, 138)),
            _buildIconColumn(Icons.access_alarms, "Time Clock",
                const Color.fromARGB(255, 71, 81, 255)),
            _buildIconColumnWithBadge(Icons.contacts, "Directory",
                const Color.fromARGB(255, 197, 136, 228), "New"),
            _buildIconColumn(Icons.schedule, "Job Schedule",
                const Color.fromARGB(255, 116, 113, 9)),
          ],
        ),
      ),
    );
  }

  Widget _buildIconColumn(IconData icon, String label, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(
            icon,
            size: 30,
            color: color,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _buildIconColumnWithBadge(
      IconData icon, String label, Color color, String badgeText) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _buildIconColumn(icon, label, color),
        if (badgeText.isNotEmpty)
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                badgeText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
