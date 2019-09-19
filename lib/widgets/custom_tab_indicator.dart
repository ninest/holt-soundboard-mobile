import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class CustomTabIndicator extends Decoration {
  final BuildContext context;
  final double indicatorHeight;

  const CustomTabIndicator({
    this.context,
    this.indicatorHeight: 20.0,
  });

  @override
  _CustomPainter createBoxPainter([VoidCallback onChanged]) {
    return new _CustomPainter(this, onChanged);
  }

}

class _CustomPainter extends BoxPainter {

  final CustomTabIndicator decoration;

  _CustomPainter(this.decoration, VoidCallback onChanged)
      : assert(decoration != null),
        super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);
    assert(configuration.size != null);
    
    //offset is the position from where the decoration should be drawn.
    //configuration.size tells us about the height and width of the tab.
    final Rect rect = Offset(offset.dx, (configuration.size.height/2) - decoration.indicatorHeight/2) & Size(configuration.size.width, decoration.indicatorHeight);
    final Paint paint = Paint();
    paint.color = Theme.of(decoration.context).focusColor;
    paint.style = PaintingStyle.fill;
    canvas.drawRRect(RRect.fromRectAndRadius(rect, Radius.circular(5.0)), paint);
  }

}