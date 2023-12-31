import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../util/position.dart';

class Piece {
  static final List<List<Position>> pieceStructures = [
    [
      Position(0, 0),
      Position(0, 1),
      Position(-1, -1),
      Position(0, -1),
      Position(1, -1)
    ],
    [Position(0, 0), Position(0, 1), Position(0, -1), Position(1, -1)],
    [
      Position(0, 0),
      Position(0, 1),
      Position(0, -1),
    ]
  ];

  static final List<Color> pieceColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.yellow,
    Colors.purple
  ];

  final Color _color;

  late final List<Position> _relativePositions;

  Piece._(this._color, this._relativePositions);

  static List<Piece> generateRandomPieces(int count) {
    List<Piece> pieces = [];

    for (var i = 0; i < count; i++) {
      pieces.add(Piece._(pieceColors[Random().nextInt(pieceColors.length)],
          pieceStructures[Random().nextInt(pieceStructures.length)]));
    }

    return pieces;
  }

  Color get color => _color;

  List<Position> get relativePositions => _relativePositions;

  int minY() {
    var min = 0;

    for (var value in _relativePositions) {
      if (min > value.y) {
        min = value.y;
      }
    }

    return min;
  }

  int minX() {
    var min = 0;

    for (var value in _relativePositions) {
      if (min > value.x) {
        min = value.x;
      }
    }

    return min;
  }
}
