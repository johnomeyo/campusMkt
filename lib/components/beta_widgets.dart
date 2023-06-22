import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/products.dart';
import '../pages/prodduct_display.dart';
import 'alpha_widgets.dart';

class LoginOptionTile extends StatelessWidget {
  const LoginOptionTile({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade200)),
      height: 80,
      width: 80,
      child: Center(
          child: Image.asset(
        imageUrl,
        height: 50,
        width: 50,
      )),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDisplayPage(
                      product: product,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 125,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(
                        product.imageUrl,
                      ),
                      fit: BoxFit.cover)),
              child:  const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MyFavoriteIcon(),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  product.price,
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w900, letterSpacing: 1),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
// class ProductCard extends StatelessWidget {
//   const ProductCard({Key? key, required this.product});

//   final Product product;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ProductDisplayPage(product: product),
//           ),
//         );
//       },
//       child: Container(
//         decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Container(
//               height: 125,
//               width: double.maxFinite,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadiusDirectional.circular(10),
//                 image: DecorationImage(
//                   image: NetworkImage(product.imageUrl),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         // Use the FavIcon widget here
//                         FavIcon(product: product),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const Spacer(),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Text(
//                   product.name,
//                   style: TextStyle(
//                     color: Colors.grey.shade500,
//                     fontWeight: FontWeight.w900,
//                     letterSpacing: 1,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Text(
//                   product.price,
//                   style: GoogleFonts.lato(
//                     textStyle: const TextStyle(
//                       fontWeight: FontWeight.w900,
//                       letterSpacing: 1,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class FavIcon extends StatefulWidget {
//   final Product product;

//   const FavIcon({Key? key, required this.product});

//   @override
//   _FavIconState createState() => _FavIconState();
// }

// class _FavIconState extends State<FavIcon> {
//   late bool isFav;

//   @override
//   void initState() {
//     super.initState();
//     isFav = false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           isFav = !isFav;
//         });
//       },
//       child: Container(
//         height: 40,
//         width: 40,
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.grey.shade200),
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Center(
//           child: Icon(
//             isFav ? Icons.favorite : Icons.favorite_outline_outlined,
//             color: Colors.black,
//           ),
//         ),
//       ),
//     );
//   }
// }
