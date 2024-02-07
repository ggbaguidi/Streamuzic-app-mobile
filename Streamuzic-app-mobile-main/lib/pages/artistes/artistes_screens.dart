import 'package:flutter/material.dart';
import 'package:musik/utils/colors.dart';

class ListArtistes extends StatefulWidget {
  const ListArtistes({super.key});

  @override
  State<ListArtistes> createState() => _ListArtistes();
}

class _ListArtistes extends State<ListArtistes> {
  final gridItems = 10;

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
          title: const Row(children: [
            Text(
              ' Artistes',
              style: TextStyle(color: buttonColor),
            ),
          ])),
      body: GridView.builder(
        itemCount: gridItems,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(25.0),
                      child: Placeholder(
                        fallbackHeight: 80,fallbackWidth: 80
                         , strokeWidth: 5, color: Colors.white),
                    )
                  ),
                  Text(index.toString())
                ],
              ));
        },
      ),
    );
  }
}
