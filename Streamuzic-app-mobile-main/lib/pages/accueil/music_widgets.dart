import 'package:flutter/material.dart';
import 'package:musik/models/song_model.dart';
import 'package:musik/models/user.dart';
import 'package:musik/pages/player_screen.dart';
import 'package:musik/utils/colors.dart';

class TrendWidget extends StatelessWidget {
  final List<String> imageUrls;

  const TrendWidget({super.key, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Tendances',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: imageUrls.length,
            itemBuilder: (context, index) {
              return TrendItem(imageUrl: imageUrls[index]);
            },
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class AlbumWidget extends StatelessWidget {
  final List<SongModel> songs;

  const AlbumWidget({super.key, required this.songs});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Albums',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: songs.length,
            itemBuilder: (context, index) {
              return AlbumItem(song: songs[index]);
            },
          ),
        ),
      ],
    );
  }
}

class ArtistWidget extends StatelessWidget {
  final List<User> users;

  const ArtistWidget({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Artistes',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: users.length,
            itemBuilder: (context, index) {
              return ArtistItem(user: users[index]);
            },
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class TrendItem extends StatelessWidget {
  final String imageUrl;

  const TrendItem({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Gérer le clic sur l'image tendance
      },
      child: Container(
        width: 150,
        height: 150,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class AlbumItem extends StatelessWidget {
  final SongModel song;

  const AlbumItem({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          // Gérer le clic sur l'image d'album
          //audioManager.audioPlayer.dispose();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PlayerScreen(song: song)));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 120,
              height: 120,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(song.coverImageUrl!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            SizedBox(
              width: 120,
              child: Text(
                song.songname!,
                style: const TextStyle(
                  color: buttonColor,
                ),
              ),
            ),
            Text(song.name!),
          ],
        ));
  }
}

class ArtistItem extends StatelessWidget {
  final User user;

  const ArtistItem({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          // Gérer le clic sur l'image de l'artiste
        },
        child: SizedBox(
          child: Container(
            height: 100,
            width: 100,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(user.avatar!),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ));
  }
}

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _previousSearches = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Recherche',
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
      body: Container(
        color: const Color(0xFF222121),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText:
                          'Rechercher des artistes, des chansons, des albums, des listes de lecture',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      filled: true,
                      fillColor: Colors.white, // Fond gris clair
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    // Ajouter la recherche actuelle à la liste des recherches précédentes
                    String currentSearch = _searchController.text.trim();
                    if (currentSearch.isNotEmpty) {
                      setState(() {
                        _previousSearches.add(currentSearch);
                      });
                    }
                    // Ajoutez ici le code pour effectuer la recherche
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Liste des recherches précédentes
            if (_previousSearches.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Recherches précédentes',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: _previousSearches.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_previousSearches[index]),
                        onTap: () {
                          // Ajoutez ici le code pour traiter la recherche précédente sélectionnée
                        },
                      );
                    },
                  ),
                ],
              ),
            // Liste des résultats de recherche récents
            const Text(
              'Récents',
              style: TextStyle(fontSize: 18),
            ),
            const ListTile(
              tileColor: Colors.white,
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://i.pravatar.com/180'),
              ),
              title: Text(
                'Justin Bieber',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                'Say my name',
                style: TextStyle(color: Colors.white),
              ),
              trailing: Text(
                'Before you',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const ListTile(
              tileColor: Colors.white,
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://i.pravatar.com/180'),
              ),
              title: Text(
                'Rihanna',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                'Diamonds',
                style: TextStyle(color: Colors.white),
              ),
              trailing: Text(
                'Before you',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
