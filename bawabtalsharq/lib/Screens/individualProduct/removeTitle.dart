import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RemoveTitleAppBar extends StatefulWidget {
  final Widget child;
  const RemoveTitleAppBar({
    Key key,
    @required this.child,
  }) : super(key: key);
  @override
  _RemoveTitleAppBarState createState() {
    return new _RemoveTitleAppBarState();
  }
}

class _RemoveTitleAppBarState extends State<RemoveTitleAppBar> {
  ScrollPosition _position;
  bool _visible;
  @override
  void dispose() {
    _removeListener();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _removeListener();
    _addListener();
  }

  void _addListener() {
    _position = Scrollable.of(context)?.position;
    _position?.addListener(_positionListener);
    _positionListener();
  }

  void _removeListener() {
    _position?.removeListener(_positionListener);
  }

  void _positionListener() {
    final FlexibleSpaceBarSettings settings =
        context.dependOnInheritedWidgetOfExactType();
    print(settings.minExtent);
    bool visible =
        settings == null || settings.currentExtent < settings.minExtent + 10;
    if (_visible != visible) {
      setState(() {
        _visible = visible;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 300),
      opacity: _visible ? 1 : 0,
      child: widget.child,
    );
  }
}