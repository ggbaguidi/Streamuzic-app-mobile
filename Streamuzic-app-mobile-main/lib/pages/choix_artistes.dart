import 'package:flutter/material.dart';
import 'package:musik/models/user.dart';
import 'package:musik/pages/accueil/accueil_screens.dart';
import 'package:musik/repositories/get_home_page.dart';
import 'package:musik/utils/colors.dart';

class ChoixArtistes extends StatefulWidget {
  const ChoixArtistes({super.key});

  @override
  State<ChoixArtistes> createState() => _ChoixArtistes();
}

class _ChoixArtistes extends State<ChoixArtistes> {
  final GetHomePage getHomePage = GetHomePage();
  List<User>? artistes;
  Set<String> selectedArtistes = <String>{};

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future<void> fetchData() async {
    try {
      // Fetch user data
      final artistes_ = await getHomePage.getUsers();

      setState(() {
        artistes = artistes_;
      });
    } catch (error) {
      print('Error fetching data: $error');
      // Handle error, show a message, etc.
    }
  }

  void toggleSelectedArtistes(String tag) {
    setState(() {
      if (selectedArtistes.contains(tag)) {
        selectedArtistes.remove(tag);
      } else if (selectedArtistes.length < 5) {
        selectedArtistes.add(tag);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return artistes == null
          ? const Center(child: CircularProgressIndicator())
          : Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
          toolbarHeight: 100.0,
          backgroundColor: backgroundColor,
          leading: BackButton(
            color: buttonColor,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: const Row(children: [
            Text(
              'Choisissez 5',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              ' Artistes',
              style: TextStyle(color: buttonColor),
            ),
          ])),
      body: GridView.builder(
        itemCount: artistes?.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          final artist = artistes![index];
          final isSelected = selectedArtistes.contains(artist.username);

          return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            toggleSelectedArtistes(artist.username!);
                          },
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(90.0),
                                  image: DecorationImage(
                                    image: NetworkImage(artist.avatar!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              if (isSelected)
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: const Icon(
                                    Icons.check,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Text(artist.name!)
                      ])
                ],
              ));
        },
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AccueilHomePage()));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
        ),
        child: const Text(
          'Valider',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
