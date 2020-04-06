import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _iconAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    _iconAnimation = CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.easeOutCubic);

    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image(
          image: AssetImage("assets/login_background.jpg"),
          fit: BoxFit.cover,
          color: Colors.black45,
          colorBlendMode: BlendMode.darken,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new FlutterLogo(
              size: _iconAnimation.value,
            ),
            Container(
              padding: EdgeInsets.all(40),
              child: Theme(
                data: ThemeData(
                    brightness: Brightness.dark,
                    primarySwatch: Colors.teal,
                    inputDecorationTheme: InputDecorationTheme(
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.teal,
                      ),
                    )),
                child: Form(
                    child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(labelText: "Enter email"),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Enter password"),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 40),
                    ),
                    RaisedButton(
                      onPressed: () {},
                      color: Colors.teal,
                      child: Text("Login"),
                      textColor: Colors.white,
                    )
                  ],
                )),
              ),
            )
          ],
        )
      ],
    );
  }
}
