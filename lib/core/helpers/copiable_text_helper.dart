import 'package:mothercare_mobile/features/ektp/ektp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CopiableText extends StatelessWidget {
  final String text;
  final String? copyMessage;
  final Widget? child;

  CopiableText(this.text, {this.copyMessage, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          Clipboard.setData(new ClipboardData(text: this.text));
        },
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
            child: Row(
              children: [
                this.child ??
                    Text(
                      this.text,
                      style: TextStyle(color: Color(0xFF1E272E), fontSize: 14),
                    ),
                Icon(
                  Icons.copy,
                  size: 16,
                ).leftPadded(6)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
