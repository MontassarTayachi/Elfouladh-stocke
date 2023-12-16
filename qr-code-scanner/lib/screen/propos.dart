import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../class/Product.dart';

class SnappingList extends StatefulWidget {
  const SnappingList({Key? key}) : super(key: key);

  @override
  _SnappingListState createState() => _SnappingListState();
}

class _SnappingListState extends State<SnappingList> {
  List<Product> productList = [
    Product('images/ACIERIE-1.png', 'BILLETTES',
        "La seule Entreprise qui fabrique les billettes en marché locale.Plus de 50 ans d'expérience."),
    Product('images/DESM-1.png', 'AROND A BETON',
        "Une diversité des produits avec plusieurs diamètres , telle que le rond à béton , rond lisse et fer marchand."),
    Product('images/LAMINOIRS-1.png', 'FILS',
        "Plusieurs types des fils avec une variété dans les diamètres , ainsi que  la galvanisation de ces dernier."),
    Product('images/TREFILERIE-1.png', 'STRUCTURES METALIQUES',
        '''Différents produits et activité telle que les pylônes , charpentes métalliques et la galvanisation.'''),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Nos activités'.toUpperCase(),
            style: TextStyle(
                color: Color.fromRGBO(0, 151, 230, 1),
                fontWeight: FontWeight.bold,
                fontFamily: 'Preahvihear-Regular'),
          ),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(236, 240, 241, 1),
          elevation: 0.0,
        ),
        body: Container(
          child: Swiper(
            itemBuilder: _buildListItem,
            pagination: SwiperPagination(),
            itemCount: productList.length,
          ),
        ));
  }

  Widget _buildListItem(BuildContext context, int index) {
    Product product = productList[index];
    return FractionallySizedBox(
      widthFactor: 0.99,
      heightFactor: 0.8,
      child: Container(
        child: Center(
          child: Card(
            elevation: 12,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              child: Column(
                children: [
                  Image.asset(
                    product.imagePath,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          product.title,
                          style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontStyle: FontStyle.italic),
                        ),
                        Text(
                          product.text,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromARGB(255, 14, 16, 19),
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
