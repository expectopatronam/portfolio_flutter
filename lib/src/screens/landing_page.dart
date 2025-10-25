

import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
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
}