import 'package:flutter/material.dart';
import 'package:user_app/common/constants/colors.dart';
import 'package:user_app/common/constants/sizes.dart';
import 'package:user_app/common/widgets/button.dart';

class EditableField extends StatefulWidget {
  final String label;
  final String value;
  final String type;
  final Function(String) onSavePressed; // Function to save changes

  const EditableField({
    Key? key,
    required this.label,
    required this.value,
    required this.type,
    required this.onSavePressed,
  }) : super(key: key);

  @override
  State<EditableField> createState() => _EditableFieldState();
}

class _EditableFieldState extends State<EditableField> {
  bool _isPressed = false;
  bool _check = false;
  Map<String, String> descriptions = {
    "name":
        "This is the name on your travel document, like your driver's license or passport.",
    "email": "Please provide your email address so we can stay in touch!",
    "phone":
        "This is your contact number, just in case we need to reach out regarding your booking.",
  };
  String? _initialValue; // Store the initial value
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
    _initialValue = widget.value; // Set the initial value when initializing
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.label,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (widget.type != "email")
              TextButton(
                onPressed: () {
                  setState(() {
                    _isPressed = !_isPressed;
                    _check = !_check;
                    if (!_isPressed) {
                      // If cancel is clicked, revert to the initial value
                      _controller.text = _initialValue ?? '';
                    } else {
                      // Store the current value when editing starts
                      if (widget.type == "phone" &&
                          _controller.text.length != 10) {
                        _controller.text = _initialValue ?? '';
                      } else {
                        _initialValue = _controller.text;
                      }
                    }
                  });
                },
                child: Text(
                  _isPressed ? 'Cancel' : "Edit",
                  style: const TextStyle(
                    color: ThemeColors.secondary,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
          ],
        ),
        if (_isPressed) ...[
          Text(
            descriptions[widget.type]!,
            style: const TextStyle(fontSize: Sizes.fontSizeMd - 1),
          ),
          const SizedBox(height: 9),
        ],
        TextField(
          onTap: () {
            setState(() {
              _isPressed = true; // Always set to true when tapping
            });
          },
          textAlignVertical: TextAlignVertical.center,
          enabled: _check,
          controller: _controller,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: ThemeColors.secondary,
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ThemeColors.grey, width: 2),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        if (_isPressed)
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Button(
              text: "Save",
              onPressed: () {
                // Pass the updated value to the onSavePressed function
                widget.onSavePressed(_controller.text);
                setState(() {
                  _isPressed = false; // Reset to false after saving
                });
              },
            ),
          ),
        if (!_isPressed) // Add this condition to hide the Save button when not pressed
          const SizedBox(height: 0),
      ],
    );
  }
}
