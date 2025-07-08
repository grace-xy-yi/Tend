// _________________________ BLANK TEMPLATE__________________________

// import 'package:flutter/material.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: Text(
//         'Home Page',
//         style: TextStyle(fontSize: 24),
//       ),
//     );
//   }
// }
// __________________________________________________________________



// _________________________ STATIC BUBBLES__________________________
// import 'package:flutter/material.dart';
// import 'dart:math';

// // Main widget for the Home Page, building the entire screen layout.
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // Using a custom-built body instead of the default AppBar for more layout control.
//       body: SafeArea(
//         // By wrapping the content in a SingleChildScrollView, we prevent overflow
//         // errors on smaller screens by allowing the user to scroll.
//         child: SingleChildScrollView(
//           // IntrinsicHeight is used here to ensure that the Spacer widget inside the
//           // Column works correctly within a scrollable view. It forces the Column
//           // to take up a specific height, allowing the Spacer to expand and push
//           // the pollutants card to the bottom.
//           child: IntrinsicHeight(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(height: 10),
//                   // 1. Custom App Bar Section
//                   _buildCustomAppBar(),
//                   const SizedBox(height: 24),
//                   // 2. "My Air" Title
//                   const Text(
//                     'My Air',
//                     style: TextStyle(
//                       fontSize: 36,
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xFF1A1A1A),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   // 3. Air Quality Bubble Visualization
//                   _buildBubbleVisualization(),
//                   // The Spacer pushes the pollutants card to the bottom of the screen.
//                   const Spacer(),
//                   // 4. Pollutants Information Card
//                   _buildPollutantsCard(),
//                   const SizedBox(height: 16),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // Builds the top row with location and profile icon.
//   Widget _buildCustomAppBar() {
//     return const Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Row(
//           children: [
//             Icon(Icons.near_me_outlined, color: Color(0xFF1A1A1A)),
//             SizedBox(width: 8),
//             Text(
//               'Haidian',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ],
//         ),
//         CircleAvatar(
//           backgroundColor: Color(0xFFE0E0E0),
//           child: Icon(Icons.person_outline, color: Color(0xFF1A1A1A)),
//         ),
//       ],
//     );
//   }

//   // Builds the main bubble visualization.
//   Widget _buildBubbleVisualization() {
//     return AspectRatio(
//       aspectRatio: 1, // Ensures the container is a square, making the circle perfectly round.
//       child: Container(
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.1),
//               spreadRadius: 5,
//               blurRadius: 15,
//               offset: const Offset(0, 5),
//             ),
//           ],
//         ),
//         child: const Stack(
//           children: [
//             // These are positioned statically to match the mockup.
//             // In a real app, their size and position could be animated based on data.
//             _PollutantBubble(
//                 size: 100, top: 50, left: 120, text: 'PM10', color1: Color(0xFFFFD54F), color2: Color(0xFFFFA000)),
//             _PollutantBubble(
//                 size: 80, top: 200, left: 30, text: 'PM10', color1: Color(0xFFFFD54F), color2: Color(0xFFFFA000)),
//             _PollutantBubble(
//                 size: 70, top: 60, left: 40, text: 'PM2.5', color1: Color(0xFF4FC3F7), color2: Color(0xFF039BE5)),
//             _PollutantBubble(
//                 size: 85, top: 180, left: 180, text: 'PM2.5', color1: Color(0xFF4FC3F7), color2: Color(0xFF039BE5)),
//             _PollutantBubble(
//                 size: 30, top: 40, left: 110, text: 'NO₂', color1: Color(0xFF81C784), color2: Color(0xFF4CAF50)),
//             _PollutantBubble(
//                 size: 25, top: 100, left: 200, text: 'NO₂', color1: Color(0xFF81C784), color2: Color(0xFF4CAF50)),
//              _PollutantBubble(
//                 size: 25, top: 250, left: 150, text: 'NO₂', color1: Color(0xFF81C784), color2: Color(0xFF4CAF50)),
//             _PollutantBubble(
//                 size: 40, top: 120, left: 110, text: 'O₃', color1: Color(0xFFBA68C8), color2: Color(0xFF9C27B0)),
//             _PollutantBubble(
//                 size: 20, top: 110, left: 150, text: 'O₃', color1: Color(0xFFBA68C8), color2: Color(0xFF9C27B0)),
//             _PollutantBubble(
//                 size: 20, top: 170, left: 100, text: 'O₃', color1: Color(0xFFBA68C8), color2: Color(0xFF9C27B0)),
//             _PollutantBubble(
//                 size: 30, top: 260, left: 60, text: 'O₃', color1: Color(0xFFBA68C8), color2: Color(0xFF9C27B0)),
//           ],
//         ),
//       ),
//     );
//   }

