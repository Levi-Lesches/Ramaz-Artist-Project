import "package:flutter/material.dart";

class ArtistProjectLogo extends StatelessWidget {
	final TextStyle? style;
	final VoidCallback? onTap;

	ArtistProjectLogo({
		TextStyle? style,
		this.onTap,
	}) : style = style?.copyWith(color: Colors.black);

	@override
	Widget build(BuildContext context) => RichText(text: TextSpan(
		children: [
			TextSpan(text: "THE ", style: style),
			TextSpan(
				text: "ARTIST", 
				style: style?.copyWith(fontWeight: FontWeight.bold)
			),
			TextSpan(text: " PROJECT", style: style),
		]
	));
}
