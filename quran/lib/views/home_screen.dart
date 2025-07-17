import 'package:flutter/material.dart';
import 'package:quran/data/ayat_sour_data.dart';
import 'dart:ui';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  bool _isDarkMode = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isDarkMode ? const Color(0xFF0A0A0A) : Colors.grey[50],
      body: Container(
        decoration: BoxDecoration(
          gradient: _isDarkMode 
            ? const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF0A0A0A),
                  Color(0xFF1A1A1A),
                  Color(0xFF0F0F0F),
                ],
              )
            : const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFF8F9FA),
                  Color(0xFFFFFFFF),
                  Color(0xFFF5F5F5),
                ],
              ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Modern Header
              FadeTransition(
                opacity: _fadeAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        // Top Bar
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Modern Islamic Symbol
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF6366F1),
                                    Color(0xFF8B5CF6),
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFF6366F1).withOpacity(0.3),
                                    blurRadius: 20,
                                    offset: const Offset(0, 8),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.mosque,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                            // Theme Toggle
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: _isDarkMode 
                                  ? Colors.white.withOpacity(0.1)
                                  : Colors.black.withOpacity(0.05),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isDarkMode = !_isDarkMode;
                                  });
                                },
                                icon: Icon(
                                  _isDarkMode ? Icons.light_mode : Icons.dark_mode,
                                  color: _isDarkMode ? Colors.white : Colors.black87,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        // Title Section
                        Text(
                          'القرآن الكريم',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w800,
                            color: _isDarkMode ? Colors.white : Colors.black87,
                            letterSpacing: -1,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: _isDarkMode 
                              ? Colors.white.withOpacity(0.1)
                              : Colors.black.withOpacity(0.05),
                          ),
                          child: Text(
                            'اقرأ باسم ربك الذي خلق',
                            style: TextStyle(
                              fontSize: 16,
                              color: _isDarkMode 
                                ? Colors.white.withOpacity(0.7)
                                : Colors.black54,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        // Stats Card
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            gradient: LinearGradient(
                              colors: _isDarkMode 
                                ? [
                                    Colors.white.withOpacity(0.1),
                                    Colors.white.withOpacity(0.05),
                                  ]
                                : [
                                    Colors.black.withOpacity(0.05),
                                    Colors.black.withOpacity(0.02),
                                  ],
                            ),
                            border: Border.all(
                              color: _isDarkMode 
                                ? Colors.white.withOpacity(0.1)
                                : Colors.black.withOpacity(0.05),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _buildStatItem('114', 'سورة', Icons.menu_book),
                              Container(
                                width: 1,
                                height: 40,
                                color: _isDarkMode 
                                  ? Colors.white.withOpacity(0.1)
                                  : Colors.black.withOpacity(0.1),
                              ),
                              _buildStatItem('6236', 'آية', Icons.format_quote),
                              Container(
                                width: 1,
                                height: 40,
                                color: _isDarkMode 
                                  ? Colors.white.withOpacity(0.1)
                                  : Colors.black.withOpacity(0.1),
                              ),
                              _buildStatItem('30', 'جزء', Icons.bookmark),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Surahs List
              Expanded(
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    child: ListView.builder(
                      padding: const EdgeInsets.only(top: 8),
                      itemCount: sour.length,
                      itemBuilder: (context, index) {
                        return AnimatedBuilder(
                          animation: _controller,
                          builder: (context, child) {
                            final animationValue = Curves.easeOutCubic.transform(
                              (_controller.value - (index * 0.05)).clamp(0.0, 1.0),
                            );
                            return Transform.translate(
                              offset: Offset(0, 30 * (1 - animationValue)),
                              child: Opacity(
                                opacity: animationValue,
                                child: ModernSurahCard(
                                  surah: sour[index],
                                  index: index,
                                  isDarkMode: _isDarkMode,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(String number, String label, IconData icon) {
    return Column(
      children: [
        Icon(
          icon,
          color: const Color(0xFF6366F1),
          size: 20,
        ),
        const SizedBox(height: 8),
        Text(
          number,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: _isDarkMode ? Colors.white : Colors.black87,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: _isDarkMode 
              ? Colors.white.withOpacity(0.6)
              : Colors.black54,
          ),
        ),
      ],
    );
  }
}

class ModernSurahCard extends StatefulWidget {
  final AyatSour surah;
  final int index;
  final bool isDarkMode;

  const ModernSurahCard({
    super.key,
    required this.surah,
    required this.index,
    required this.isDarkMode,
  });

  @override
  State<ModernSurahCard> createState() => _ModernSurahCardState();
}

class _ModernSurahCardState extends State<ModernSurahCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    ModernSurahDetailPage(surah: widget.surah),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0, 0.1),
                        end: Offset.zero,
                      ).animate(CurvedAnimation(
                        parent: animation,
                        curve: Curves.easeOutCubic,
                      )),
                      child: child,
                    ),
                  );
                },
              ),
            );
          },
          onHover: (hovering) {
            setState(() {
              _isHovered = hovering;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: widget.isDarkMode
                ? _isHovered 
                  ? Colors.white.withOpacity(0.08)
                  : Colors.white.withOpacity(0.05)
                : _isHovered
                  ? Colors.black.withOpacity(0.04)
                  : Colors.white,
              border: Border.all(
                color: widget.isDarkMode
                  ? Colors.white.withOpacity(0.1)
                  : Colors.black.withOpacity(0.05),
              ),
              boxShadow: [
                BoxShadow(
                  color: widget.isDarkMode
                    ? Colors.black.withOpacity(0.3)
                    : Colors.black.withOpacity(0.05),
                  blurRadius: _isHovered ? 20 : 10,
                  offset: Offset(0, _isHovered ? 8 : 4),
                ),
              ],
            ),
            child: Row(
              children: [
                // Modern Number Badge
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF6366F1),
                        Color(0xFF8B5CF6),
                      ],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '${widget.index + 1}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Surah Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.surah.name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: widget.isDarkMode ? Colors.white : Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.format_quote,
                            size: 14,
                            color: widget.isDarkMode
                              ? Colors.white.withOpacity(0.5)
                              : Colors.black45,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${widget.surah.ayat} آية',
                            style: TextStyle(
                              fontSize: 14,
                              color: widget.isDarkMode
                                ? Colors.white.withOpacity(0.6)
                                : Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Modern Arrow
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: widget.isDarkMode
                      ? Colors.white.withOpacity(0.1)
                      : Colors.black.withOpacity(0.05),
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: widget.isDarkMode
                      ? Colors.white.withOpacity(0.7)
                      : Colors.black54,
                    size: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ModernSurahDetailPage extends StatefulWidget {
  final AyatSour surah;

  const ModernSurahDetailPage({super.key, required this.surah});

  @override
  State<ModernSurahDetailPage> createState() => _ModernSurahDetailPageState();
}

class _ModernSurahDetailPageState extends State<ModernSurahDetailPage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  bool _isDarkMode = true;
  double _fontSize = 24.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isDarkMode ? const Color(0xFF0A0A0A) : Colors.grey[50],
      body: Container(
        decoration: BoxDecoration(
          gradient: _isDarkMode 
            ? const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF0A0A0A),
                  Color(0xFF1A1A1A),
                  Color(0xFF0F0F0F),
                ],
              )
            : const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFF8F9FA),
                  Color(0xFFFFFFFF),
                  Color(0xFFF5F5F5),
                ],
              ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Modern App Bar
              FadeTransition(
                opacity: _fadeAnimation,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      // Back Button
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: _isDarkMode 
                            ? Colors.white.withOpacity(0.1)
                            : Colors.black.withOpacity(0.05),
                        ),
                        child: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: _isDarkMode ? Colors.white : Colors.black87,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Title
                      Expanded(
                        child: Text(
                          widget.surah.name,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: _isDarkMode ? Colors.white : Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Settings Button
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: _isDarkMode 
                            ? Colors.white.withOpacity(0.1)
                            : Colors.black.withOpacity(0.05),
                        ),
                        child: PopupMenuButton<String>(
                          icon: Icon(
                            Icons.text_format,
                            color: _isDarkMode ? Colors.white : Colors.black87,
                          ),
                          onSelected: (String value) {
                            if (value == 'theme') {
                              setState(() {
                                _isDarkMode = !_isDarkMode;
                              });
                            }
                          },
                          itemBuilder: (BuildContext context) => [
                            const PopupMenuItem<String>(
                              value: 'theme',
                              child: Row(
                                children: [
                                  Icon(Icons.brightness_6),
                                  SizedBox(width: 8),
                                  Text('تغيير المظهر'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Content
              Expanded(
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        color: _isDarkMode
                          ? Colors.white.withOpacity(0.05)
                          : Colors.white,
                        border: Border.all(
                          color: _isDarkMode
                            ? Colors.white.withOpacity(0.1)
                            : Colors.black.withOpacity(0.05),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: _isDarkMode
                              ? Colors.black.withOpacity(0.3)
                              : Colors.black.withOpacity(0.05),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(28),
                        child: Column(
                          children: [
                            // Surah Info Card
                            Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF6366F1),
                                    Color(0xFF8B5CF6),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.menu_book,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    'عدد الآيات: ${widget.surah.ayat}',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 32),
                            // Bismillah
                            Container(
                              padding: const EdgeInsets.all(24),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: _isDarkMode
                                  ? Colors.white.withOpacity(0.05)
                                  : Colors.grey[50],
                                border: Border.all(
                                  color: _isDarkMode
                                    ? Colors.white.withOpacity(0.1)
                                    : Colors.black.withOpacity(0.05),
                                ),
                              ),
                              child: Text(
                                'بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF6366F1),
                                  height: 1.8,
                                ),
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                            const SizedBox(height: 32),
                            // Quran Text
                            Container(
                              padding: const EdgeInsets.all(24),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: _isDarkMode
                                  ? Colors.white.withOpacity(0.03)
                                  : Colors.grey[25],
                                border: Border.all(
                                  color: _isDarkMode
                                    ? Colors.white.withOpacity(0.05)
                                    : Colors.black.withOpacity(0.03),
                                ),
                              ),
                              child: Text(
                                widget.surah.displayqoran,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: _fontSize,
                                  height: 2.2,
                                  color: _isDarkMode ? Colors.white : Colors.black87,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.5,
                                ),
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}