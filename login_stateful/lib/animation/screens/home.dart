import 'package:flutter/material.dart';
import '../widgets/cat.dart';
import 'dart:math';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
   return HomeState();
  }
}

class HomeState extends State<Home> with TickerProviderStateMixin {
  Animation<double> catAnimation,boxAnimation;
  AnimationController catController,boxController;

  initState() {
    super.initState();

    catController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    catAnimation = Tween(begin: -35.0, end: -80.0).animate(
      CurvedAnimation(
        parent: catController,
        curve: Curves.easeIn,
      ),
    );



    boxController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );

    boxAnimation = Tween(begin: pi *0.6, end:  pi *0.65).animate(
      CurvedAnimation(
        parent: catController,
        curve: Curves.easeInOut,
      ),
    );

    boxAnimation.addStatusListener((status) {

      if(status == AnimationStatus.completed){
        boxController.reverse();
      }
      else if(status == AnimationStatus.dismissed){
        boxController.forward();
      }

    });

   // boxController.forward();

  }
  onTap(){

if(catController.status == AnimationStatus.completed) {
  catController.reverse();
  boxController.forward();
}
else if(catController.status == AnimationStatus.dismissed)
  {
    catController.forward();
    boxController.stop();
  }
  }

  build(context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Animation!'),
        ),
        body:GestureDetector(
        child:  Center(
          child:  Stack(
            overflow: Overflow.visible,
            children: [
              buildCatAnimation(),
              buildScrodingersBox(),
              buildLeftFlap(),
              buildRightFlap(),
            ],
          ),
        ),
        onTap:onTap,
        ),
      ),
    );
  }

  Widget buildCatAnimation(){
    return AnimatedBuilder(
      animation: catAnimation,
      builder: (context, child) {
        return Positioned(

            child: child,
          top: catAnimation.value,
          right:0.0,
          left:0.0
        );
      },
      child: Cat(),
    );
  }





  Widget buildBox(){
    return Container(
      height: 200.0,
      width:200.0,
      color:Colors.brown,
    );
    }
  Widget buildScrodingersBox(){
    return Container(
      height: 200.0,
      width:200.0,

        decoration:new BoxDecoration(
        image:  new DecorationImage(
        image: new AssetImage("assets/s.png"),
    fit: BoxFit.cover,),
        ),
    );
  }

  Widget buildLeftFlap(){

    return Positioned(
      left: 3.0,
    child : AnimatedBuilder(

      animation: boxAnimation,
      child : Container(
        height: 10.0,
        width:125.0,
        color:Colors.brown,
      ),
      builder:(context,child){
        return Transform.rotate(
          child: child,
          angle: boxAnimation.value,
          alignment: Alignment.topLeft,
        );
      },
    ),
    );
  }

  Widget buildRightFlap(){
    return Positioned(
      right: 3.0,
      child : AnimatedBuilder(

        animation: boxAnimation,
        child : Container(
          height: 10.0,
          width:125.0,
          color:Colors.brown,
        ),
        builder:(context,child){
          return Transform.rotate(
            child: child,
            angle: -boxAnimation.value,
            alignment: Alignment.topRight,
          );
        },
      ),
    );
  }

}


// ** Class Animation: Record current value and status of property
// ** Class AnimationController : Start,stop,restart ,  Record the duration
// ** Class Tween : Describes the range that the value being animated
// ** Class AnimatedBuilder : everytime the animation changes value builder returns.
// ** Class Position: doesn't care about the content size and stack up all widgets together positionally