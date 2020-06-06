import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  List <String> proudctsOnCart ;
  int nomberOfProducts;
  CartScreen({this.proudctsOnCart,this.nomberOfProducts});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    var heightmedia = MediaQuery.of(context).size.height / 683;
  var  widthmedia = MediaQuery.of(context).size.width / 411;
    return Scaffold(
      backgroundColor: Color(0xffc4d4d1),
      appBar: AppBar(
        title:  Text('Cart'),
      ),
        body: ListView(
          children: <Widget>[
            GridView.count(
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              shrinkWrap: true,
              children: List.generate(
                widget.nomberOfProducts,
                (index) {
                  return Container(
                      margin: EdgeInsets.all(8),
                      child: Container(
                        padding: EdgeInsets.only(
                            left: widthmedia * 10.0,
                            right: widthmedia * 10.0,
                            top: heightmedia * 5.0,
                            bottom: heightmedia * 5.0),
                            child: Image.asset(
                            widget.proudctsOnCart[index],
                            height: heightmedia * 150,
                            width: widthmedia * 150,
                          ), 
                        // child: FlatButton(
                        //   child: Image.asset(
                        //     products[index],
                        //     height: heightmedia * 150,
                        //     width: widthmedia * 150,
                        //   ),
                        //   onPressed: () {
                        //     setState(() {
                        //       // Navigator.push(
                        //       //     context,
                        //       //     MaterialPageRoute(
                        //       //         builder: (context) => Gift(
                        //       //               pathImage: widget.pathImage,
                        //       //               pathRate: iconrate[index],
                        //       //             )));
                        //     });
                        //   },
                        // ),
                      ));
                },
              ),
            ),
          ],
        ),
      
    );
  }
}