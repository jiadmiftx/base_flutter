import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pgn_mobile/core/utils/color/color_util.dart';

class Text18BlueBold extends StatelessWidget {
  final String _text;
  final Alignment? alignment;
  const Text18BlueBold(this._text, {Key? key, this.alignment = Alignment.centerLeft}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: BaseColor.primaryColor),
      );
}

class Text18BlackBold extends StatelessWidget {
  final String _text;
  final TextAlign? alignment;
  const Text18BlackBold(this._text, {Key? key, this.alignment = TextAlign.center}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        textAlign: alignment,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
      );
}

class Text18BlackSemiBold extends StatelessWidget {
  final String _text;
  final TextAlign? alignment;
  const Text18BlackSemiBold(this._text, {Key? key, this.alignment = TextAlign.center}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        textAlign: alignment,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
      );
}

class Text18WhitekBold extends StatelessWidget {
  final String _text;
  final TextAlign? alignment;
  const Text18WhitekBold(this._text, {Key? key, this.alignment = TextAlign.center}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        textAlign: alignment,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      );
}

class Text18WhiteRegular extends StatelessWidget {
  final String _text;
  final TextAlign? alignment;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool? softWrap;
  const Text18WhiteRegular(this._text, {Key? key, this.alignment, this.maxLines, this.overflow, this.softWrap}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: alignment,
        softWrap: softWrap,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.white),
      );
}

class Text20BlackBold extends StatelessWidget {
  final String _text;
  final Alignment? alignment;
  const Text20BlackBold(this._text, {Key? key, this.alignment = Alignment.centerLeft}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
      );
}

class Text14BlackRegular extends StatelessWidget {
  final String _text;
  final TextAlign? alignment;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool? softWrap;
  const Text14BlackRegular(this._text, {Key? key, this.alignment, this.maxLines, this.overflow, this.softWrap}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: alignment,
        softWrap: softWrap,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black),
      );
}

class Text14WhiteRegular extends StatelessWidget {
  final String _text;
  final TextAlign? alignment;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool? softWrap;
  const Text14WhiteRegular(this._text, {Key? key, this.alignment, this.maxLines, this.overflow, this.softWrap}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: alignment,
        softWrap: softWrap,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white),
      );
}

class Text14BlueBold extends StatelessWidget {
  final String _text;
  final TextAlign? alignment;
  const Text14BlueBold(this._text, {Key? key, this.alignment}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        textAlign: alignment ?? TextAlign.left,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: BaseColor.primaryColor),
      );
}

class Text18BluePrimaryBold extends StatelessWidget {
  final String _text;
  final TextAlign? alignment;
  const Text18BluePrimaryBold(this._text, {Key? key, this.alignment = TextAlign.center}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        textAlign: alignment,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: BaseColor.primaryColor),
      );
}

class Text20BluePrimaryBold extends StatelessWidget {
  final String _text;
  final Alignment? alignment;
  const Text20BluePrimaryBold(this._text, {Key? key, this.alignment = Alignment.centerLeft}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: BaseColor.primaryColor),
      );
}

class Text14BluePrimaryRegular extends StatelessWidget {
  final String _text;
  final TextAlign? alignment;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool? softWrap;
  const Text14BluePrimaryRegular(this._text, {Key? key, this.alignment, this.maxLines, this.overflow, this.softWrap}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: alignment,
        softWrap: softWrap,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: BaseColor.primaryColor),
      );
}

class Text14BluePrimaryBold extends StatelessWidget {
  final String _text;
  final TextAlign? alignment;
  const Text14BluePrimaryBold(this._text, {Key? key, this.alignment}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        textAlign: alignment ?? TextAlign.left,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: BaseColor.primaryColor),
      );
}

class Text14BlueMedium extends StatelessWidget {
  final String _text;
  final TextAlign? alignment;
  const Text14BlueMedium(this._text, {Key? key, this.alignment}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        textAlign: alignment ?? TextAlign.left,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: BaseColor.primaryColor),
      );
}

class Text14Blue8BDBold extends StatelessWidget {
  final String _text;
  final TextAlign? alignment;
  const Text14Blue8BDBold(this._text, {Key? key, this.alignment}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        textAlign: alignment ?? TextAlign.left,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: BaseColor.blue8BD),
      );
}

