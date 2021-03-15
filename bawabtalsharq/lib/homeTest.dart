import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'Utils/images.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: mostPopularCateg(
            onPress: (){},
            backgroundColor: Colors.white70,
            productImg: AssetImage(productImage),
            iconFavo: AssetImage(productIcon1),
            iconAdd: AssetImage(productIcon2),
            nameProduct: 'Red Shose',
            price: '800.00  EGP'
          )





          // subMostPopularProduct(onPress: (){},
          //     backgroundColor: Colors.yellow,
          //     productImg: AssetImage(productImage),
          //     iconFavo: AssetImage(productIcon1) ,
          //     iconAdd: AssetImage(productIcon2),
          //     nameProduct: 'Egypation Food',
          //     nameCategory: 'Food',
          //     price: '\$120.00'),
        ),
      ),
    );


  }
}

