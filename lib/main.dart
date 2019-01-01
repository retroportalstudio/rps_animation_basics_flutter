import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  title: 'My Clock',
  home:HomeScreen(),
    theme: ThemeData(fontFamily: 'Berlin'),
));

class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{

  Animation animation;
  AnimationController animationController;

  HomeScreenState();

  _currentTime(){
    return "${DateTime.now().hour} : ${DateTime.now().minute}";
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this,duration: Duration(seconds: 1));
    animationController.addListener((){

      if(animationController.isCompleted){
        animationController.reverse();
      } else if(animationController.isDismissed){
        animationController.forward();
      }
      setState(() {

      });
    });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {

    animation = CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
    animation = Tween(begin: -0.5,end: 0.5).animate(animation);

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Clock',style: TextStyle(
          fontSize: 32.0
        ),)),
        backgroundColor: Colors.deepOrange,
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.deepOrange,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            children: <Widget>[
              Material(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                elevation: 10.0,
                color: Colors.brown.shade900,
                child: Container(
                  width: 320,
                  height: 320,
                  child: Center(
                    child: Text(_currentTime(),style: TextStyle(
                      fontSize: 60.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
              ),
              Transform(
                alignment: FractionalOffset(0.5,0.1),
                transform: Matrix4.rotationZ(animation.value),
                child: Container(
                  child: Image.asset('images/pandulum.png',width: 100,height: 250,),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}
