import 'package:flutter/material.dart';
import 'package:musik/pages/profil/profil_screen.dart';
import 'package:musik/utils/colors.dart';

class Playlist extends StatelessWidget {
  const Playlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text(
          'Playlist',
          style: TextStyle(
            color: Color(0xFFEC0048),
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Image.asset('assets/images/user_profil.png'),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFF222121),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.save,
              color: Color(0xFFEC0048),
            ),
            const Text(
              'Votre playlist est vide',
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Créer une playlist'),
            ),
          ],
        ),
      ),
      endDrawer: const MyDrawerProfile(),
    );
  }
}

class SauvegardePage extends StatelessWidget {
  const SauvegardePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text(
          'Sauvegarde',
          style: TextStyle(
            color: Color(0xFFEC0048),
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Image.asset('assets/images/user_profil.png'),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFF222121),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        color: const Color(0xFF222121),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16.0),
            _buildSauvegardeItem(
              'Bloody samarita',
              'Ayrastart',
              'assets/images/Rectangle 19.png',
            ),
            const SizedBox(height: 16.0),
            _buildSauvegardeItem(
              'Praise',
              'Elevation worship',
              'assets/images/Rectangle 19.png',
            ),
            _buildSauvegardeItem(
              'Aya Nakamura',
              'La dot',
              'assets/images/Rectangle 17.png',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSauvegardeItem(
      String title, String description, String imagePath) {
    return Card(
      color: const Color(0xFF333333),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.white, width: 2.0),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13.0,
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

class LikesPage extends StatelessWidget {
  const LikesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text(
          'Likes',
          style: TextStyle(
            color: Color(0xFFEC0048),
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Image.asset('assets/images/user_profil.png'),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFF222121),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        color: const Color(0xFF222121),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16.0),
            _buildLikesItem(
              'Bloody samarita',
              'Ayrastart',
              'assets/images/Rectangle 19.png',
            ),
            const SizedBox(height: 16.0),
            _buildLikesItem(
              'Praise',
              'Elevation worship',
              'assets/images/Rectangle 19.png',
            ),
            _buildLikesItem(
              'Aya Nakamura',
              'La dot',
              'assets/images/Rectangle 17.png',
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildLikesItem(String title, String description, String imagePath) {
  return Card(
    color: const Color(0xFF333333),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.white, width: 2.0),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                description,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13.0,
                ),
              ),
            ],
          ),
          const Spacer(),
          const Icon(
            Icons.favorite,
            color: Color(0xFFEC0048),
          ),
        ],
      ),
    ),
  );
}
