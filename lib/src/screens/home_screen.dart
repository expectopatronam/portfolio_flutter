import 'package:flutter/material.dart';
import 'package:portfolio_flutter/src/screens/contact_page.dart';
import 'package:portfolio_flutter/src/screens/landing_page.dart';

import 'project_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int page = _pageController.page?.round() ?? 0;
      if (page != _currentPage) {
        setState(() {
          _currentPage = page;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            itemCount: 4,
            itemBuilder: (context, index) {
              return _buildPage(index);
            },
          ),
          // Page indicators
          Positioned(
            right: 24,
            top: 0,
            bottom: 0,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(4, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPage == index
                          ? const Color(0xFF6366F1)
                          : const Color(0xFF6366F1).withValues(alpha: 0.3),
                      boxShadow: _currentPage == index
                          ? [
                              BoxShadow(
                                color: const Color(0xFF6366F1).withValues(alpha: 0.5),
                                blurRadius: 8,
                                spreadRadius: 1,
                              ),
                            ]
                          : null,
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return LandingPage();
      case 1:
        return ProjectPage(
          'Project 1',
          'E-Commerce Mobile App',
          'Built with Flutter and Firebase. Features include real-time inventory, secure payments, and push notifications.',
          const Color(0xFF6366F1), // Indigo
          ['Flutter', 'Firebase', 'Stripe API'],
        );
      case 2:
        return ProjectPage(
          'Project 2',
          'Social Media Dashboard',
          'A responsive web dashboard for analytics. Includes data visualization, user management, and reporting features.',
          const Color(0xFF10B981), // Emerald
          ['React', 'Node.js', 'MongoDB'],
        );
      case 3:
        return ContactPage();
      default:
        return Container();
    }
  }

  
}