class Text16BGreyBold extends StatelessWidget {
  final String _text;
  final TextAlign? alignment;
  const Text16BGreyBold(this._text, {Key? key, this.alignment}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        textAlign: alignment ?? TextAlign.left,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: BaseColor.greyF45),
      );
}

class Text18BGreyBold extends StatelessWidget {
  final String _text;
  final TextAlign? alignment;
  const Text18BGreyBold(this._text, {Key? key, this.alignment}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        textAlign: alignment ?? TextAlign.left,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: BaseColor.greyF45),
      );
}

class Text18BGreySemiBold extends StatelessWidget {
  final String _text;
  final TextAlign? alignment;
  const Text18BGreySemiBold(this._text, {Key? key, this.alignment}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        textAlign: alignment ?? TextAlign.left,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: BaseColor.greyF45),
      );
}

class Text14BGreyLight extends StatelessWidget {
  final String _text;
  final TextAlign? alignment;
  const Text14BGreyLight(this._text, {Key? key, this.alignment}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        textAlign: alignment ?? TextAlign.left,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: BaseColor.greyF45),
      );
}

class Text14WhiteMedium extends StatelessWidget {
  final String _text;
  final TextAlign? alignment;
  const Text14WhiteMedium(this._text, {Key? key, this.alignment}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        textAlign: alignment ?? TextAlign.left,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
      );
}

class Text14WhiteSemiBold extends StatelessWidget {
  final String _text;
  final TextAlign? alignment;
  const Text14WhiteSemiBold(this._text, {Key? key, this.alignment}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        textAlign: alignment ?? TextAlign.left,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: Colors.white),
      );
}

class Text16Blue8BDBold extends StatelessWidget {
  final String _text;
  final TextAlign? alignment;
  const Text16Blue8BDBold(this._text, {Key? key, this.alignment}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        textAlign: alignment ?? TextAlign.left,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: BaseColor.blue8BD),
      );
}

class Text18BlueLightestSemiBold extends StatelessWidget {
  final String _text;
  final TextAlign? alignment;
  const Text18BlueLightestSemiBold(this._text, {Key? key, this.alignment}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        textAlign: alignment ?? TextAlign.left,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: BaseColor.blueLightest),
      );
}

class Text16BlackSemiBold extends StatelessWidget {
  final String _text;
  final TextAlign? alignment;
  const Text16BlackSemiBold(this._text, {Key? key, this.alignment}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        textAlign: alignment ?? TextAlign.left,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
      );
}

class Text16WhiteBold extends StatelessWidget {
  final String _text;
  final TextAlign? alignment;
  const Text16WhiteBold(this._text, {Key? key, this.alignment}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        textAlign: alignment ?? TextAlign.left,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: Colors.white),
      );
}

class Text16GreyInactiveBold extends StatelessWidget {
  final String _text;
  final TextAlign? alignment;
  const Text16GreyInactiveBold(this._text, {Key? key, this.alignment}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        textAlign: alignment ?? TextAlign.left,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: BaseColor.colorGreyInactive),
      );
}

class Text16GreyInactiveSemiBold extends StatelessWidget {
  final String _text;
  final TextAlign? alignment;
  const Text16GreyInactiveSemiBold(this._text, {Key? key, this.alignment}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        textAlign: alignment ?? TextAlign.left,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: BaseColor.colorGreyInactive),
      );
}

class Text16GreyInactiveRegular extends StatelessWidget {
  final String _text;
  final TextAlign? alignment;
  const Text16GreyInactiveRegular(this._text, {Key? key, this.alignment}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        textAlign: alignment ?? TextAlign.left,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: BaseColor.colorGreyInactive),
      );
}

class Text14GreyRegular extends StatelessWidget {
  final String _text;
  final TextAlign? alignment;
  const Text14GreyRegular(this._text, {Key? key, this.alignment}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        textAlign: alignment ?? TextAlign.left,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: BaseColor.colorGrey),
      );
}

class Text14GreyLight extends StatelessWidget {
  final String _text;
  final TextAlign? alignment;
  const Text14GreyLight(this._text, {Key? key, this.alignment}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        textAlign: alignment ?? TextAlign.left,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),
      );
}

class Text12WhiteBold extends StatelessWidget {
  final String _text;
  final TextAlign? alignment;
  const Text12WhiteBold(this._text, {Key? key, this.alignment}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        textAlign: alignment ?? TextAlign.left,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: Colors.white),
      );
}

