import "package:flutter/material.dart";

import "package:artist_project/pages.dart";

void main() => runApp(
	MaterialApp(
		home: SplashPage((_) => HomePage()),
		routes: {
			Routes.home: (_) => HomePage(),
		},
		theme: ThemeData(
			textTheme: Typography.englishLike2018
				.apply(bodyColor: Colors.black, displayColor: Colors.black),
		)
	)
);
