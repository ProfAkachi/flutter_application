import 'package:career_connect_app/constant/theme/external_colors.dart';
import 'package:flutter/material.dart';
import 'package:career_connect_app/features/screens/profile/profile_screen.dart';
import 'package:career_connect_app/features/screens/jobs/job_listings.dart';
import 'package:career_connect_app/features/screens/auth/auth.dart';
import 'package:career_connect_app/features/screens/jobs/saved_jobs.dart';
import 'package:career_connect_app/features/screens/app_hist/application_history.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  Set<Job> favoriteJobs = {};

  void toggleFavorite(Job job) {
    setState(() {
      if (favoriteJobs.contains(job)) {
        favoriteJobs.remove(job);
      } else {
        favoriteJobs.add(job);
      }
    });
  }

  // final List<Widget> _screens = const [
  //   JobsScreen(),
  //   Center(child: Text("Applied Screen")),
  //   ProfileScreen(),
  //   // Center(child: Text("Settings Screen")),
  //   AuthScreen(),
  //   SavedJobsScreen(savedJobs: favoriteJobs.toList())
  //   // SignupWidget()

  // ];

  @override
  Widget build(BuildContext context) {
    final screens = [
      JobsScreen(favoriteJobs: favoriteJobs, onFavoriteToggle: toggleFavorite),

      const ApplicationHistoryScreen(),

      const ProfileScreen(),

      const AuthScreen(),

      SavedJobsScreen(
        savedJobs: favoriteJobs.toList(),
        onBrowseJobs: () {
          setState(() {
            _currentIndex = 0;
          });
        },),

      
    ];
    return Scaffold(
      backgroundColor: ExternalColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const _TopBar(),
            Expanded(child: screens[_currentIndex]),
          ],
        ),
      ),

      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        indicatorColor: ExternalColors.indicatorColor,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.work_outline),
            selectedIcon: Icon(Icons.work),
            label: 'Jobs',
          ),
          NavigationDestination(
            icon: Icon(Icons.assignment_outlined),
            selectedIcon: Icon(Icons.assignment),
            label: 'Applied',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
          NavigationDestination(
            icon: Icon(Icons.login_outlined),
            selectedIcon: Icon(Icons.login),
            label: 'Login',
          ),
          NavigationDestination(
            icon: Icon(Icons.bookmark_border),
            selectedIcon: Icon(Icons.bookmark),
            label: 'Saved',
          ),
        ],
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child:Center(
  child: Container(
    width: 30,
    height: 30,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 10,
          offset: Offset(0, 4),
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        'assets/images/logo/Minimalist Cobalt and Teal Logo.png',
        fit: BoxFit.contain,
      ),
    ),
  ),
),
    );
  }
}
