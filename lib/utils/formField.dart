import 'package:flutter/material.dart';

TextFormField fullField(
    TextEditingController controller, TextInputType keyboardType) {
  return TextFormField(
    validator: (value) {
      if (value!.isEmpty) {
        return "";
      }
      return null;
    },
    autovalidateMode: (isError)
        ? AutovalidateMode.onUserInteraction
        : AutovalidateMode.disabled,
    controller: controller,
    keyboardType: keyboardType,
    onTapOutside: (event) {
      FocusManager.instance.primaryFocus!.unfocus();
    },
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400)),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xffFF6F6E)),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: const OutlineInputBorder(borderSide: BorderSide()),
      errorStyle: const TextStyle(height: 0),
    ),
  );
}

TextFormField moreLineFullField(
    TextEditingController controller, TextInputType keyboardType) {
  return TextFormField(
    maxLines: 6,
    validator: (value) {
      if (value!.isEmpty) {
        return "";
      }
      return null;
    },
    autovalidateMode: (isError)
        ? AutovalidateMode.onUserInteraction
        : AutovalidateMode.disabled,
    controller: controller,
    keyboardType: keyboardType,
    onTapOutside: (event) {
      FocusManager.instance.primaryFocus!.unfocus();
    },
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400)),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xffFF6F6E)),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: const OutlineInputBorder(borderSide: BorderSide()),
      errorStyle: const TextStyle(height: 0),
    ),
  );
}

bool isError = false;
TextFormField timePass(
    TextInputType keyboardType, TextEditingController controller, int lines) {
  return TextFormField(
    // controller: controller,
    controller: controller,
    maxLines: lines,
    keyboardType: keyboardType,
    onTapOutside: (event) {
      FocusManager.instance.primaryFocus!.unfocus();
    },
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400)),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.deepOrangeAccent),
      ),
    ),
  );
}
