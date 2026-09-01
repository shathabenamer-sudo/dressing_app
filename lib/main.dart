import 'package:flutter/material.dart';

void main() {
  runApp(const DressingApp());
}

class DressingApp extends StatelessWidget {
  const DressingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dressing',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

// Main screen
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    OutfitsPage(),
    ClosetPage(),
    InspirationPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],

      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,

        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },

        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.checkroom_outlined),
            selectedIcon: Icon(Icons.checkroom),
            label: 'Outfits',
          ),

          NavigationDestination(
            icon: Icon(Icons.inventory_2_outlined),
            selectedIcon: Icon(Icons.inventory_2),
            label: 'Closet',
          ),

          NavigationDestination(
            icon: Icon(Icons.auto_awesome_outlined),
            selectedIcon: Icon(Icons.auto_awesome),
            label: 'Inspiration',
          ),
        ],
      ),
    );
  }
}


// ─────────────────────────────
// OUTFITS PAGE
// ─────────────────────────────

class OutfitsPage extends StatelessWidget {
  const OutfitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Outfits',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: const Center(
        child: Text(
          'No outfits yet',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // We will add the Create Outfit page here later.
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}


// ─────────────────────────────
// CLOSET PAGE
// ─────────────────────────────

class ClosetPage extends StatelessWidget {
  const ClosetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Closet',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: const Center(
        child: Text(
          'Your clothes will appear here',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}


// ─────────────────────────────
// INSPIRATION PAGE
// ─────────────────────────────

class InspirationPage extends StatelessWidget {
  const InspirationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Inspiration',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: const Center(
        child: Text(
          'Find outfit inspiration here',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  
}