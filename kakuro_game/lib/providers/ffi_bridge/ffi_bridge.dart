import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart';
import 'package:flutter/widgets.dart';

/// Class which contains functions from native c++ code.
class FFIBridge {

  static final DynamicLibrary _nativeApiLib = Platform.isAndroid
      ? DynamicLibrary.open('libkakuro_native_api.so')
      : DynamicLibrary.process();

  static final Pointer<Utf8> Function(int height, int width, int difficulty)
      _generateBoard = _nativeApiLib
          .lookup<NativeFunction<Pointer<Utf8> Function(Int32, Int32, Int32)>>(
              'generateBoard')
          .asFunction();

  /// This function calls function from native c++ library.
  static String generateKakuroBoard(int height, int width, int difficulty) {
    debugPrint('Call native function for generating.');
    Pointer<Utf8> cStrBoard = _generateBoard(height, width, difficulty);
    debugPrint('Got string from native function.');
    return cStrBoard.toDartString();
  }
}
