import 'package:flutter/material.dart';

class HomeProvider {

  ValueNotifier<bool> isTextAdded = ValueNotifier(false);
  ValueNotifier<bool> isImageAdded = ValueNotifier(false);
  ValueNotifier<bool> isButtonAdded = ValueNotifier(false);
  ValueNotifier<bool> onlyButtonAdded = ValueNotifier(false);
}