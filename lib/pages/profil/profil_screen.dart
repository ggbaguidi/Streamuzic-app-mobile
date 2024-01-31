import 'package:flutter/material.dart';
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
        child: Text('Demo: Page Two'),
      ),
      endDrawer: const MyDrawerProfile(),
    );
  }
}

class Help extends StatelessWidget {
  const Help({super.key});

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
        child: Text('Demo: Page Three'),
      ),
      endDrawer: const MyDrawerProfile(),
    );
  }
}

class UpdateProfil extends StatelessWidget {
  const UpdateProfil({super.key});

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
        child: Text('Demo: Page Four'),
      ),
      endDrawer: const MyDrawerProfile(),
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
            child: Text("Mon compte", style: TextStyle(color: buttonColor, fontWeight: FontWeight.bold),),
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
                              Text("John Doe", style: TextStyle(color: Colors.white, fontSize: 16),),
                              SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                children: [
                                  Column(
                                    children: [Text("3K", style: TextStyle(color: Colors.white, fontSize: 16),), Text("followers", style: TextStyle(color: buttonColor, fontSize: 10),)],
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Column(
                                    children: [Text("20", style: TextStyle(color: Colors.white, fontSize: 16),), Text("following", style: TextStyle(color: buttonColor, fontSize: 10),)],
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
            leading: const Icon(IconData(0xe800)),
            title: const Text('Modifier le profil', style: TextStyle(color: Colors.white, fontSize: 16),),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const UpdateProfil()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.library_music),
            title: const Text('Bibliothèque', style: TextStyle(color: Colors.white, fontSize: 16),),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Bibliotheque()),
              );
            },
          ),
          ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Paramètres et confidentialité', style: TextStyle(color: Colors.white, fontSize: 16),),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Settings()),
                );
              }),
          ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Aide', style: TextStyle(color: Colors.white, fontSize: 16),),
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
