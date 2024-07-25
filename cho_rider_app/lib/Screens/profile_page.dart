import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Page"),
        backgroundColor: Colors.yellow.shade600,
      ),
      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              minRadius: 81,
              child: Icon(
                Icons.person,
                size: 72,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Profile',
                      style: TextStyle(fontSize: 36),
                    ),
                    Text(
                      "4.6 ⭐",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(height: 18),
                SettingTilesWidget(
                  title: 'Change Name and other details',
                  icon: Icons.shield_outlined,
                ),
                // SizedBox(height: 9),
                // SettingTilesWidget(
                //   title: 'Contact Us',
                //   icon: Icons.phone,
                // ),
                SizedBox(height: 9),
                SettingTilesWidget(
                  title: 'Log out',
                  icon: Icons.exit_to_app,
                ),
                SizedBox(height: 9),
                SettingTilesWidget(
                  title: 'Delete Account',
                  icon: Icons.exit_to_app,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SettingTilesWidget extends StatelessWidget {
  const SettingTilesWidget({
    super.key,
    this.onTap,
    required this.title,
    this.subtitle = '',
    this.trailing = const Icon(Icons.arrow_forward_ios),
    required this.icon,
  });
  final VoidCallback? onTap;
  final String title, subtitle;
  final Widget? trailing;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFFFD200), width: 1)),
      child: ListTile(
        leading: Icon(
          icon,
          size: 28,
          color: Colors.orangeAccent,
        ),
        title: Text(title),
        trailing: trailing,
      ),
    );
  }
}
