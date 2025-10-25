import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> with SingleTickerProviderStateMixin {
  Offset _mousePosition = const Offset(0.5, 0.5);
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _updateMousePosition(PointerEvent details, Size size) {
    setState(() {
      _mousePosition = Offset(
        details.position.dx / size.width,
        details.position.dy / size.height,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        final size = MediaQuery.of(context).size;
        _updateMousePosition(event, size);
      },
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment(
                  _mousePosition.dx * 2 - 1,
                  _mousePosition.dy * 2 - 1,
                ),
                radius: 1.5,
                colors: [
                  Color.lerp(
                    const Color(0xFF1A1D3F),
                    const Color(0xFF6366F1),
                    0.15,
                  )!,
                  const Color(0xFF0A0E27),
                  const Color(0xFF0F172A),
                ],
                stops: const [0.0, 0.5, 1.0],
              ),
            ),
            child: child,
          );
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Main hero text
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [
                      Color(0xFF6366F1),
                      Color(0xFF8B5CF6),
                      Color(0xFFEC4899),
                    ],
                  ).createShader(bounds),
                  child: const Text(
                    'Javid Akeel',
                    style: TextStyle(
                      fontSize: 56.0,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -2,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),

                // Subtitle with modern styling
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: const Color(0xFF6366F1).withValues(alpha: 0.3),
                      width: 1,
                    ),
                    color: const Color(0xFF6366F1).withValues(alpha: 0.1),
                  ),
                  child: const Text(
                    'FullStack Engineer',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Color(0xFFA5B4FC),
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                const SizedBox(height: 32.0),

                // Hero description
                Container(
                  constraints: const BoxConstraints(maxWidth: 700),
                  child: const Text(
                    'Crafting exceptional digital experiences through elegant code.\nBuilding the future, one line at a time.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Color(0xFF94A3B8),
                      height: 1.6,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                const SizedBox(height: 40.0),

                // Social icons with modern hover effect
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _ModernIconButton(
                      icon: Icons.code,
                      onPressed: () {},
                    ),
                    const SizedBox(width: 16),
                    _ModernIconButton(
                      icon: Icons.link,
                      onPressed: () {},
                    ),
                    const SizedBox(width: 16),
                    _ModernIconButton(
                      icon: Icons.email,
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 48.0),

                // Scroll indicator
                Column(
                  children: [
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: const Color(0xFF6366F1).withValues(alpha: 0.6),
                      size: 28,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'View my work',
                      style: TextStyle(
                        color: const Color(0xFF6366F1).withValues(alpha: 0.6),
                        fontSize: 13,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ModernIconButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _ModernIconButton({
    required this.icon,
    required this.onPressed,
  });

  @override
  State<_ModernIconButton> createState() => _ModernIconButtonState();
}

class _ModernIconButtonState extends State<_ModernIconButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: _isHovered
                ? const Color(0xFF6366F1)
                : const Color(0xFF6366F1).withValues(alpha: 0.3),
            width: 2,
          ),
          gradient: _isHovered
              ? const LinearGradient(
                  colors: [
                    Color(0xFF6366F1),
                    Color(0xFF8B5CF6),
                  ],
                )
              : null,
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: const Color(0xFF6366F1).withValues(alpha: 0.4),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ]
              : null,
        ),
        child: IconButton(
          icon: Icon(widget.icon),
          iconSize: 28,
          color: _isHovered ? Colors.white : const Color(0xFF6366F1),
          onPressed: widget.onPressed,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
      ),
    );
  }
}
