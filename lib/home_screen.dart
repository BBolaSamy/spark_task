import 'package:flutter/material.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<String> products = [
    "assets/note10.jpg",
   "assets/pixel4.jpg",
    "assets/8pro.jpg",

  ];
  List <String> selectedProduct = [];
  @override
  Widget build(BuildContext context) {
   var heightmedia = MediaQuery.of(context).size.height / 683;
  var  widthmedia = MediaQuery.of(context).size.width / 411;
    return Scaffold(
      backgroundColor: Color(0xffc4d4d1),
      appBar: AppBar(
        title:  Text('Home'),
        actions: <Widget>[
          IconButton(
            icon:  Icon(Icons.shopping_cart),
            tooltip: 'Go To Cart',
            onPressed: () {
                  setState(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CartScreen(
                                            proudctsOnCart:selectedProduct ,
nomberOfProducts: selectedProduct.length,
                                          )));});
                          
            },
          ),
          
        ],
      ),
        body: ListView(
          children: <Widget>[
            GridView.count(
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              shrinkWrap: true,
              children: List.generate(
                3,
                (index) {
                  return Container(
                      margin: EdgeInsets.all(8),
                      child: Container(
                        padding: EdgeInsets.only(
                            left: widthmedia * 10.0,
                            right: widthmedia * 10.0,
                            top: heightmedia * 5.0,
                            bottom: heightmedia * 5.0),
                            child: Stack(
                              children: <Widget>[
                          Image.asset(
                            products[index],
                            height: heightmedia * 150,
                            width: widthmedia * 150,
                          ), 
                           Padding(
                             padding:  EdgeInsets.only(top:120.0),
                             child: ClipRRect(
                                borderRadius: BorderRadius.circular(30.0),
                                child: Container(
                                 color: Colors.pink,
                                 child: IconButton(
            icon:  Icon(Icons.add_shopping_cart),
            color: Colors.white,
            onPressed: () {
              setState(() {
                selectedProduct.add(products[index]);
                print(selectedProduct);
              });
            },
          ),
                               ),
                             ),
                           ),
                                                       ],
                            ),
                        
                      ));
                },
              ),
            ),
          ],
        ),
      
    );
  }
}