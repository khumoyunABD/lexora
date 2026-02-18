import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lexora/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:lexora/features/auth/presentation/bloc/auth_event.dart';
import 'package:lexora/features/auth/presentation/bloc/auth_state.dart';
import 'package:lexora/features/session/presentation/bloc/session_bloc.dart';
import 'package:lexora/features/session/presentation/bloc/session_event.dart';
import 'package:lexora/features/session/presentation/bloc/session_state.dart';
import 'package:lexora/features/user/presentation/bloc/user_bloc.dart';
import 'package:lexora/features/user/presentation/bloc/user_event.dart';
import 'package:lexora/features/user/presentation/bloc/user_state.dart';
import 'package:lexora/utils/helpers/router.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({super.key});

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  bool _isUserMenuExpanded = false;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    // Fetch user info when drawer is opened
    context.read<UserBloc>().add(const UserEvent.fetchUserInfo());
    // Fetch sessions when drawer is opened
    context.read<SessionBloc>().add(const SessionEvent.getSessions());
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _searchQuery = _searchController.text.toLowerCase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          unauthenticated: () {
            // Navigate to login page
            context.go(PagePath.login);
          },
          orElse: () {},
        );
      },
      child: Drawer(
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
                                controller: _searchController,
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
                                  suffixIcon: _searchQuery.isNotEmpty
                                      ? GestureDetector(
                                          onTap: () => _searchController.clear(),
                                          child: Icon(
                                            Icons.close,
                                            color: Colors.white.withValues(alpha: 0.6),
                                            size: 20,
                                          ),
                                        )
                                      : null,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // GestureDetector(
                    //   onTap: () => Navigator.pop(context),
                    //   child: Container(
                    //     width: 48,
                    //     height: 48,
                    //     decoration: BoxDecoration(
                    //       color: const Color(0xFF2A2A2A),
                    //       borderRadius: BorderRadius.circular(24),
                    //     ),
                    //     child: const Icon(
                    //       Icons.menu,
                    //       color: Colors.white,
                    //       size: 24,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              // Menu items
              Expanded(
                child: BlocBuilder<SessionBloc, SessionState>(
                  builder: (context, state) {
                    return ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      children: [
                        _buildMenuItem(
                          icon: Icons.edit_outlined,
                          label: 'New chat',
                          onTap: () {
                            Navigator.pop(context);
                            context.go(PagePath.home);
                          },
                        ),

                        // SizedBox(height: 8.h),
                        // _buildMenuItem(
                        //   icon: Icons.create_new_folder_outlined,
                        //   label: 'New project',
                        // ),
                        SizedBox(height: 16.h),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Divider(color: Color(0xFF2A2A2A), height: 1),
                        ),
                        // Session history
                        state.when(
                          initial: () => const SizedBox.shrink(),
                          loading: () => _buildLoadingState(),
                          sessionsLoaded: (sessions) {
                            if (sessions.isEmpty) {
                              return _buildEmptyState();
                            }
                            final filteredSessions = _searchQuery.isEmpty
                                ? sessions
                                : sessions
                                    .where((session) => session.name
                                        .toLowerCase()
                                        .contains(_searchQuery))
                                    .toList();
                            if (filteredSessions.isEmpty) {
                              return _buildNoResultsState();
                            }
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: filteredSessions
                                  .map((session) => _buildChatHistoryItem(
                                      session.name, session.id))
                                  .toList(),
                            );
                          },
                          sessionLoaded: (_) => const SizedBox.shrink(),
                          sessionCreated: (_) => const SizedBox.shrink(),
                          sessionUpdated: (_) => const SizedBox.shrink(),
                          sessionDeleted: () => const SizedBox.shrink(),
                          sessionEnded: (_) => const SizedBox.shrink(),
                          error: (failure) => _buildErrorState(
                              failure.errorMessage ?? 'Unknown error'),
                        ),
                      ],
                    );
                  },
                ),
              ),
              // User profile at bottom
              BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
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
                      ),
                      // Logout button that appears when menu is expanded
                      if (_isUserMenuExpanded)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: _buildMenuItem(
                            icon: Icons.logout,
                            iconAndLabelColor: Colors.red,
                            label: 'Logout',
                            onTap: () {
                              _handleLogout(context);
                            },
                          ),
                        ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String label,
    VoidCallback? onTap,
    Color? iconAndLabelColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(
              icon,
              color: iconAndLabelColor ?? Colors.white,
              size: 24,
            ),
            const SizedBox(width: 16),
            Text(
              label,
              style: TextStyle(
                color: iconAndLabelColor ?? Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChatHistoryItem(String title, String id) {
    return GestureDetector(
      onTap: () {
        // Close the drawer
        Navigator.pop(context);
        // Navigate with session ID as query parameter
        context.go('${PagePath.home}?id=$id');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.8),
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget _buildUserProfile(String email, String initials) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isUserMenuExpanded = !_isUserMenuExpanded;
        });
      },
      child: Row(
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
          AnimatedRotation(
            turns: _isUserMenuExpanded ? 0.5 : 0,
            duration: const Duration(milliseconds: 200),
            child: Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white.withValues(alpha: 0.6),
              size: 24,
            ),
          ),
        ],
      ),
    );
  }

  void _handleLogout(BuildContext context) {
    // Show confirmation dialog
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: const Color(0xFF1E1E1E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text(
          'Logout',
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          'Are you sure you want to logout?',
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.white70),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              // Dispatch logout event
              context.read<AuthBloc>().add(const AuthEvent.logout());
            },
            child: const Text(
              'Logout',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  String _getInitials(String email) {
    // Extract username from email and get first 2 characters
    final username = email.split('@').first;
    if (username.isEmpty) return 'U';
    if (username.length == 1) return username.toUpperCase();
    return username.substring(0, 2).toUpperCase();
  }

  Widget _buildLoadingState() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Center(
        child: SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(
              Colors.white.withValues(alpha: 0.6),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Text(
        'No sessions yet',
        style: TextStyle(
          color: Colors.white.withValues(alpha: 0.5),
          fontSize: 14,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }

  Widget _buildNoResultsState() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Text(
        'No matching sessions',
        style: TextStyle(
          color: Colors.white.withValues(alpha: 0.5),
          fontSize: 14,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }

  Widget _buildErrorState(String message) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Text(
        'Error loading sessions',
        style: TextStyle(
          color: Colors.red.withValues(alpha: 0.7),
          fontSize: 14,
        ),
      ),
    );
  }
}
