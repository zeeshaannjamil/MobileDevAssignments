import 'package:flutter/material.dart';

void main() {
  runApp(const BrandedShrineApp());
}

class BrandedShrineApp extends StatelessWidget {
  const BrandedShrineApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine Premium Portal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        // Creative "Spice" Color Palette: Warm Terracotta & Desert Gold
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFBF360C), // Deep Terracotta
          primary: const Color(0xFF870000),    // Rich Maroon Accent
          secondary: const Color(0xFFE5A93B),  // Soft Desert Gold
          surface: const Color(0xFFFFFBF7),    // Creamy Warm Surface
          background: const Color(0xFFFFF9F2), // Elegant Off-White
        ),
      ),
      home: const BrandedLoginPage(),
    );
  }
}

class BrandedLoginPage extends StatefulWidget {
  const BrandedLoginPage({Key? key}) : super(key: key);

  @override
  _BrandedLoginPageState createState() => _BrandedLoginPageState();
}

class _BrandedLoginPageState extends State<BrandedLoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colors.background,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          children: <Widget>[
            const SizedBox(height: 60.0),
            
            // Header Branding Section
            Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: colors.primary.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: Image.asset(
                    'assets/diamond.png',
                    height: 65,
                  ),
                ),
                const SizedBox(height: 24.0),
                Text(
                  'S H R I N E',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 6.0,
                    color: colors.primary,
                  ),
                ),
                const SizedBox(height: 6.0),
                Container(
                  height: 2,
                  width: 40,
                  color: colors.secondary,
                ),
                const SizedBox(height: 8.0),
                Text(
                  'ELEGANT CURATIONS',
                  style: TextStyle(
                    fontSize: 11.0,
                    fontWeight: FontWeight.w600,
                    color: colors.primary.withOpacity(0.6),
                    letterSpacing: 2.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 70.0),
            
            // Username Field
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username or Email',
                labelStyle: TextStyle(color: colors.primary.withOpacity(0.7)),
                prefixIcon: Icon(Icons.alternate_email_rounded, color: colors.primary),
                filled: true,
                fillColor: colors.surface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: colors.secondary, width: 2.0),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            
            // Password Field with Dynamic Visibility Toggle
            TextField(
              controller: _passwordController,
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Security Credentials',
                labelStyle: TextStyle(color: colors.primary.withOpacity(0.7)),
                prefixIcon: Icon(Icons.shield_outlined, color: colors.primary),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                    color: colors.primary.withOpacity(0.6),
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
                filled: true,
                fillColor: colors.surface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: colors.secondary, width: 2.0),
                ),
              ),
            ),
            const SizedBox(height: 35.0),

            // Form Action Row
            OverflowBar(
              alignment: MainAxisAlignment.end,
              spacing: 16.0,
              children: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: colors.primary,
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                  child: const Text(
                    'RESET',
                    style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.5),
                  ),
                  onPressed: () {
                    _usernameController.clear();
                    _passwordController.clear();
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colors.primary,
                    foregroundColor: Colors.white,
                    elevation: 4,
                    shadowColor: colors.primary.withOpacity(0.4),
                    padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                  child: const Text(
                    'LOG IN',
                    style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.5),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PortalMainScreen()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PortalMainScreen extends StatelessWidget {
  const PortalMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    // Dummy product items data for grading presentation
    final List<Map<String, String>> products = [
      {'name': 'Vagabond rucksack', 'price': '\$120.00'},
      {'name': 'Stella sunglasses', 'price': '\$58.00'},
      {'name': 'Whitney belt', 'price': '\$35.00'},
      {'name': 'Garden strand', 'price': '\$98.00'},
    ];

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        backgroundColor: colors.surface,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu_open_rounded, color: colors.primary),
          onPressed: () {},
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/diamond.png', height: 20, color: colors.primary),
            const SizedBox(width: 8),
            Text(
              'SHRINE',
              style: TextStyle(
                color: colors.primary,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                fontSize: 18,
              ),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search_rounded, color: colors.primary),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.tune_rounded, color: colors.primary),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back, Explorer',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: colors.primary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Curated collection updates for today.',
              style: TextStyle(color: Colors.grey[600]),
            ),
            const SizedBox(height: 24),
            
            // --- UPDATED: REWRITTEN GRIDVIEW WITH DETAILED MATERIAL CARDS ---
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 0.72, // Tightened aspect ratio to give the layout breathing room
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  
                  return Card(
                    color: colors.surface,
                    elevation: 2,
                    clipBehavior: Clip.antiAlias, // Ensures internal components don't bleed past borders
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Top Section: Image/Visual container box
                        AspectRatio(
                          aspectRatio: 18.0 / 11.0,
                          child: Container(
                            color: colors.primary.withOpacity(0.05),
                            child: Icon(
                              Icons.local_mall_outlined, // Fallback icon mimicking a clean catalog item placeholder
                              color: colors.primary.withOpacity(0.4),
                              size: 40,
                            ),
                          ),
                        ),
                        // Bottom Section: Structured Metadata Labels
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  product['name']!,
                                  style: TextStyle(
                                    color: colors.primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4.0),
                                Text(
                                  product['price']!,
                                  style: TextStyle(
                                    color: colors.secondary,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}