//   // Builds the card displaying detailed pollutant stats.
//   Widget _buildPollutantsCard() {
//     return Card(
//       elevation: 2,
//       shadowColor: Colors.grey.withOpacity(0.2),
//       color: Colors.white,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Pollutants',
//               style: TextStyle(
//                 fontSize: 20,
//                 color: Color(0xFF1A1A1A),
//               ),
//             ),
//             const SizedBox(height: 20),
//             const Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 _PollutantStat(name: 'PM10', value: '37', status: 'Good', statusColor: Colors.green),
//                 _PollutantStat(name: 'PM2.5', value: '97', status: 'Moderate', statusColor: Colors.orange),
//                 _PollutantStat(name: 'NO₂', value: '20', status: 'Good', statusColor: Colors.green),
//                 _PollutantStat(name: 'O₃', value: '0.9', status: 'Good', statusColor: Colors.green),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // A helper widget for the individual bubbles in the visualization.
// class _PollutantBubble extends StatelessWidget {
//   final double size;
//   final double top;
//   final double left;
//   final String text;
//   final Color color1;
//   final Color color2;

//   const _PollutantBubble({
//     required this.size,
//     required this.top,
//     required this.left,
//     required this.text,
//     required this.color1,
//     required this.color2,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       top: top,
//       left: left,
//       child: Container(
//         width: size,
//         height: size,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           gradient: LinearGradient(
//             colors: [color1, color2],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Center(
//           child: Text(
//             text,
//             style: const TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // A helper widget for displaying a single pollutant's statistics in the card.
// class _PollutantStat extends StatelessWidget {
//   final String name;
//   final String value;
//   final String status;
//   final Color statusColor;

//   const _PollutantStat({
//     required this.name,
//     required this.value,
//     required this.status,
//     required this.statusColor,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Text(
//           name,
//           style: TextStyle(
//             color: Colors.grey[600],
//             fontSize: 14,
//           ),
//         ),
//         const SizedBox(height: 8),
//         Text(
//           value,
//           style: const TextStyle(
//             fontSize: 28,
//             fontWeight: FontWeight.bold,
//             color: Color(0xFF1A1A1A),
//           ),
//         ),
//         const SizedBox(height: 8),
//         Row(
//           children: [
//             Container(
//               width: 8,
//               height: 8,
//               decoration: BoxDecoration(
//                 color: statusColor,
//                 shape: BoxShape.circle,
//               ),
//             ),
//             const SizedBox(width: 4),
//             Text(
//               status,
//               style: TextStyle(
//                 color: Colors.grey[600],
//                 fontSize: 14,
//               ),
//             ),
//           ],
//         )
//       ],
//     );
//   }
// }
// ___________________________________________________________________________ 
// __________________________Moving Bubbles Loop___________________________ 

// import 'package:flutter/material.dart';
// import 'dart:math';

// // Main widget for the Home Page, building the entire screen layout.
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage>
//     with SingleTickerProviderStateMixin {
//   // A single controller to drive all animations for efficiency.
//   late AnimationController _controller;
//   // A list to hold a separate animation for each bubble.
//   late List<Animation<Offset>> _animations;

//   // Storing bubble data in a list for easy management.
//   final List<_BubbleData> bubbles = [
//     _BubbleData(size: 100, initialPosition: const Offset(120, 50), text: 'PM10', color1: const Color(0xFFFFD54F), color2: const Color(0xFFFFA000)),
//     _BubbleData(size: 80, initialPosition: const Offset(30, 200), text: 'PM10', color1: const Color(0xFFFFD54F), color2: const Color(0xFFFFA000)),
//     _BubbleData(size: 70, initialPosition: const Offset(40, 60), text: 'PM2.5', color1: const Color(0xFF4FC3F7), color2: const Color(0xFF039BE5)),
//     _BubbleData(size: 85, initialPosition: const Offset(180, 180), text: 'PM2.5', color1: const Color(0xFF4FC3F7), color2: const Color(0xFF039BE5)),
//     _BubbleData(size: 30, initialPosition: const Offset(110, 40), text: 'NO₂', color1: const Color(0xFF81C784), color2: const Color(0xFF4CAF50)),
//     _BubbleData(size: 25, initialPosition: const Offset(200, 100), text: 'NO₂', color1: const Color(0xFF81C784), color2: const Color(0xFF4CAF50)),
//     _BubbleData(size: 25, initialPosition: const Offset(150, 250), text: 'NO₂', color1: const Color(0xFF81C784), color2: const Color(0xFF4CAF50)),
//     _BubbleData(size: 40, initialPosition: const Offset(110, 120), text: 'O₃', color1: const Color(0xFFBA68C8), color2: const Color(0xFF9C27B0)),
//     _BubbleData(size: 20, initialPosition: const Offset(150, 110), text: 'O₃', color1: const Color(0xFFBA68C8), color2: const Color(0xFF9C27B0)),
//     _BubbleData(size: 20, initialPosition: const Offset(100, 170), text: 'O₃', color1: const Color(0xFFBA68C8), color2: const Color(0xFF9C27B0)),
//     _BubbleData(size: 30, initialPosition: const Offset(60, 260), text: 'O₃', color1: const Color(0xFFBA68C8), color2: const Color(0xFF9C27B0)),
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(seconds: 4), // Controls the speed of the float.
//       vsync: this,
//     )..repeat(reverse: true); // Repeats the animation back and forth.

