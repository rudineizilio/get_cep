import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.label,
    required this.backgroundColor,
    this.borderColor = Colors.transparent,
    required this.labelColor,
    required this.onTap,
  }) : super(key: key);

  final String label;
  final Color backgroundColor;  
  final Color? borderColor;
  final Color labelColor;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: borderColor!,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Material(
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor,
          child: InkWell(
            onTap: () => onTap(),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  label,
                  style: TextStyle(
                    color: labelColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,                    
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}