class Text12Blue8BDBold extends StatelessWidget {
  final String _text;
  final TextAlign? alignment;
  const Text12Blue8BDBold(this._text, {Key? key, this.alignment}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        textAlign: alignment ?? TextAlign.left,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: BaseColor.blue8BD),
      );
}

class Text12BlueRegular extends StatelessWidget {
  final String _text;
  final TextAlign? alignment;
  const Text12BlueRegular(this._text, {Key? key, this.alignment}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        textAlign: alignment ?? TextAlign.left,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: BaseColor.blue8BD),
      );
}

class Text12BlackRegular extends StatelessWidget {
  final String _text;
  final TextAlign? alignment;
  final int maxLines;
  const Text12BlackRegular(this._text, {Key? key, this.alignment, this.maxLines = 2}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        textAlign: alignment ?? TextAlign.left,
        maxLines: maxLines,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black),
      );
}

class Text12BlackItalic extends StatelessWidget {
  final String _text;
  final TextAlign? alignment;
  final int maxLines;
  const Text12BlackItalic(this._text, {Key? key, this.alignment, this.maxLines = 2}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        textAlign: alignment ?? TextAlign.left,
        maxLines: maxLines,
        style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic, color: Colors.black),
      );
}

class Text16WhiteReguler extends StatelessWidget {
  final String _text;
  final TextAlign? alignment;
  const Text16WhiteReguler(this._text, {Key? key, this.alignment}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        textAlign: alignment ?? TextAlign.left,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white),
      );
}

class Text22BlackBold extends StatelessWidget {
  final String _text;
  final TextAlign? alignment;
  const Text22BlackBold(this._text, {Key? key, this.alignment}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        textAlign: alignment ?? TextAlign.left,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
      );
}

class Text16BlackBold extends StatelessWidget {
  final String _text;
  final int maxLines;
  final TextOverflow overflow;
  final TextAlign? alignment;
  const Text16BlackBold(this._text, {Key? key, this.alignment, this.maxLines = 2, this.overflow = TextOverflow.ellipsis}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: alignment ?? TextAlign.left,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
      );
}

class Text14BlueLightestBold extends StatelessWidget {
  final String _text;
  final TextAlign? alignment;
  const Text14BlueLightestBold(this._text, {Key? key, this.alignment}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        textAlign: alignment ?? TextAlign.left,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: BaseColor.blueLightest),
      );
}

class Text22WhiteBold extends StatelessWidget {
  final String _text;
  final TextAlign? alignment;
  const Text22WhiteBold(this._text, {Key? key, this.alignment}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        textAlign: alignment ?? TextAlign.left,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
      );
}

class Text14GreenRegular extends StatelessWidget {
  final String _text;
  final TextAlign? alignment;
  const Text14GreenRegular(this._text, {Key? key, this.alignment}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        textAlign: alignment ?? TextAlign.left,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: BaseColor.greenE87),
      );
}

class Text14RedRegular extends StatelessWidget {
  final String _text;
  final TextAlign? alignment;
  const Text14RedRegular(this._text, {Key? key, this.alignment}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        textAlign: alignment ?? TextAlign.left,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: BaseColor.redE1B),
      );
}

class Text16PrimaryBlueBold extends StatelessWidget {
  final String _text;
  final TextAlign? alignment;
  const Text16PrimaryBlueBold(this._text, {Key? key, this.alignment}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        textAlign: alignment ?? TextAlign.left,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: BaseColor.primaryColor),
      );
}

class Text16PrimaryBlueSemiBold extends StatelessWidget {
  final String _text;
  final TextAlign? alignment;
  const Text16PrimaryBlueSemiBold(this._text, {Key? key, this.alignment}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        textAlign: alignment ?? TextAlign.left,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: BaseColor.primaryColor),
      );
}

class Text16BlackRegular extends StatelessWidget {
  final String _text;
  final int maxLines;
  final TextOverflow overflow;
  final TextAlign? alignment;
  const Text16BlackRegular(this._text, {Key? key, this.alignment, this.maxLines = 2, this.overflow = TextOverflow.ellipsis}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: alignment,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),
      );
}

class Text16GreyRegular extends StatelessWidget {
  final String _text;
  final int maxLines;
  final TextOverflow overflow;
  final TextAlign? alignment;
  const Text16GreyRegular(this._text, {Key? key, this.alignment, this.maxLines = 2, this.overflow = TextOverflow.ellipsis}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: alignment,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.grey.shade700),
      );
}

