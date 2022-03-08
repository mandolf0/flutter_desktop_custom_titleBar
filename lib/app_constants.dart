import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

const String appTitle = 'Custom Flutter window';
//the title bar height controls the sheight of the status bar.
const double titleBarHeight = 60;

//colors
//windows app border color.
//gradient for the right panel
const kcBackgroundStartColor = Color(0xFFc3c3c3);
const kcBackgroundEndColor = Color(0xFFc3c3c3);
const kcSidebarColor = Color(0xFF969696);

const borderColor = Color(0xFF805306);
final buttonColors = WindowButtonColors(
    iconNormal: Color(0xFF969696),
    mouseOver: Color(0xFF474748),
    mouseDown: Color(0xFF141414),
    iconMouseOver: Color(0xFF969696),
    iconMouseDown: Color(0xFFFFD500));

final closeButtonColors = WindowButtonColors(
    iconNormal: Color(0xFF969696),
    mouseOver: Color(0xFFD32F2F),
    mouseDown: Color(0xFFB71C1C),
    iconMouseOver: Colors.white);
