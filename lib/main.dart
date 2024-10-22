import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homescout/firebase_options.dart';
import 'package:homescout/src/repository/authentication_repository/authentication_repository.dart';
import 'package:homescout/src/utils/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(AuthenticationRepository());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: HAppTheme.lightTheme,
      darkTheme: HAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/help': (context) => HelpScreen(),
        '/legal': (context) => LegalPrivacyScreen(),
        '/about': (context) => AboutUsScreen(),
        '/settings': (context) => SettingsScreen(),
        '/profile': (context) => ProfileScreen(),
        '/favorites': (context) => FavoritesScreen(),
        '/map': (context) => MapViewScreen(),
        '/rent': (context) => RentPropertyScreen(),
        '/sell': (context) => SellPropertyScreen(),
        '/buy': (context) => BuyPropertyScreen(),
        '/post': (context) => PostPropertyScreen(),
      },
    );
  }
}

// Home Screen with Navigation Options
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: Text('Help'),
            onTap: () {
              Get.toNamed('/help');
            },
          ),
          ListTile(
            title: Text('Legal & Privacy Policy'),
            onTap: () {
              Get.toNamed('/legal');
            },
          ),
          ListTile(
            title: Text('About Us'),
            onTap: () {
              Get.toNamed('/about');
            },
          ),
          ListTile(
            title: Text('Settings'),
            onTap: () {
              Get.toNamed('/settings');
            },
          ),
          ListTile(
            title: Text('Profile'),
            onTap: () {
              Get.toNamed('/profile');
            },
          ),
          ListTile(
            title: Text('Favorites'),
            onTap: () {
              Get.toNamed('/favorites');
            },
          ),
          ListTile(
            title: Text('Map View'),
            onTap: () {
              Get.toNamed('/map');
            },
          ),
          ListTile(
            title: Text('Rent Property'),
            onTap: () {
              Get.toNamed('/rent');
            },
          ),
          ListTile(
            title: Text('Sell Property'),
            onTap: () {
              Get.toNamed('/sell');
            },
          ),
          ListTile(
            title: Text('Buy Property'),
            onTap: () {
              Get.toNamed('/buy');
            },
          ),
          ListTile(
            title: Text('Post Property'),
            onTap: () {
              Get.toNamed('/post');
            },
          ),
        ],
      ),
    );
  }
}

// Example of a screen (You should implement these screens as needed)
class HelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
      ),
      body: Center(child: Text('Help content goes here')),
    );
  }
}

class LegalPrivacyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Legal & Privacy Policy'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Terms and Conditions', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Your terms and conditions text goes here.', style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            Text('Privacy Policy', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Your privacy policy text goes here.', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Center(child: Text('About Us content goes here')),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(child: Text('Settings options go here')),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(child: Text('Profile information goes here')),
    );
  }
}

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: Center(child: Text('List of favorite properties goes here')),
    );
  }
}

class MapViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map View'),
      ),
      body: Center(child: Text('Map view with property markers goes here')),
    );
  }
}

class RentPropertyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rent Property'),
      ),
      body: Center(child: Text('Available rental properties go here')),
    );
  }
}

class SellPropertyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sell Property'),
      ),
      body: Center(child: Text('Form to sell property goes here')),
    );
  }
}

class BuyPropertyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buy Property'),
      ),
      body: Center(child: Text('Available properties to buy go here')),
    );
  }
}

class PostPropertyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Property'),
      ),
      body: Center(child: Text('Form to post property goes here')),
    );
  }
}
