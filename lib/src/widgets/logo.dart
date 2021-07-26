import "package:flutter/material.dart";

/// The Artist Project's logo.
/// 
/// Features the word "Artist" in bold. 
class ArtistProjectLogo extends StatelessWidget {
	/// The style used for the text. 
	final TextStyle? style;

	/// A callback for when the logo is pressed. 
	final VoidCallback? onTap;

	/// Text to insert before the logo.
	final String prefix;

	/// Creates the logo in a given style. 
	ArtistProjectLogo({
		TextStyle? style,
		this.onTap,
		this.prefix = "",
	}) : style = style?.copyWith(color: Colors.black);

	@override
	Widget build(BuildContext context) => InkWell(
		onTap: onTap, 
		child: RichText(
			textAlign: TextAlign.center,
			text: TextSpan(
				children: [
					TextSpan(text: "${prefix}THE ", style: style),
					TextSpan(
						text: "ARTIST", 
						style: style?.copyWith(fontWeight: FontWeight.bold)
					),
					TextSpan(text: " PROJECT", style: style),
				]
			)
		)
	);
}
