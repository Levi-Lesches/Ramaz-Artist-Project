import "package:flutter/material.dart";

/// The Artist Project's logo.
/// 
/// Features the word "Artist" in bold. 
class ArtistProjectLogo extends StatelessWidget {
	/// The style used for the text. 
	final TextStyle? style;

	/// A callback for when the logo is pressed. 
	final VoidCallback? onTap;

	/// Creates the logo in a given style. 
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
