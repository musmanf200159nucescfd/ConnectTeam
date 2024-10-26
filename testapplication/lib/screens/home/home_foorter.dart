import 'package:flutter/material.dart';

class HomeFooter extends StatelessWidget {
  const HomeFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
      ),
      child: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildFooterButton(Icons.home_outlined, 'Feed', context),
            _buildFooterButton(Icons.widgets_outlined, 'Assets', context),
            _buildChatButton(context), // Use the chat button method
            _buildFooterButton(Icons.person_2_outlined, 'Profile', context),
          ],
        ),
      ),
    );
  }

  Widget _buildFooterButton(IconData icon, String label, BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: const Color.fromARGB(255, 156, 146, 146)),
        Text(
          label,
          style: const TextStyle(
            color: Color.fromARGB(255, 156, 146, 146),
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  // Method to create the chat button with a notification badge
  Widget _buildChatButton(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        _buildFooterButton(Icons.chat_outlined, 'Chat', context),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(2.0),
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            constraints: const BoxConstraints(
              minWidth: 18,
              minHeight: 18,
            ),
            child: const Text(
              '3',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
