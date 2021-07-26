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

/// Gets a route for a URl of the form `/projects/First%20Last`.
/// 
/// Extracts the name of the student, then launches the [SplashPage]. Next it
/// searches the database to find the given student, and if it finds their 
/// project, loads it up in a [ProjectPage]. Otherwise, launches the [HomePage].
/// 
/// NOTE: Even if the student can't be found and the app navigates to the home 
/// screen, the URL in the address bar will still contain the student's name. 
/// However, since the logic for checking the database must be done after the
/// services have been initialized, which happens after [SplashPage] is 
/// loaded, it is too late at that point to modify [settings]. If there is a 
/// way to change the URL without calling a. 
Route? getProjectRoute(RouteSettings settings) {
	final String path = settings.name!;  // already null-checked in onGenerateRoute
	const int offset = "/projects/".length;
	final String name = path.substring(offset)
		.replaceAll("%20", " ");

	/// Gets the project for [name] and returns a [ProjectPage] of it. 
	/// 
	/// If the project cannot be found, routes back to the home page instead.
	Future<Widget> buildProjectRoute() async {  
		final Project? result = await Services.instance.firestore.getProject(name);
		return result == null ? HomePage() : ProjectPage(result);
	}

	return MaterialPageRoute(
		settings: settings,
		builder: (_) => SplashPage(buildProjectRoute)
	);
}