//     _animations = bubbles.map((bubble) {
//       final random = Random();
//       // Create a random end-point for the bubble to float to.
//       final endOffset = Offset(
//         bubble.initialPosition.dx + random.nextDouble() * 20 - 10, // Random x offset
//         bubble.initialPosition.dy + random.nextDouble() * 20 - 10, // Random y offset
//       );

//       // Each bubble gets its own Tween to animate between its start and end positions.
//       return Tween<Offset>(begin: bubble.initialPosition, end: endOffset)
//           .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
//     }).toList();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: IntrinsicHeight(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(height: 10),
//                   _buildCustomAppBar(),
//                   const SizedBox(height: 24),
//                   const Text(
//                     'My Air',
//                     style: TextStyle(
//                       fontSize: 36,
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xFF1A1A1A),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   _buildBubbleVisualization(),
//                   const Spacer(),
//                   _buildPollutantsCard(),
//                   const SizedBox(height: 16),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildCustomAppBar() {
//     return const Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Row(
//           children: [
//             Icon(Icons.near_me_outlined, color: Color(0xFF1A1A1A)),
//             SizedBox(width: 8),
//             Text(
//               'Haidian',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ],
//         ),
//         CircleAvatar(
//           backgroundColor: Color(0xFFE0E0E0),
//           child: Icon(Icons.person_outline, color: Color(0xFF1A1A1A)),
//         ),
//       ],
//     );
//   }

//   // Builds the animated bubble visualization.
//   Widget _buildBubbleVisualization() {
//     return AspectRatio(
//       aspectRatio: 1,
//       child: Container(
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.1),
//               spreadRadius: 5,
//               blurRadius: 15,
//               offset: const Offset(0, 5),
//             ),
//           ],
//         ),
//         // AnimatedBuilder rebuilds the bubbles on every tick of the animation.
//         child: AnimatedBuilder(
//           animation: _controller,
//           builder: (context, child) {
//             return Stack(
//               // We use asMap().entries.map() to get both the index and value.
//               children: bubbles.asMap().entries.map((entry) {
//                 final index = entry.key;
//                 final bubbleData = entry.value;
//                 final animation = _animations[index];

//                 // The Positioned widget is updated with the new offset from the animation.
//                 return Positioned(
//                   top: animation.value.dy,
//                   left: animation.value.dx,
//                   child: _PollutantBubble(
//                     size: bubbleData.size,
//                     text: bubbleData.text,
//                     color1: bubbleData.color1,
//                     color2: bubbleData.color2,
//                   ),
//                 );
//               }).toList(),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   Widget _buildPollutantsCard() {
//     return Card(
//       elevation: 2,
//       shadowColor: Colors.grey.withOpacity(0.2),
//       color: Colors.white,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Pollutants',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Color(0xFF1A1A1A),
//               ),
//             ),
//             const SizedBox(height: 20),
//             const Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 _PollutantStat(name: 'PM10', value: '37', status: 'Good', statusColor: Colors.green),
//                 _PollutantStat(name: 'PM2.5', value: '97', status: 'Moderate', statusColor: Colors.orange),
//                 _PollutantStat(name: 'NO₂', value: '20', status: 'Good', statusColor: Colors.green),
//                 _PollutantStat(name: 'O₃', value: '0.9', status: 'Good', statusColor: Colors.green),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Data class for bubble properties.
// class _BubbleData {
//   final double size;
//   final Offset initialPosition;
//   final String text;
//   final Color color1;
//   final Color color2;

