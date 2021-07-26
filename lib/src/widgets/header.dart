import "package:flutter/material.dart";

/// The header to be used across the app.
class Header extends AppBar {
	/// Creates the header. 
	Header({required String? ramazLogoLink}) : super(
		backgroundColor: const Color(0xff808080),
		leading: ramazLogoLink == null ? null : Padding(
			padding: const EdgeInsets.only(left: 5), 
			child: Image.network(ramazLogoLink)
		)
	);
}
