import 'package:flutter/material.dart';

void main() {
  runApp(const CustomShrineApp());
}

class CustomShrineApp extends StatelessWidget {
  const CustomShrineApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine Custom Edition',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        // Custom Spice Color Palette
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF3F51B5), // Deep Midnight Indigo
          primary: const Color(0xFF283593),
          secondary: const Color(0xFF7986CB),
          background: const Color(0xFFF8F9FA), // Soft Off-White
        ),
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // MDC 101: Text editing controllers
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      // MDC 101: Set resizeToAvoidBottomInset to prevent keyboard distortion
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          children: <Widget>[
            const SizedBox(height: 70.0),
            // Header Section with customized typography
            Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.05),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/diamond.png',
                    color: Theme.of(context).colorScheme.primary, // Color filter on the asset
                    height: 60,
                  ),
                ),
                const SizedBox(height: 20.0),
                Text(
                  'S H R I N E',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 4.0,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Premium Aesthetic Logistics',
                  style: TextStyle(
                    fontSize: 13.0,
                    color: Colors.grey[600],
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 80.0),
            
            // MDC 101: Customized [Name] TextField
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username ID',
                prefixIcon: const Icon(Icons.account_circle_outlined),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
              ),
            ),
            const SizedBox(height: 18.0),
            
            // MDC 101: Customized [Password] TextField
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Security Password',
                prefixIcon: const Icon(Icons.lock_outline_rounded),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 30.0),

            // Action Buttons Bar
            OverflowBar(
              alignment: MainAxisAlignment.end,
              spacing: 12.0,
              children: <Widget>[
                // Cancel Button
                TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 14.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: const Text(
                    'CLEAR',
                    style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2),
                  ),
                  onPressed: () {
                    // MDC 101: Clear the text fields
                    _usernameController.clear();
                    _passwordController.clear();
                  },
                ),
                // Next Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                    elevation: 2,
                    padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 14.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: const Text(
                    'AUTHENTICATE',
                    style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2),
                  ),
                  onPressed: () {
                    // MDC 101: Show the next page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePagePlaceholder()),
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

// MDC 102 Placeholder Page to showcase navigation flow
class HomePagePlaceholder extends StatelessWidget {
  const HomePagePlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: Add app bar (102)
      appBar: AppBar(
        title: const Text('SHRINE PORTAL'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      // TODO: Add a grid view (102)
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle_outline, size: 80, color: Colors.green),
            SizedBox(height: 16),
            Text(
              'You did it!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}