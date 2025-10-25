import 'package:flutter/material.dart';

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
                          ? Colors.black
                          : Colors.grey.shade400,
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
        return _buildLandingPage();
      case 1:
        return _buildProjectPage(
          'Project 1',
          'E-Commerce Mobile App',
          'Built with Flutter and Firebase. Features include real-time inventory, secure payments, and push notifications.',
          const Color(0xFF6366F1), // Indigo
          ['Flutter', 'Firebase', 'Stripe API'],
        );
      case 2:
        return _buildProjectPage(
          'Project 2',
          'Social Media Dashboard',
          'A responsive web dashboard for analytics. Includes data visualization, user management, and reporting features.',
          const Color(0xFF10B981), // Emerald
          ['React', 'Node.js', 'MongoDB'],
        );
      case 3:
        return _buildContactPage();
      default:
        return Container();
    }
  }

  Widget _buildLandingPage() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white,
            Colors.blue.shade50,
          ],
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue.shade100,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.3),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.person,
                  size: 60,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 32.0),
              const Text(
                'Javid Akeel',
                style: TextStyle(
                  fontSize: 56.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1,
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                'Software Engineer',
                style: TextStyle(
                  fontSize: 28.0,
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 48.0),
              Container(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Text(
                  'I build beautiful and functional mobile and web applications that solve real-world problems.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.grey.shade600,
                    height: 1.6,
                  ),
                ),
              ),
              const SizedBox(height: 48.0),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.code),
                    iconSize: 32,
                    color: Colors.blue,
                    onPressed: () {},
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    icon: const Icon(Icons.link),
                    iconSize: 32,
                    color: Colors.blue,
                    onPressed: () {},
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    icon: const Icon(Icons.email),
                    iconSize: 32,
                    color: Colors.blue,
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 64.0),
              Column(
                children: [
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey.shade400,
                  ),
                  Text(
                    'Scroll to explore',
                    style: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProjectPage(
    String projectNumber,
    String title,
    String description,
    Color color,
    List<String> technologies,
  ) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color,
            color.withOpacity(0.7),
          ],
        ),
      ),
      child: Stack(
        children: [
          // Animated background circles
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.05),
              ),
            ),
          ),
          Positioned(
            bottom: -150,
            left: -150,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.05),
              ),
            ),
          ),
          // Main content
          Center(
            child: Padding(
              padding: const EdgeInsets.all(64.0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  bool isWideScreen = constraints.maxWidth > 800;
                  
                  if (isWideScreen) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: _buildProjectImage(),
                        ),
                        const SizedBox(width: 64.0),
                        Expanded(
                          flex: 3,
                          child: _buildProjectInfo(projectNumber, title, description, technologies),
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildProjectInfo(projectNumber, title, description, technologies),
                        const SizedBox(height: 32.0),
                        _buildProjectImage(),
                      ],
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectImage() {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Transform.scale(
          scale: 0.8 + (0.2 * value),
          child: Opacity(
            opacity: value,
            child: Container(
              constraints: const BoxConstraints(maxWidth: 450, maxHeight: 350),
              child: Stack(
                children: [
                  // Shadow layer
                  Positioned(
                    top: 20,
                    left: 20,
                    right: -20,
                    bottom: -20,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.black.withOpacity(0.2),
                            Colors.black.withOpacity(0.4),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Main image container
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 40,
                          spreadRadius: 5,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Stack(
                        children: [
                          // Placeholder content
                          const Center(
                            child: Icon(
                              Icons.devices,
                              size: 100,
                              color: Colors.grey,
                            ),
                          ),
                          // Glassmorphism overlay
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.white.withOpacity(0.0),
                                    Colors.white.withOpacity(0.9),
                                  ],
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _buildImageBadge(Icons.star, '4.8'),
                                  const SizedBox(width: 16),
                                  _buildImageBadge(Icons.download, '10K+'),
                                  const SizedBox(width: 16),
                                  _buildImageBadge(Icons.thumb_up, '500+'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Floating accent elements
                  Positioned(
                    top: -10,
                    right: -10,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.auto_awesome,
                        color: Colors.amber,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildImageBadge(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: Colors.grey.shade700),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectInfo(
    String projectNumber,
    String title,
    String description,
    List<String> technologies,
  ) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 30 * (1 - value)),
          child: Opacity(
            opacity: value,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Project number with decorative line
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 2,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.white,
                            Colors.white.withOpacity(0),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      projectNumber.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24.0),
                // Title with shadow
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 48.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    height: 1.1,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: const Offset(2, 2),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24.0),
                // Description in a card
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    description,
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      height: 1.7,
                    ),
                  ),
                ),
                const SizedBox(height: 32.0),
                // Technologies with icons
                Text(
                  'TECH STACK',
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.white.withOpacity(0.8),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 16.0),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: technologies.map((tech) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0.25),
                            Colors.white.withOpacity(0.15),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.4),
                          width: 1.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            tech,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 32.0),
                // View Project button
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.launch),
                  label: const Text('View Project'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black87,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 8,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildContactPage() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.amber.shade400,
            Colors.orange.shade300,
          ],
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.email_outlined,
                size: 80,
                color: Colors.white,
              ),
              const SizedBox(height: 32.0),
              const Text(
                'Let\'s Work Together',
                style: TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              Text(
                'Have a project in mind? Let\'s create something amazing together.',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white.withOpacity(0.9),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48.0),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    _buildContactItem(Icons.email, 'javid.akeel@example.com'),
                    const SizedBox(height: 16.0),
                    _buildContactItem(Icons.business, 'linkedin.com/in/javidakeel'),
                  ],
                ),
              ),
              const SizedBox(height: 48.0),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.orange.shade700,
                  padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 8,
                ),
                child: const Text(
                  'Hire Me',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 24,
        ),
        const SizedBox(width: 16),
        Text(
          text,
          style: const TextStyle(
            fontSize: 18.0,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}