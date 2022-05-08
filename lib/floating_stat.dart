import 'package:flutter/material.dart';
import 'package:opp/pages/stat.dart';

class FloatingStat extends StatefulWidget {
  const FloatingStat({Key? key}) : super(key: key);

  @override
  _FloatingStatState createState() => _FloatingStatState();
}

class _FloatingStatState extends State<FloatingStat> with SingleTickerProviderStateMixin{
  String _buttonText = 'Stats';

  late AnimationController _controller;
  late Animation _roundnessAnimation;
  late Animation _widthAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 600,
      ),
    )..addListener(() {
      setState(() {
        print("in listener.......");
      });
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return Stats();
          }),
        );
      }
      if(status == AnimationStatus.completed){
        setState(() {
          _buttonText = 'Stats';
        });
        _controller.reset();
      }
    });

    _roundnessAnimation = Tween(begin: 10.0, end: 25.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ));

    _widthAnimation = Tween(begin: 250.0, end: 40.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _buttonText = '';
            //Starts animation
            _controller.forward();
          });
        },
        child: Hero(
          tag: 'blackBox',
          flightShuttleBuilder: (
              BuildContext flightContext,
              Animation<double> animation,
              HeroFlightDirection flightDirection,
              BuildContext fromHeroContext,
              BuildContext toHeroContext,
              ) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
            );
          },
          child: Container(
            width:  _widthAnimation.value,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(_roundnessAnimation.value),
            ),
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _buttonText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                      fontSize: 25.0
                    ),
                  ),
                  SizedBox(width: 12.0,),
                  Icon(Icons.query_stats,color: Colors.white,size: 25.0,)
                ],
              ),
            )
          ),
        ),
      ),
    );
  }
}
