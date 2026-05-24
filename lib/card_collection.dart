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
                Container(height: 2, width: 40, color: colors.secondary),
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
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username or Email',
                labelStyle: TextStyle(color: colors.primary.withOpacity(0.7)),
                prefixIcon: Icon(Icons.alternate_email_rounded, color: colors.primary),
                filled: true,
                fillColor: colors.surface,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
              ),
            ),
            const SizedBox(height: 20.0),
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
                  onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
                ),
                filled: true,
                fillColor: colors.surface,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
              ),
            ),
            const SizedBox(height: 35.0),
            OverflowBar(
              alignment: MainAxisAlignment.end,
              spacing: 16.0,
              children: <Widget>[
                TextButton(
                  child: const Text('RESET', style: TextStyle(fontWeight: FontWeight.bold)),
                  onPressed: () {
                    _usernameController.clear();
                    _passwordController.clear();
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                  ),
                  child: const Text('LOG IN', style: TextStyle(fontWeight: FontWeight.bold)),
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

    // --- CONFIGURABLE LOCAL PRODUCT DATA MAP ---
    final List<Map<String, String>> multiCollection = [
      {'name': 'Premium Handbag', 'price': 'Rs. 12,000', 'image': 'assets/handbag.jpg'},
      {'name': 'Traditional Shawl', 'price': 'Rs. 5,800', 'image': 'assets/shawl.jpg'},
      {'name': 'Wooden Cupboard', 'price': 'Rs. 45,000', 'image': 'assets/cupboard.jpg'},
      {'name': 'Matte Phone Cover', 'price': 'Rs. 1,200', 'image': 'assets/phonecover.jpg'},
      {'name': 'Quilted Blanket', 'price': 'Rs. 8,500', 'image': 'assets/blanket.jpg'},
      {'name': 'Extension Wire', 'price': 'Rs. 950', 'image': 'assets/wire.jpg'},
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
              style: TextStyle(color: colors.primary, fontWeight: FontWeight.bold, letterSpacing: 2.0),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search_rounded, color: colors.primary), onPressed: () {}),
          IconButton(icon: Icon(Icons.tune_rounded, color: colors.primary), onPressed: () {}),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 2.0),
            child: Text(
              'Summer Collection 2026',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: colors.primary),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Showing ${multiCollection.length} premium results',
              style: TextStyle(color: Colors.grey[600], fontSize: 13),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                // --- FIXED: Formats cards into compact, proportional grids without long white space ---
                childAspectRatio: 0.80, 
              ),
              itemCount: multiCollection.length,
              itemBuilder: (context, index) {
                final item = multiCollection[index];

                return Card(
                  color: colors.surface,
                  elevation: 1.5,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // --- FIXED: Strict frame restriction to compress image boundary ---
                      AspectRatio(
                        aspectRatio: 1.25,
                        child: Image.asset(
                          item['image']!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: colors.primary.withOpacity(0.05),
                              child: Icon(
                                Icons.image_not_supported_outlined,
                                color: colors.primary.withOpacity(0.4),
                                size: 28,
                              ),
                            );
                          },
                        ),
                      ),
                      // --- FIXED: Daraz retail style tight label padding ---
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 4.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                item['name']!,
                                style: TextStyle(
                                  color: colors.primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13.0,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 2.0),
                              Text(
                                item['price']!,
                                style: TextStyle(
                                  color: colors.secondary,
                                  fontWeight: FontWeight.w700,
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
    );
  }
}