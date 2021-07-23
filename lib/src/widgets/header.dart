import "package:flutter/material.dart";

class Header extends AppBar {
	Header({required String? ramazLogoLink}) : super(
		backgroundColor: Colors.grey,
		leading: ramazLogoLink == null ? null : Image.network(ramazLogoLink),
	);
}
