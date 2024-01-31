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
