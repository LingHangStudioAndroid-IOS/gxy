import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SchAppbar extends StatefulWidget {
  const SchAppbar({Key? key}) : super(key: key);

  @override
  _SchAppbarState createState() => _SchAppbarState();
}

class _SchAppbarState extends State<SchAppbar> with TickerProviderStateMixin {
  // late Animation<double> _sizeAnimation;
  // late Animation<Color> _colorAnimation;
  // late AnimationController _sizeAnimationController;
  // late AnimationController _colorAnimationController;

  late Animation _animation;
  late AnimationController _animationController;

  late Animation _colorAnimation;
  late AnimationController _colorController;
  // late double _size = 0;
  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 6))
          ..addListener(() {
            setState(() {});
          });
    _colorController =
        AnimationController(vsync: this, duration: Duration(seconds: 6))
          ..addListener(() {
            setState(() {});
          });
    // _animation = Tween(begin: 30.0, end: 100.0).animate(CurvedAnimation(
    //     parent: _animationController, curve: const Interval(0.5, 1.0)));
    _colorAnimation = _colorController.drive(ColorTween(
      begin: Colors.red,
      end: Colors.blue,
    ));
    _animation = TweenSequence([
      TweenSequenceItem(
          tween: Tween(
            begin: 0.0,
            end: 200.0,
          ),
          weight: 40),
    ]).animate(_animationController);
    // _colorAnimation =
    //     Tween(begin: Colors.red, end: Colors.blue).animate(_colorController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.red,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  _tap();
                },
                icon: Icon(Icons.keyboard_arrow_down),
              ),
            ],
          ),
          Wrap(
            children: [
              SizedBox(
                  height: _animation.value,
                  child: GridView.builder(
                      itemCount: 9,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10.0,
                        childAspectRatio: 1.0,
                        mainAxisExtent: 25,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: _colorAnimation.value,
                            shape: BoxShape.circle,
                          ),
                        );
                      })),
              Container(
                color: Colors.blue,
                height: 50,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
    _colorController.dispose();
  }

  void _tap() {
    if (_animation.value != 0) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
    _colorController.forward();
  }
}
