import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<TheIcon>(
      builder: (BuildContext context, value, Widget? child) {
        return ListView(
          children: [
            ListTile(
                leading: const Icon(Icons.add),
                title: const Text("Hello"),
                trailing: GestureDetector(
                    onTap: () {
                      Provider.of<TheIcon>(context, listen: false)
                          .changeIsFav();
                    },
                    child: value.isFav
                        ? const Icon(Icons.favorite_outline)
                        : const Icon(Icons.favorite))),
            ListTile(
                leading: const Icon(Icons.pin_drop),
                title: const Text("Kings"),
                trailing: GestureDetector(
                    onTap: () {
                      Provider.of<TheIcon>(context, listen: false)
                          .changeIsFav();
                    },
                    child: value.isFav
                        ? const Icon(Icons.favorite_outline)
                        : const Icon(Icons.favorite))),
            ListTile(
                leading: const Icon(Icons.add),
                title: const Text("Hello"),
                trailing: GestureDetector(
                    onTap: () {
                      Provider.of<TheIcon>(context, listen: false)
                          .changeIsFav();
                    },
                    child: value.isFav
                        ? const Icon(Icons.favorite_outline)
                        : const Icon(Icons.favorite))),
          ],
        );
      },
    ));
  }
}

class TheIcon extends ChangeNotifier {
  bool isFav = true;
  void changeIsFav() {
    isFav = !isFav;
    notifyListeners();
  }
}
