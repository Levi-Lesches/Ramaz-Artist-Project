import "package:flutter/material.dart";

import "package:artist_project/data.dart";
import "package:artist_project/pages.dart";
import "package:artist_project/services.dart";

void main() => runApp(
	MaterialApp(
		home: SplashPage(() async => HomePage()),
		routes: {
			Routes.home: (_) => HomePage(),
		},
		theme: ThemeData(
			textTheme: Typography.englishLike2018
				.apply(bodyColor: Colors.black, displayColor: Colors.black),
		),
		onGenerateRoute: (RouteSettings settings) {
			final String? path = settings.name;
			if (path == null) return null;
			if (path.startsWith("/projects/")) {
				const int offset = "/projects/".length;
				final String name = path.substring(offset)
					.replaceAll("%20", " ");
				return MaterialPageRoute(
					settings: settings,
					builder: (_) => SplashPage(
						() async {
							final Project? result = await Services.instance.firestore
								.getProject(name);
							return result == null 
								? HomePage() : ProjectPage(result);
						}
					)
				);
			}
		} 
	)
);
