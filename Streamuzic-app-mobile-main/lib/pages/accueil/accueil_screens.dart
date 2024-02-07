import 'package:flutter/material.dart';
import 'package:musik/models/song_model.dart';
import 'package:musik/models/user.dart';
import 'package:musik/pages/accueil/music_widgets.dart';
import 'package:musik/pages/profil/persistance_player.dart';
import 'package:musik/pages/profil/profil_screen.dart';
import 'package:musik/repositories/get_home_page.dart';
import 'package:musik/utils/colors.dart';

class AccueilHomePage extends StatefulWidget {
  const AccueilHomePage({super.key});

  @override
  State<AccueilHomePage> createState() => _AccueilHomePage();
}

class _AccueilHomePage extends State<AccueilHomePage> {
  _AccueilHomePage();
  final GetHomePage getHomePage = GetHomePage();
  List<User>? users;
  List<SongModel>? songs;

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future<void> fetchData() async {
    try {
      // Fetch user data
      final users_ = await getHomePage.getUsers();
      final songs_ = await getHomePage.getSongs();

      setState(() {
        users = users_;
        songs = songs_;
      });
    } catch (error) {
      print('Error fetching data: $error');
      // Handle error, show a message, etc.
    }
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AccueilHomePage()),
      );
    }
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Search()),
      );
    }
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Bibliotheque()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: BackButton(
          color: buttonColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
      backgroundColor: backgroundColor,
      endDrawer: const MyDrawerProfile(),
      body: users == null && songs == null
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 20),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/logo.png',
                                fit: BoxFit.contain,
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.center,
                        child: RichText(
                          text: const TextSpan(
                            style: TextStyle(fontSize: 24),
                            children: [
                              TextSpan(
                                text: 'Hello ',
                                style: TextStyle(color: Colors.white),
                              ),
                              TextSpan(
                                text: 'John Doe',
                                style: TextStyle(
                                  color: buttonColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      _buildSectionHeader(),
                      const SizedBox(height: 12),
                      const TrendWidget(
                        imageUrls: [
                          'assets/images/Rectangle 17.png',
                          'assets/images/Rectangle 19.png',
                        ],
                      ),
                      // Ajoutez une description si nécessaire
                      AlbumWidget(
                        songs: songs!,
                      ),
                      const SizedBox(height: 16),
                      // Ajoutez une description si nécessaire
                      ArtistWidget(
                        users: users!,
                      ),
                      // Ajoutez une description si nécessaire
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
                const Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: PersistentPlayerBar(),
                ),
              ],
            ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Recherche',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: 'Bibliothèque',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

Widget _buildSectionHeader() {
  return Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
    ),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
            ),
            child: const Text(
              "Tout",
              style: TextStyle(color: Colors.white), // Couleur du texte
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
            ),
            child: const Text(
              "Hip-hop",
              style: TextStyle(color: Colors.black), // Couleur du texte
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
            ),
            child: const Text(
              "Gospel",
              style: TextStyle(color: Colors.black), // Couleur du texte
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
            ),
            child: const Text(
              "Afro",
              style: TextStyle(color: Colors.black), // Couleur du texte
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
            ),
            child: const Text(
              "Électronique",
              style: TextStyle(color: Colors.black), // Couleur du texte
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
            ),
            child: const Text(
              "Party",
              style: TextStyle(color: Colors.black), // Couleur du texte
            ),
          ),
        ],
      ),
    ),
  );
}
