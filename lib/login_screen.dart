import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var heightmedia, widthmedia;
  void initState()
  {
    super.initState();
  }


  final _formkey = GlobalKey<FormState>();

  TextEditingController _emailcontroller = TextEditingController();

  TextEditingController _passwordcontroller = TextEditingController();

  @override
  void dispose()
  {
    _emailcontroller.dispose();

    _passwordcontroller.dispose();

    super.dispose();
  }

  @override

  Widget build(BuildContext context) {
    heightmedia = MediaQuery.of(context).size.height / 683;
    widthmedia = MediaQuery.of(context).size.width / 411;
    return  Scaffold(
        body: Form(
          key: _formkey,
                  child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              color: Color(0xffc4d4d1),
              child: ListView(
                children: <Widget>[
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Container(
                        color: Color(0xffffffff),
                        height: heightmedia * 600,
                        width: widthmedia * 380,
                        child: Stack(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 70.0),
                              child: Container(
                                height: heightmedia * 50,
                                width: widthmedia * 10,
                                color: Colors.pink,
                              ),
                            ),
                            Positioned(
                              top: heightmedia * 74,
                              left: widthmedia * 16,
                              child: Text("Login",
                                  style: TextStyle(
                                    color:  Colors.pink,
                                    fontSize: widthmedia * 40,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  )),
                            ),
                  
                                Positioned(
                                top: heightmedia * 177.0,
                                left: widthmedia * 16.0,
                                child: Container(
                                  width: widthmedia * 350.0,
                                  child: TextFormField(
                                    controller: _emailcontroller,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                                labelText: '    Email',
                                                hintText: '    Email',
                                            ),
                                            validator: (value){
                                              if(value.isEmpty){
                                                return 'Please Fill Email Input';
                                              }
                                            },
                                          ),
                                )),
                  
                            Positioned(
                                top: heightmedia * 260.0,
                                left: widthmedia * 16.0,
                                child: Container(
                                  width: widthmedia * 350.0,
                                child: TextFormField(
                                       obscureText: true,
                                    controller: _passwordcontroller,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                               labelText: '    Password',
                                          hintText: '    Password',
                                            ),
                                            validator: (value){
                                              if(value.isEmpty){
                                        return 'Please Fill Password Input';
                                                }
                                            },
                                          ),
                                )),
                          Positioned(
                              top: heightmedia * 375,
                              left: widthmedia * 16,
                              child: Container(
                                width: widthmedia * 350,
                                height: heightmedia * 45,
                                child: RaisedButton(
                                  shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.all(
                                          Radius.circular(8.0))),
                                  color:  Colors.pink,
                                  child: Text("Login",
                                      style: TextStyle(
                                        //  fontFamily: 'Roboto',
                                        color: Color(0xffffffff),
                                        fontSize: widthmedia * 16,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                      )),
                                 onPressed: () async {
                                          if(_formkey.currentState.validate()){

                                            var result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailcontroller.text, password: _passwordcontroller.text);

                                            if(result != null){

                                              // print("welcome");
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(builder: (context) => HomeScreen()),
                                              );
                                            }else{
                                              print('user not found');
                                            }
                                          }
                                        },
                                ),
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      
    );
  }
}