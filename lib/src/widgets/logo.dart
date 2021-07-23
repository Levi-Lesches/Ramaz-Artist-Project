import "package:flutter/material.dart";

class ArtistProjectLogo extends StatelessWidget {
	final TextStyle style;
	final VoidCallback? onTap;

	const ArtistProjectLogo({
		required this.style,
		this.onTap,
	});

	@override
	Widget build(BuildContext context) => Text("THE ARTIST PROJECT", style: style);
}
