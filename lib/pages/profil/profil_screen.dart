import 'package:flutter/material.dart';
import 'package:musik/pages/accueil/accueil_screens.dart';
import 'package:musik/utils/colors.dart';

class Bibliotheque extends StatelessWidget {
  const Bibliotheque({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page One"),
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
      body: const Center(
        child: Text('Demo: Page One'),
      ),
      endDrawer: const MyDrawerProfile(),
    );
  }
}

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text(
          'Paramètres',
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: const Text(
                'Général',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
              onTap: () {
                // Code pour ouvrir l'onglet Général
              },
            ),
            // Onglet A propos
            ListTile(
              title: const Text(
                'A propos',
                style: TextStyle(
                  color: Colors.white, // Texte en blanc
                  fontSize: 18.0, // Taille de la police
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Apropos()),
                );
              },
            ),
            // Onglet Se déconnecter
            ListTile(
              title: const Text(
                'Se déconnecter',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
              onTap: () {
                // Code pour se déconnecter
              },
            ),
          ],
        ),
      ),
      endDrawer: const MyDrawerProfile(),
    );
  }
}

class Help extends StatelessWidget {
  const Help({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text(
          'Aide Musique',
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
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.contain,
              height: 20,
            ),
          ),
          const SizedBox(height: 16.0),
          const Text(
            'Centre d’aide Musik',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8.0),
          const Text(
            'En quoi pouvons-nous vous aider ?',
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.white,
              backgroundColor: Color(0xFFEC0048),
            ),
          ),
          const SizedBox(height: 8.0),
          const Text(
            'Quelques questions fréquentes',
            style: TextStyle(
              fontSize: 13.0,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16.0),
          const ListTile(
            title: Text(
              'Comment lire une chanson ?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding:
                EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
            child: Text(
              "Pour écouter une chanson sur notre application, il vous suffit de rechercher le titre, l'artiste ou l'album souhaité dans la barre de recherche. Une fois la chanson trouvée, appuyez simplement sur le bouton de lecture. Vous pouvez également explorer nos playlists recommandées ou créer la vôtre. Profitez de la musique en continu, et n'oubliez pas de consulter les options de personnalisation disponibles pour une expérience encore plus enrichissante.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 10.0,
              ),
            ),
          ),
          const ListTile(
            title: Text(
              'Comment créer une playlist ?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding:
                EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
            child: Text(
              "Personnalisez votre expérience musicale en créant vos propres playlists. Accédez à la section <Playlists> de l'application, appuyez sur 'Créer une playlist', donnez-lui un nom et ajoutez vos chansons préférées. Vous pouvez réorganiser l'ordre des chansons et même partager vos playlists avec d'autres utilisateurs. Créez des ambiances uniques pour différentes occasions et découvrez de nouvelles façons de profiter de votre musique préférée.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 10.0,
              ),
            ),
          ),
          const ListTile(
            title: Text(
              'Est-ce que je peux partager une musique ?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding:
                EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
            child: Text(
              "Bien sûr ! Partager vos découvertes musicales avec vos amis est simple. Lorsque vous écoutez une chanson que vous aimez, recherchez l'option de partage et choisissez la plateforme de votre choix. Que ce soit par message, e-mail ou sur les réseaux sociaux, propagez la bonne musique et faites découvrir à vos amis de nouveaux morceaux. La musique est faite pour être partagée, et notre application facilite ce processus.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 10.0,
              ),
            ),
          ),
        ],
      ),
      endDrawer: const MyDrawerProfile(),
    );
  }
}

class UpdateProfil extends StatefulWidget {
  const UpdateProfil({Key? key}) : super(key: key);

  @override
  State<UpdateProfil> createState() => _UpdateProfilState();
}

