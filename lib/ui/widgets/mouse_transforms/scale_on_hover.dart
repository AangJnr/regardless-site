import 'package:flutter/material.dart';

class ScaleOnHover extends StatefulWidget {
  final double scale;
  final Widget child;
  // You can also pass the translation in here if you want to
  const ScaleOnHover({super.key, required this.child, this.scale = 1.1});

  @override
  State<ScaleOnHover> createState() => _ScaleOnHoverState();
}

class _ScaleOnHoverState extends State<ScaleOnHover> {
  final scaleTransform = Matrix4.identity()..scale(1.1);
  final noScaleTransform = Matrix4.identity()..scale(1.0);

  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOutCirc,
        transform: _hovering ? scaleTransform : noScaleTransform,
        child: widget.child,
      ),
    );
  }

  void _mouseEnter(bool hover) {
    setState(() {
      _hovering = hover;
    });
  }
}

class UnderlineOnHover extends StatefulWidget {
  final Widget child;
  final Color underlineColor;
  final double underlineThickness;

  const UnderlineOnHover({
    super.key,
    required this.child,
    this.underlineColor = Colors.black,
    this.underlineThickness = 2.0,
  });

  @override
  State<UnderlineOnHover> createState() => _UnderlineOnHoverState();
}

class _UnderlineOnHoverState extends State<UnderlineOnHover> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _updateHoverState(true),
      onExit: (_) => _updateHoverState(false),
      child: Stack(
        children: [
          widget.child,
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: _isHovering ? 1.0 : 0.0,
              child: Container(
                height: widget.underlineThickness,
                color: widget.underlineColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _updateHoverState(bool isHovering) {
    setState(() {
      _isHovering = isHovering;
    });
  }
}
