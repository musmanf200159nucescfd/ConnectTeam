import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  final int notificationCount;
  final String? profileImageUrl;
  final String userName;
  final double avatarSize;
  final double namePosition;
  final double notificationPosition;

  const HomeHeader({
    super.key,
    this.notificationCount = 0,
    this.profileImageUrl,
    required this.userName,
    this.avatarSize = 50,
    this.namePosition = 0,
    this.notificationPosition = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: avatarSize,
                  backgroundImage:
                      profileImageUrl != null && profileImageUrl!.isNotEmpty
                          ? NetworkImage(profileImageUrl!)
                          : null,
                  child: profileImageUrl == null || profileImageUrl!.isEmpty
                      ? ClipOval(
                          child: Container(
                            color: const Color.fromARGB(255, 156, 185, 123),
                            width: avatarSize * 2,
                            height: avatarSize * 2,
                            alignment: Alignment.center,
                            child: Text(
                              _getInitials(userName),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                              ),
                            ),
                          ),
                        )
                      : null,
                ),
                const SizedBox(height: 8),
                Text(
                  'Good afternoon, ${userName.split(" ").first} 👋',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          // Position the notification icon
          Positioned(
            right: notificationPosition,
            top: 25,
            child: _buildNotificationIcon(),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationIcon() {
    return Stack(
      children: [
        IconButton(
          icon: const Icon(
            Icons.notifications_outlined,
            size: 32,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        if (notificationCount > 0) ...[
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              constraints: const BoxConstraints(
                minWidth: 25,
                minHeight: 25,
              ),
              child: Text(
                '$notificationCount',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ],
    );
  }

  String _getInitials(String name) {
    List<String> parts = name.split(' ');
    if (parts.length == 1) {
      return parts[0][0].toUpperCase();
    } else {
      return '${parts[0][0].toUpperCase()}${parts[1][0].toUpperCase()}';
    }
  }
}