class Text16WhiteMedium extends StatelessWidget {
  final String _text;
  final int maxLines;
  final TextOverflow overflow;
  final TextAlign? alignment;
  const Text16WhiteMedium(this._text, {Key? key, this.alignment, this.maxLines = 2, this.overflow = TextOverflow.ellipsis}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: alignment,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
      );
}

class Text14Grey700Regular extends StatelessWidget {
  final String _text;
  final TextAlign? alignment;
  const Text14Grey700Regular(this._text, {Key? key, this.alignment}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        textAlign: alignment ?? TextAlign.left,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey.shade700),
      );
}

class Text14BlackMedium extends StatelessWidget {
  final String _text;
  final int maxLines;
  final TextOverflow overflow;
  final TextAlign? alignment;
  const Text14BlackMedium(this._text, {Key? key, this.alignment, this.maxLines = 2, this.overflow = TextOverflow.ellipsis}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: alignment,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
      );
}

class Text14FacebookBlueBold extends StatelessWidget {
  final String _text;
  final TextAlign? alignment;
  const Text14FacebookBlueBold(this._text, {Key? key, this.alignment}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        textAlign: alignment ?? TextAlign.left,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: BaseColor.colorBlueFacebook),
      );
}

class Text14Grey0A0Regular extends StatelessWidget {
  final String _text;
  final TextAlign? alignment;
  const Text14Grey0A0Regular(this._text, {Key? key, this.alignment}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        textAlign: alignment ?? TextAlign.left,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: BaseColor.grey0A0),
      );
}

class Text14BlackBold extends StatelessWidget {
  final String _text;
  final TextAlign? alignment;
  final int? maxLines;
  final TextOverflow overflow;
  const Text14BlackBold(this._text, {Key? key, this.alignment, this.maxLines = null, this.overflow = TextOverflow.ellipsis}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        textAlign: alignment ?? TextAlign.left,
        maxLines: maxLines,
        overflow: overflow,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
      );
}

class Text14BlackSelectionBold extends StatelessWidget {
  final String _text;
  final TextAlign? alignment;
  final Color selectionColor;
  const Text14BlackSelectionBold(this._text, {Key? key, this.alignment, this.selectionColor = Colors.black}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        textAlign: alignment ?? TextAlign.left,
        selectionColor: selectionColor,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      );
}

class Text14BlueLightMedium extends StatelessWidget {
  final String _text;
  final TextAlign? alignment;
  const Text14BlueLightMedium(this._text, {Key? key, this.alignment}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        textAlign: alignment ?? TextAlign.left,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: BaseColor.blueLight),
      );
}

class Text14CustomColorLight extends StatelessWidget {
  final String _text;
  final Color color;
  final TextAlign? alignment;
  const Text14CustomColorLight(this._text, {Key? key, this.alignment, this.color = Colors.black}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        textAlign: alignment ?? TextAlign.left,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: color),
      );
}

class Text16WhiteSemiBold extends StatelessWidget {
  final String _text;
  final TextAlign? alignment;
  const Text16WhiteSemiBold(this._text, {Key? key, this.alignment}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        textAlign: alignment ?? TextAlign.left,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: Colors.white),
      );
}

class Text14WhiteSpaceMonoSemiBold extends StatelessWidget {
  final String _text;
  final TextAlign? alignment;
  final double letterSpacing;
  const Text14WhiteSpaceMonoSemiBold(this._text, {Key? key, this.alignment, this.letterSpacing = 1}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        textAlign: alignment ?? TextAlign.left,
        style: GoogleFonts.spaceMono(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white, letterSpacing: letterSpacing),
      );
}

class Text11BlackF45Medium extends StatelessWidget {
  final String _text;
  final int maxLines;
  final TextOverflow overflow;
  final TextAlign? alignment;
  const Text11BlackF45Medium(this._text, {Key? key, this.alignment, this.maxLines = 2, this.overflow = TextOverflow.ellipsis}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: alignment,
        style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: BaseColor.blackF45),
      );
}

class Text11GreyRegular extends StatelessWidget {
  final String _text;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? alignment;
  const Text11GreyRegular(this._text, {Key? key, this.alignment, this.maxLines, this.overflow}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: alignment,
        style: TextStyle(fontSize: 11, fontWeight: FontWeight.normal, color: BaseColor.colorGrey),
      );
}

