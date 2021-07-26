import "package:flutter/material.dart";

import "package:artist_project/data.dart";
import "package:artist_project/pages.dart";
import "package:artist_project/services.dart";

void main() => runApp(
	MaterialApp(
		home: SplashPage(() async => HomePage()),
		routes: {
			Routes.home: (_) => HomePage(),
			Routes.about: (_) => AboutPage(),
		},
		theme: ThemeData(
			textTheme: Typography.englishLike2018
				.apply(bodyColor: Colors.black, displayColor: Colors.black),
		),
		onGenerateRoute: (RouteSettings settings) {
			final String? path = settings.name;
			if (path == null) return null;
			if (path.startsWith("/projects/")) return getProjectRoute(settings);
		}
	)
);

Route? getProjectRoute(RouteSettings settings) {
	final String path = settings.name!;  // already null-checked in onGenerateRoute
	const int offset = "/projects/".length;
	final String name = path.substring(offset)
		.replaceAll("%20", " ");

	/// Gets the project for [name] and returns a [ProjectPage] of it. 
	/// 
	/// If the project cannot be found, routes back to the home page instead.
	Future<Widget> buildProjectRoute() async {  
		final Project? result = await Services.instance.firestore
			.getProject(name);
		return result == null ? HomePage() : ProjectPage(result);
	}

	return MaterialPageRoute(
		settings: settings,
		builder: (_) => SplashPage(buildProjectRoute)
	);
}
