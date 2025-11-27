import 'package:flutter/material.dart';
import 'welcome_page.dart';
import 'countries_page.dart';
import 'country_detail_page.dart';

void main() {
  runApp(const AtlasGeoApp());
}

class AtlasGeoApp extends StatelessWidget {
  const AtlasGeoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Atlas Géographique',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomePage(),
        '/countries': (context) => const CountriesPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == CountryDetailPage.routeName) {
          final country = settings.arguments as Map<String, String>;
          return MaterialPageRoute(
            builder: (context) => CountryDetailPage(country: country),
          );
        }
        return null;
      },
    );
  }
}