class _UpdateProfilState extends State<UpdateProfil> {
  String _userName = "John Doe";
  final String _userImageUrl = 'assets/images/user_profil.png';
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = _userName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text(
          "Modifier le profil",
          style: TextStyle(
            color: Color(0xFFEC0048),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              _saveProfileChanges();
            },
          ),
        ],
      ),
      backgroundColor: const Color(0xFF222121),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  _changeOrDeletePhoto();
                },
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(_userImageUrl),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Name: ',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _nameController,
                      onChanged: (value) {
                        _userName = value;
                      },
                      enabled: false,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      _editName();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Fonction pour sauvegarder les modifications du profil
  void _saveProfileChanges() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Profil mis à jour avec succès!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _changeOrDeletePhoto() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Photo de profil',
            style: TextStyle(
              color: Color(0xFFEC0048),
            ),
          ),
          backgroundColor: const Color(0xFF222121),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.photo, color: Colors.white),
                title: const Text('Changer la photo',
                    style: TextStyle(fontSize: 13, color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete, color: Colors.white),
                title: const Text('Supprimer la photo',
                    style: TextStyle(fontSize: 13, color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _editName() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Modifier le nom',
            style: TextStyle(
              color: Color(0xFFEC0048),
            ),
          ),
          backgroundColor: const Color(0xFF222121),
          content: TextField(
            controller: _nameController,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              labelText: 'Nouveau nom',
              labelStyle: TextStyle(fontSize: 13, color: Colors.white),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Annuler',
                  style: TextStyle(fontSize: 13, color: Colors.white)),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _userName = _nameController.text;
                });
                Navigator.pop(context);
              },
              child: const Text('Enregistrer',
                  style: TextStyle(fontSize: 13, color: Colors.white)),
            ),
          ],
        );
      },
    );
  }
}

class Apropos extends StatelessWidget {
  const Apropos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'A propos',
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ListTile(
              title: Text(
                'Version',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
            // Onglet A propos
            const ListTile(
              title: Text(
                'MUSIK version 1.0',
                style: TextStyle(
                  color: Colors.white, // Texte en blanc
                  fontSize: 14.0, // Taille de la police
                ),
              ),
            ),
            ListTile(
              title: const Text(
                'Termes et Conditions',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Termes()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Termes extends StatelessWidget {
  const Termes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Termes et Conditions',
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.contain,
                  height: 20,
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Termes et Conditions',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                "Bienvenue sur Musik, la plateforme de streaming musical en ligne. En accédant à notre application, vous acceptez nos conditions générales, notamment l'obligation de respecter les droits de propriété intellectuelle du contenu musical, de maintenir la confidentialité de votre compte, et de garantir la légitimité du contenu soumis. Les paiements et abonnements sont sujets à des conditions spécifiques, et toute violation de ces règles peut entraîner la résiliation de l'accès à l'application. Nous collectons et utilisons vos informations conformément à notre politique de confidentialité. Nous nous réservons le droit de modifier ces conditions à tout moment, et toute utilisation continue de l'application après de telles modifications constitue votre acceptation des termes révisés.",
                style: TextStyle(
                  fontSize: 14.0,
                  color: Color(0xFF9E9E9E),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyDrawerProfile extends StatelessWidget {
  const MyDrawerProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: backgroundColor,
      child: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20.0, left: 20.0),
            child: Text(
              "Mon compte",
              style: TextStyle(color: buttonColor, fontWeight: FontWeight.bold),
            ),
          ),
          DrawerHeader(
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset('assets/images/user_profil.png'),
                    const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Column(
                            children: [
                              Text(
                                "John Doe",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "3K",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                      Text(
                                        "followers",
                                        style: TextStyle(
                                            color: buttonColor, fontSize: 10),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "20",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                      Text(
                                        "following",
                                        style: TextStyle(
                                            color: buttonColor, fontSize: 10),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text(
              'Accueil',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AccueilHomePage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(IconData(0xe800)),
            title: const Text(
              'Modifier le profil',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const UpdateProfil()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.library_music),
            title: const Text(
              'Bibliothèque',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Bibliotheque()),
              );
            },
          ),
          ListTile(
              leading: const Icon(Icons.settings),
              title: const Text(
                'Paramètres et confidentialité',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Settings()),
                );
              }),
          ListTile(
              leading: const Icon(Icons.help),
              title: const Text(
                'Aide',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Help()),
                );
              }),
        ],
      ),
    );
  }
}
