import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lexora/features/user/presentation/bloc/user_bloc.dart';
import 'package:lexora/features/user/presentation/bloc/user_event.dart';
import 'package:lexora/features/user/presentation/bloc/user_state.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({super.key});

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  @override
  void initState() {
    super.initState();
    // Fetch user info when drawer is opened
    context.read<UserBloc>().add(const UserEvent.fetchUserInfo());
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: SafeArea(
        child: Column(
          children: [
            // Search bar and close button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2A2A2A),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: Colors.white.withValues(alpha: 0.6),
                            size: 24,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextField(
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Search',
                                hintStyle: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.4),
                                  fontSize: 16,
                                ),
                                border: InputBorder.none,
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2A2A2A),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: const Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Menu items
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildMenuItem(
                    icon: Icons.edit_outlined,
                    label: 'New chat',
                  ),
                  const SizedBox(height: 8),
                  _buildMenuItem(
                    icon: Icons.photo_library_outlined,
                    label: 'Library',
                  ),
                  const SizedBox(height: 24),
                  _buildMenuItem(
                    icon: Icons.create_new_folder_outlined,
                    label: 'New project',
                  ),
                  const SizedBox(height: 8),
                  _buildMenuItem(
                    icon: Icons.folder_outlined,
                    label: 'Marriage case',
                  ),
                  const SizedBox(height: 24),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Divider(color: Color(0xFF2A2A2A), height: 1),
                  ),
                  _buildChatHistoryItem('Find book source'),
                  _buildChatHistoryItem('Interview preparation guide'),
                  _buildChatHistoryItem('New chat'),
                  _buildChatHistoryItem('Paraphrasing message to lead'),
                  _buildChatHistoryItem('Goodbye phrases in Japanese'),
                  _buildChatHistoryItem('Japanese grammar help'),
                  _buildChatHistoryItem('Synonyms for dark jokes'),
                ],
              ),
            ),
            // User profile at bottom
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Colors.white.withValues(alpha: 0.1),
                        width: 1,
                      ),
                    ),
                  ),
                  child: state.when(
                    initial: () => _buildUserProfile('Loading...', 'L'),
                    loading: () => _buildUserProfile('Loading...', 'L'),
                    loaded: (user) => _buildUserProfile(
                      user.email,
                      _getInitials(user.email),
                    ),
                    error: (failure) => _buildUserProfile(
                      'Error loading user',
                      'E',
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String label,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 24,
          ),
          const SizedBox(width: 16),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatHistoryItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white.withValues(alpha: 0.8),
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildUserProfile(String email, String initials) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFF00BFA5),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              initials,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            email,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Icon(
          Icons.keyboard_arrow_down,
          color: Colors.white.withValues(alpha: 0.6),
          size: 24,
        ),
      ],
    );
  }

  String _getInitials(String email) {
    // Extract username from email and get first 2 characters
    final username = email.split('@').first;
    if (username.isEmpty) return 'U';
    if (username.length == 1) return username.toUpperCase();
    return username.substring(0, 2).toUpperCase();
  }
}
