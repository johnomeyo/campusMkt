import 'package:campus_market_place/providers.dart/alpha.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Center(
            child: Icon(
          Icons.arrow_back,
          color: Colors.grey.shade500,
        )),
      ),
    );
  }
}

class MyFavoriteIcon extends StatelessWidget {
  const MyFavoriteIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<FavIcon>(context, listen: false).changeisFav();
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Consumer<FavIcon>(
          builder: (BuildContext context, value, Widget? child) {
            return Center(
              child: Icon(
                value.isFav ? Icons.favorite : Icons.favorite_outline_outlined,
                color: Colors.black,
              ),
            );
          },
        ),
      ),
    );
  }
}

class ProductQualitiesTile extends StatelessWidget {
  const ProductQualitiesTile(
      {super.key, required this.quality, required this.value});
  final String quality;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade200)),
      child: Column(children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          quality,
          style: const TextStyle(fontSize: 15, color: Colors.grey),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          value,
          style: TextStyle(
              fontSize: 20,
              color: Colors.grey.shade700,
              fontWeight: FontWeight.w600),
        ),
      ]),
    );
  }
}

class CallButton extends StatelessWidget {
  const CallButton({super.key});
  void call() {}
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: call,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade200),
          color: Colors.white,
        ),
        child: Center(
            child: Icon(
          Icons.call_outlined,
          color: Colors.grey.shade500,
        )),
      ),
    );
  }
}
