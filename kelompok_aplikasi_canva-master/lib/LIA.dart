import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CanvaExactPage(),
    );
  }
}

class CanvaExactPage extends StatefulWidget {
  const CanvaExactPage({super.key});

  @override
  State<CanvaExactPage> createState() => _CanvaExactPageState();
}

class _CanvaExactPageState extends State<CanvaExactPage> {
  int pressedIndex = -1;
  int pressedBoxIndex = -1;

  final List<String> templates = [
    'Education\nPresentation',
    'Worksheet',
    'Doc',
    'Email',
    'Education\nWebsite',
    'Poster',
    'Video',
    'Mobile\nVideo',
    'Education\nWhiteboard',
    'Sheet',
  ];

  final List<IconData> icons = [
    Icons.slideshow,
    Icons.assignment,
    Icons.description,
    Icons.email,
    Icons.language,
    Icons.image,
    Icons.play_circle_fill,
    Icons.smartphone,
    Icons.draw,
    Icons.table_chart,
  ];

  final List<String> moreTemplateImages = [
  'asset/images/fotolia1.jpg',
  'asset/images/fotolia2.jpg',
  'asset/images/fotolia3.jpg',
  'asset/images/fotolia4.jpg',
  'asset/images/fotolia5.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F14),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double width = constraints.maxWidth;

            int crossAxisCount;
            double aspectRatio;

            if (width >= 1100) {
              crossAxisCount = 4;
              aspectRatio = 2.6;
            } else if (width >= 900) {
              crossAxisCount = 3;
              aspectRatio = 2.4;
            } else if (width >= 700) {
              crossAxisCount = 2;
              aspectRatio = 2.2;
            } else {
              crossAxisCount = 3;
              aspectRatio = 1;
            }

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // EXPLORE TEMPLATES
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Explore templates',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: templates.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      mainAxisSpacing: 14,
                      crossAxisSpacing: 14,
                      childAspectRatio: aspectRatio,
                    ),
                    itemBuilder: (context, index) {
                      final isPressed = pressedIndex == index;

                      return GestureDetector(
                        onTapDown: (_) =>
                            setState(() => pressedIndex = index),
                        onTapUp: (_) =>
                            setState(() => pressedIndex = -1),
                        onTapCancel: () =>
                            setState(() => pressedIndex = -1),
                        child: AnimatedScale(
                          scale: isPressed ? 0.95 : 1,
                          duration: const Duration(milliseconds: 120),
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.purple.withOpacity(0.35),
                                  Colors.blue.withOpacity(0.15),
                                ],
                              ),
                            ),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    width: 42,
                                    height: 42,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white.withOpacity(0.85),
                                    ),
                                    child: Icon(
                                      icons[index],
                                      size: 22,
                                      color: Colors.deepPurple,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    templates[index],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 32),

                  // MORE TEMPLATES FOR YOU
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'More templates for you',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 14),

                  SizedBox(
                    height: 180,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        final isPressed = pressedBoxIndex == index;

                        return GestureDetector(
                          onTapDown: (_) =>
                              setState(() => pressedBoxIndex = index),
                          onTapUp: (_) =>
                              setState(() => pressedBoxIndex = -1),
                          onTapCancel: () =>
                              setState(() => pressedBoxIndex = -1),
                          child: AnimatedScale(
                            scale: isPressed ? 0.95 : 1,
                            duration: const Duration(milliseconds: 120),

                            child: Container(
                              width: 280,
                              margin: const EdgeInsets.only(right: 14),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white.withOpacity(0.08),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.12),
                                ),
                                image: DecorationImage(
                                  image: AssetImage(
                                    moreTemplateImages[index], 
                                    ),
                                    fit: BoxFit.cover,
                                    ),

                                
                              ),
                              
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 32),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