//   _BubbleData({
//     required this.size,
//     required this.initialPosition,
//     required this.text,
//     required this.color1,
//     required this.color2,
//   });
// }

// // Widget for the individual pollutant bubbles.
// class _PollutantBubble extends StatelessWidget {
//   final double size;
//   final String text;
//   final Color color1;
//   final Color color2;

//   const _PollutantBubble({
//     required this.size,
//     required this.text,
//     required this.color1,
//     required this.color2,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: size,
//       height: size,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         gradient: LinearGradient(
//           colors: [color1, color2],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//       ),
//       child: Center(
//         child: Text(
//           text,
//           style: const TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Widget for displaying a single pollutant's statistics.
// class _PollutantStat extends StatelessWidget {
//   final String name;
//   final String value;
//   final String status;
//   final Color statusColor;

//   const _PollutantStat({
//     required this.name,
//     required this.value,
//     required this.status,
//     required this.statusColor,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Text(
//           name,
//           style: TextStyle(
//             color: Colors.grey[600],
//             fontSize: 14,
//           ),
//         ),
//         const SizedBox(height: 8),
//         Text(
//           value,
//           style: const TextStyle(
//             fontSize: 28,
//             fontWeight: FontWeight.bold,
//             color: Color(0xFF1A1A1A),
//           ),
//         ),
//         const SizedBox(height: 8),
//         Row(
//           children: [
//             Container(
//               width: 8,
//               height: 8,
//               decoration: BoxDecoration(
//                 color: statusColor,
//                 shape: BoxShape.circle,
//               ),
//             ),
//             const SizedBox(width: 4),
//             Text(
//               status,
//               style: TextStyle(
//                 color: Colors.grey[600],
//                 fontSize: 14,
//               ),
//             ),
//           ],
//         )
//       ],
//     );
//   }
// }
// ___________________________________________________________________________ 

import 'package:flutter/material.dart';
import 'dart:math';

