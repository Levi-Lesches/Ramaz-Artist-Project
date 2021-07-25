import "package:flutter/material.dart";

class Header extends AppBar {
	Header({required String? ramazLogoLink}) : super(
		backgroundColor: Colors.grey,
		leading: ramazLogoLink == null ? null : Padding(
			padding: const EdgeInsets.only(left: 5), 
			child: Image.network(ramazLogoLink)
		)
	);
}
