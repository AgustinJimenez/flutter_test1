import 'package:flutter/material.dart';

class TouchableOpacity extends StatefulWidget {
  Widget widget = null;

  TouchableOpacity([this.widget]) : super();

  @override
  TouchableOpacityState createState() => TouchableOpacityState();
  
}

class TouchableOpacityState extends State<TouchableOpacity> {
  bool _isTappedDown = false;
  TouchableOpacityState({Widget widget}){

  }

  _wasTappedDown() => _wasTapped();
  _wasTappedUp() => _wasTapped(false);
  
  _wasTapped([bool down = true]) =>
    setState((){
      _isTappedDown = down;
    });
  

  @override
  Widget build(BuildContext context) =>
    GestureDetector(
      onTap: () {

      },
      onTapDown: (TapDownDetails d) => _wasTappedDown(),
      onTapUp: (TapUpDetails d) => _wasTappedUp(),
      child: Text(
        'Flat Button',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: _isTappedDown ? Colors.black.withOpacity(0.5) : Colors.black),
      ),
    );
  
}