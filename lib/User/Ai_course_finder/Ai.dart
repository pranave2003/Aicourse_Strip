import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';

class AIGenerationScreen extends StatefulWidget {
  final VoidCallback onGenerationComplete;

  const AIGenerationScreen({Key? key, required this.onGenerationComplete})
      : super(key: key);

  @override
  State<AIGenerationScreen> createState() => _AIGenerationScreenState();
}

class _AIGenerationScreenState extends State<AIGenerationScreen>
    with TickerProviderStateMixin {
  late AnimationController _pulseController;
  late AnimationController _rotationController;
  late AnimationController _waveController;
  late Animation<double> _pulseAnimation;
  late Animation<double> _opacityAnimation;

  // For gradient animation
  late AnimationController _gradientController;
  late Animation<Color?> _gradientAnimation1;
  late Animation<Color?> _gradientAnimation2;
  late Animation<Color?> _gradientAnimation3;

  // For text animation
  late AnimationController _textController;
  late Animation<double> _textOpacityAnimation;

  // Timer for navigation
  Timer? _navigationTimer;

  // Dots animation
  String _loadingText = "Generating";
  Timer? _dotsTimer;
  int _dotCount = 0;

  @override
  void initState() {
    super.initState();

    // Pulse animation
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _opacityAnimation = Tween<double>(begin: 0.3, end: 0.8).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    // Rotation animation
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();

    // Wave animation
    _waveController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();

    // Gradient animation
    _gradientController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();

    _gradientAnimation1 = ColorTween(
      begin: const Color(0xFF6A11CB),
      end: const Color(0xFF2575FC),
    ).animate(
      CurvedAnimation(
        parent: _gradientController,
        curve: const Interval(0.0, 0.33, curve: Curves.easeInOut),
      ),
    );

    _gradientAnimation2 = ColorTween(
      begin: const Color(0xFF2575FC),
      end: const Color(0xFF6A11CB),
    ).animate(
      CurvedAnimation(
        parent: _gradientController,
        curve: const Interval(0.33, 0.66, curve: Curves.easeInOut),
      ),
    );

    _gradientAnimation3 = ColorTween(
      begin: const Color(0xFF6A11CB),
      end: const Color(0xFF2575FC),
    ).animate(
      CurvedAnimation(
        parent: _gradientController,
        curve: const Interval(0.66, 1.0, curve: Curves.easeInOut),
      ),
    );

    // Text animation
    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);

    _textOpacityAnimation = Tween<double>(begin: 0.6, end: 1.0).animate(
      CurvedAnimation(parent: _textController, curve: Curves.easeInOut),
    );

    // Dots animation timer
    _dotsTimer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        _dotCount = (_dotCount + 1) % 4;
        _loadingText = "Generating" + "." * _dotCount;
      });
    });

    // Navigation timer
    _navigationTimer = Timer(const Duration(seconds: 10), () {
      widget.onGenerationComplete();
    });
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _rotationController.dispose();
    _waveController.dispose();
    _gradientController.dispose();
    _textController.dispose();
    _navigationTimer?.cancel();
    _dotsTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: Listenable.merge([
          _pulseController,
          _rotationController,
          _waveController,
          _gradientController,
          _textController,
        ]),
        builder: (context, child) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  _gradientAnimation1.value!,
                  _gradientAnimation2.value!,
                  _gradientAnimation3.value!,
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // AI Animation
                Stack(
                  alignment: Alignment.center,
                  children: [
                    // Outer rotating circles
                    Transform.rotate(
                      angle: _rotationController.value * 2 * math.pi,
                      child: CustomPaint(
                        painter: CircleWavePainter(
                          wavePhase: _waveController.value,
                          opacity: _opacityAnimation.value * 0.5,
                        ),
                        size: const Size(280, 280),
                      ),
                    ),

                    // Pulsing circle
                    Transform.scale(
                      scale: _pulseAnimation.value,
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [
                              Colors.white.withOpacity(0.8),
                              Colors.white.withOpacity(0.1),
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.5),
                              blurRadius: 30,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Inner animated circle
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: SweepGradient(
                          colors: [
                            Colors.white.withOpacity(0.1),
                            Colors.white.withOpacity(0.8),
                            Colors.white.withOpacity(0.1),
                          ],
                          transform: const GradientRotation(math.pi / 4),
                        ),
                      ),
                      child: Center(
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.2),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.5),
                                blurRadius: 20,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Icon(
                              Icons.auto_awesome,
                              color: Colors.white,
                              size: 40 * _pulseAnimation.value,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 60),

                // Loading text
                Opacity(
                  opacity: _textOpacityAnimation.value,
                  child: Text(
                    _loadingText,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Subtitle
                Text(
                  "Finding the perfect AI courses for you",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 40),

                // Progress indicator
                SizedBox(
                  width: 200,
                  child: LinearProgressIndicator(
                    value: null, // Indeterminate
                    backgroundColor: Colors.white.withOpacity(0.2),
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.white.withOpacity(0.8),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Custom painter for wave effect
class CircleWavePainter extends CustomPainter {
  final double wavePhase;
  final double opacity;

  CircleWavePainter({required this.wavePhase, required this.opacity});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2;

    // Draw multiple circles with varying radii
    for (int i = 0; i < 8; i++) {
      final waveOffset =
          math.sin(wavePhase * 2 * math.pi + i * math.pi / 4) * 10;
      final circleRadius = radius - 20 + waveOffset;

      final paint = Paint()
        ..color = Colors.white.withOpacity(opacity * (1 - i / 8))
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2;

      canvas.drawCircle(center, circleRadius, paint);
    }

    // Draw connecting lines
    final linePaint = Paint()
      ..color = Colors.white.withOpacity(opacity * 0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    for (int i = 0; i < 12; i++) {
      final angle = i * math.pi / 6;
      final x = center.dx + radius * math.cos(angle);
      final y = center.dy + radius * math.sin(angle);

      canvas.drawLine(center, Offset(x, y), linePaint);
    }
  }

  @override
  bool shouldRepaint(CircleWavePainter oldDelegate) {
    return oldDelegate.wavePhase != wavePhase || oldDelegate.opacity != opacity;
  }
}
