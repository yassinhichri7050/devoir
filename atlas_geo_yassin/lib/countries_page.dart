import 'package:flutter/material.dart';
import 'countries_data.dart';
import 'country_detail_page.dart';
import 'welcome_page.dart';

class CountriesPage extends StatelessWidget {
  const CountriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des Pays'),
        backgroundColor: Colors.blue,
      ),
      drawer: const _AtlasDrawer(),
      body: ListView.separated(
        padding: const EdgeInsets.all(8.0),
        itemCount: countriesData.length,
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final country = countriesData[index];
          return Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(country['flag']!),
                backgroundColor: Colors.grey.shade200,
                onBackgroundImageError: (exception, stackTrace) {
                  // Si l'image ne charge pas, un placeholder sera affiché
                },
                child: country['flag']!.isEmpty
                    ? const Icon(Icons.flag)
                    : null,
              ),
              title: Text(
                country['nom']!,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(country['capitale']!),
              trailing: const Icon(
                Icons.chevron_right,
                color: Colors.blue,
              ),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  CountryDetailPage.routeName,
                  arguments: country,
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _AtlasDrawer extends StatelessWidget {
  const _AtlasDrawer();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: const Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Accueil'),
            onTap: () {
              Navigator.pop(context); // Fermer le drawer
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const WelcomePage(),
                ),
                (route) => false,
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('À propos'),
            onTap: () {
              Navigator.pop(context); // Fermer le drawer
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutPage(),
                ),
              );
            },
          ),
          const Spacer(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Quitter'),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Quitter'),
                    content: const Text(
                      'Voulez-vous vraiment quitter l\'application ?',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // Fermer le dialog
                        },
                        child: const Text('Annuler'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // Fermer le dialog
                          Navigator.pop(context); // Retour à l'écran précédent
                        },
                        child: const Text('Quitter'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('À propos'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Atlas Géographique',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Version 1.0.0',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Cette application a été développée dans le cadre d\'un examen de développement mobile.',
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Elle permet d\'explorer les pays du monde et de découvrir leurs informations essentielles : capitale, population, superficie et langues officielles.',
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(Icons.school, color: Colors.blue),
                const SizedBox(width: 10),
                const Text(
                  'Projet Académique',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.code, color: Colors.blue),
                const SizedBox(width: 10),
                const Text(
                  'Développé avec Flutter',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