class Text13BlackRegular extends StatelessWidget {
  final String _text;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? alignment;
  final bool? softWrap;
  const Text13BlackRegular(this._text, {Key? key, this.alignment, this.maxLines, this.overflow, this.softWrap}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: alignment,
        softWrap: softWrap,
        style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal, color: Colors.black),
      );
}

class Text12Black87Bold extends StatelessWidget {
  final String _text;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? alignment;
  final bool? softWrap;
  const Text12Black87Bold(this._text, {Key? key, this.alignment, this.maxLines, this.overflow, this.softWrap}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: alignment,
        softWrap: softWrap,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black87),
      );
}

class Text12Black87SemiBold extends StatelessWidget {
  final String _text;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? alignment;
  final bool? softWrap;
  const Text12Black87SemiBold(this._text, {Key? key, this.alignment, this.maxLines, this.overflow, this.softWrap}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: alignment,
        softWrap: softWrap,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black87),
      );
}

class Text12DefaultRedRegular extends StatelessWidget {
  final String _text;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? alignment;
  final bool? softWrap;
  const Text12DefaultRedRegular(this._text, {Key? key, this.alignment, this.maxLines, this.overflow, this.softWrap}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: alignment,
        softWrap: softWrap,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.red),
      );
}

class Text14Black414Medium extends StatelessWidget {
  final String _text;
  final int maxLines;
  final TextOverflow overflow;
  final TextAlign? alignment;
  const Text14Black414Medium(this._text, {Key? key, this.alignment, this.maxLines = 2, this.overflow = TextOverflow.ellipsis}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: alignment,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: BaseColor.black414),
      );
}

class Text14Grey93AMedium extends StatelessWidget {
  final String _text;
  final TextAlign? alignment;
  const Text14Grey93AMedium(this._text, {Key? key, this.alignment}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        textAlign: alignment ?? TextAlign.left,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: BaseColor.grey93A),
      );
}

class Text12GreyF45Light extends StatelessWidget {
  final String _text;
  final TextAlign? alignment;
  const Text12GreyF45Light(this._text, {Key? key, this.alignment}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        textAlign: alignment ?? TextAlign.left,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: BaseColor.greyF45),
      );
}

class Text12GreyDefaultRegular extends StatelessWidget {
  final String _text;
  final int maxLines;
  final TextOverflow overflow;
  final TextAlign? alignment;
  const Text12GreyDefaultRegular(this._text, {Key? key, this.alignment, this.maxLines = 2, this.overflow = TextOverflow.ellipsis}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: alignment ?? TextAlign.left,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black),
      );
}

class Text14Grey extends StatelessWidget {
  final String _text;
  final int maxLines;
  final TextOverflow overflow;
  final TextAlign? alignment;
  const Text14Grey(this._text, {Key? key, this.alignment, this.maxLines = 2, this.overflow = TextOverflow.ellipsis}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: alignment ?? TextAlign.left,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.grey),
      );
}

class Text10BlackDefaultRegular extends StatelessWidget {
  final String _text;
  final int maxLines;
  final TextOverflow overflow;
  final TextAlign? alignment;
  const Text10BlackDefaultRegular(this._text, {Key? key, this.alignment, this.maxLines = 2, this.overflow = TextOverflow.ellipsis}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: alignment ?? TextAlign.left,
        style: TextStyle(fontSize: 8, fontWeight: FontWeight.normal, color: Colors.black),
      );
}

class Text10GreyDefaultRegular extends StatelessWidget {
  final String _text;
  final int maxLines;
  final TextOverflow overflow;
  final TextAlign? alignment;
  const Text10GreyDefaultRegular(this._text, {Key? key, this.alignment, this.maxLines = 2, this.overflow = TextOverflow.ellipsis}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: alignment ?? TextAlign.left,
        style: TextStyle(fontSize: 8, fontWeight: FontWeight.normal, color: Colors.grey[500]),
      );
}

class Text10WhiteDefaultRegular extends StatelessWidget {
  final String _text;
  final int maxLines;
  final TextOverflow overflow;
  final TextAlign? alignment;
  const Text10WhiteDefaultRegular(this._text, {Key? key, this.alignment, this.maxLines = 2, this.overflow = TextOverflow.ellipsis}) : super(key: key);

  @override
  Widget build(ctx) => Text(
        _text,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: alignment ?? TextAlign.left,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white),
      );
}