// Main widget for the Home Page, building the entire screen layout.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  // A single controller to act as a "ticker" for our physics simulation.
  late AnimationController _controller;
  // A list to hold our bubble objects, which now manage their own state.
  late List<_PhysicsBubble> _bubbles;

  @override
  void initState() {
    super.initState();

    // Initialize the bubbles with their properties and a random initial velocity.
    _bubbles = [
      _PhysicsBubble(size: 100, position: const Offset(120, 50), text: 'PM10', color1: const Color(0xFFFFD54F), color2: const Color(0xFFFFA000)),
      _PhysicsBubble(size: 80, position: const Offset(30, 200), text: 'PM10', color1: const Color(0xFFFFD54F), color2: const Color(0xFFFFA000)),
      _PhysicsBubble(size: 70, position: const Offset(40, 60), text: 'PM2.5', color1: const Color(0xFF4FC3F7), color2: const Color(0xFF039BE5)),
      _PhysicsBubble(size: 85, position: const Offset(180, 180), text: 'PM2.5', color1: const Color(0xFF4FC3F7), color2: const Color(0xFF039BE5)),
      _PhysicsBubble(size: 30, position: const Offset(110, 40), text: 'NO₂', color1: const Color(0xFF81C784), color2: const Color(0xFF4CAF50)),
      _PhysicsBubble(size: 25, position: const Offset(200, 100), text: 'NO₂', color1: const Color(0xFF81C784), color2: const Color(0xFF4CAF50)),
      _PhysicsBubble(size: 25, position: const Offset(150, 250), text: 'NO₂', color1: const Color(0xFF81C784), color2: const Color(0xFF4CAF50)),
      _PhysicsBubble(size: 40, position: const Offset(110, 120), text: 'O₃', color1: const Color(0xFFBA68C8), color2: const Color(0xFF9C27B0)),
      _PhysicsBubble(size: 20, position: const Offset(150, 110), text: 'O₃', color1: const Color(0xFFBA68C8), color2: const Color(0xFF9C27B0)),
      _PhysicsBubble(size: 20, position: const Offset(100, 170), text: 'O₃', color1: const Color(0xFFBA68C8), color2: const Color(0xFF9C27B0)),
      _PhysicsBubble(size: 30, position: const Offset(60, 260), text: 'O₃', color1: const Color(0xFFBA68C8), color2: const Color(0xFF9C27B0)),
    ];

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..addListener(() {
        setState(() {
          for (var bubble in _bubbles) {
            bubble.updatePosition();
          }
        });
      });

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = 40.0;
    final bubbleContainerSize = screenWidth - horizontalPadding;

    for (var bubble in _bubbles) {
      bubble.containerSize = bubbleContainerSize;
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  _buildCustomAppBar(),
                  const SizedBox(height: 24),
                  const Text(
                    'My Air',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildBubbleVisualization(bubbleContainerSize),
                  const Spacer(),
                  _buildPollutantsCard(),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCustomAppBar() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Icons.near_me_outlined, color: Color(0xFF1A1A1A)),
            SizedBox(width: 8),
            Text(
              'Haidian',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        CircleAvatar(
          backgroundColor: Color(0xFFE0E0E0),
          child: Icon(Icons.person_outline, color: Color(0xFF1A1A1A)),
        ),
      ],
    );
  }

  Widget _buildBubbleVisualization(double containerSize) {
    return Container(
      width: containerSize,
      height: containerSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipOval(
        child: Stack(
          children: _bubbles.map((bubble) {
            return Positioned(
              left: bubble.position.dx,
              top: bubble.position.dy,
              child: _PollutantBubble(
                size: bubble.size,
                text: bubble.text,
                color1: bubble.color1,
                color2: bubble.color2,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildPollutantsCard() {
    return Card(
      elevation: 2,
      shadowColor: Colors.grey.withOpacity(0.2),
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pollutants',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A1A1A),
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _PollutantStat(name: 'PM10', value: '37', status: 'Good', statusColor: Colors.green),
                _PollutantStat(name: 'PM2.5', value: '97', status: 'Moderate', statusColor: Colors.orange),
                _PollutantStat(name: 'NO₂', value: '20', status: 'Good', statusColor: Colors.green),
                _PollutantStat(name: 'O₃', value: '0.9', status: 'Good', statusColor: Colors.green),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// A class to manage the state and physics of a single bubble.
class _PhysicsBubble {
  final double size;
  final String text;
  final Color color1;
  final Color color2;
  Offset position;
  Offset velocity;
  double containerSize = 0;

  _PhysicsBubble({
    required this.size,
    required this.position,
    required this.text,
    required this.color1,
    required this.color2,
  }) : velocity = Offset(
          Random().nextDouble() * 2 - 1,
          Random().nextDouble() * 2 - 1,
        );

  void updatePosition() {
    if (containerSize == 0) return;

    // Add a small, random "wandering" force to make the movement more natural.
    final wanderForce = Offset(
      Random().nextDouble() * 0.1 - 0.05, // Tiny random change in x
      Random().nextDouble() * 0.1 - 0.05, // Tiny random change in y
    );
    velocity += wanderForce;

    // Clamp the velocity to a maximum speed to prevent it from getting too fast.
    const maxSpeed = 1.0;
    if (velocity.distance > maxSpeed) {
      velocity = (velocity / velocity.distance) * maxSpeed;
    }

    // Move the bubble by its velocity.
    position += velocity;

    // --- Collision Detection and Response ---
    final center = Offset(containerSize / 2, containerSize / 2);
    final bubbleCenter = position + Offset(size / 2, size / 2);
    final distance = (bubbleCenter - center).distance;

    // Check if the bubble is outside the container.
    if (distance + size / 2 > containerSize / 2) {
      final normal = bubbleCenter - center;
      final normalizedNormal = normal / distance;

      // Reflect the velocity vector to simulate a bounce.
      final dotProduct = velocity.dx * normalizedNormal.dx + velocity.dy * normalizedNormal.dy;
      velocity = Offset(
        velocity.dx - 2 * dotProduct * normalizedNormal.dx,
        velocity.dy - 2 * dotProduct * normalizedNormal.dy,
      );

      // Apply a dampening factor to lose a bit of energy on each bounce.
      velocity *= 0.8;

      // **CRITICAL FIX:** Instead of teleporting, this calculates how much the bubble
      // has overshot the boundary and pushes it back by exactly that amount.
      final overlap = distance + size / 2 - containerSize / 2;
      position -= normalizedNormal * overlap;
    }
  }
}

// Widget for the individual pollutant bubbles.
class _PollutantBubble extends StatelessWidget {
  final double size;
  final String text;
  final Color color1;
  final Color color2;

  const _PollutantBubble({
    required this.size,
    required this.text,
    required this.color1,
    required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// Widget for displaying a single pollutant's statistics.
class _PollutantStat extends StatelessWidget {
  final String name;
  final String value;
  final String status;
  final Color statusColor;

  const _PollutantStat({
    required this.name,
    required this.value,
    required this.status,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          name,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A1A1A),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: statusColor,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              status,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
          ],
        )
      ],
    );
  }
}
