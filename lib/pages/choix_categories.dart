import 'package:flutter/material.dart';
import 'package:musik/models/catagory.dart';
import 'package:musik/pages/choix_artistes.dart';
import 'package:musik/repositories/get_categores.dart';
import 'package:musik/utils/colors.dart';

class ChoixCategories extends StatefulWidget {
  const ChoixCategories({super.key});

  @override
  State<ChoixCategories> createState() => _ChoixCategories();
}

class _ChoixCategories extends State<ChoixCategories> {
  //final gridItems = 10;
  final GetCategoriesData getCategoriesData = GetCategoriesData();
  List<TagsModel>? categories;
  Set<String> selectedCategories = <String>{};

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() {
    try {
      // Fetch user data
      final categories_ = getCategoriesData.getCategoriesData();

      setState(() {
        categories = categories_;
      });
    } catch (error) {
      print('Error fetching data: $error');
      // Handle error, show a message, etc.
    }
  }

  void toggleSelectedCategory(String tag) {
    setState(() {
      if (selectedCategories.contains(tag)) {
        selectedCategories.remove(tag);
      } else if (selectedCategories.length < 5) {
        selectedCategories.add(tag);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              Text(
                'Choisissez ',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                '5 categories',
                style: TextStyle(color: buttonColor),
              ),
            ])),
      ),
      body: GridView.builder(
        itemCount: categories?.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          final category = categories![index];
          final isSelected = selectedCategories.contains(category.tag);

          return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            toggleSelectedCategory(category.tag);
                          },
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(category.image),
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
                        Text(category.tag)
                      ])
                ],
              ));
        },
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ChoixArtistes()));
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
