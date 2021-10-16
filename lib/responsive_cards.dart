import 'package:flutter/material.dart';

class ResponsiveCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
        backgroundColor: Color(0xFF212239),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Meus cartões de crédito',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(seconds: 1),
                  transitionBuilder: (widget, animation) {
                    return SizeTransition(sizeFactor: animation, child: widget);
                  },
                  child: orientation == Orientation.portrait
                      ? ListView.builder(
                          itemCount: 20,
                          itemBuilder: (context, index) {
                            return Center(
                                child: _CardItem(
                                    color: Colors.primaries[
                                        index % Colors.primaries.length]));
                          })
                      : GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemCount: 20,
                          itemBuilder: (context, index) {
                            return Center(
                                child: _CardItem(
                                    color: Colors.primaries[
                                        index % Colors.primaries.length]));
                          }),
                ),
              )
            ],
          ),
        ));
  }
}

class _CardItem extends StatelessWidget {
  final Color color;

  const _CardItem({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 160,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [color.withOpacity(0.3), color]),
          color: color,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                '\$15,872',
                style: TextStyle(color: Colors.white),
              ),
              CustomPaint(
                painter: MyPainter(),
                size: Size(10.0, 10.0),
              ),
              Spacer(),
              Text(
                '4021 **** **** 2455',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                '4021 **** **** 2455',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'Sued Tech',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
        Offset(size.width - 4, 0),
        14.0,
        Paint()
          ..color = Color(0xFFC1272D)
          ..style = PaintingStyle.fill);
    canvas.drawCircle(
        Offset(size.width - 24, 0),
        14.0,
        Paint()
          ..color = Color(0xFFFBB03B)
          ..style = PaintingStyle.fill);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelagate) => true;
}
