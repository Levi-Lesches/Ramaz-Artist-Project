import "package:flutter/material.dart";

import "package:artist_project/services.dart";
import "package:artist_project/models.dart";

/// Builds a widget asynchronously.
/// 
/// Different than [AsyncWidgetBuilder], used in [FutureBuilder], which builds 
/// a widget based on an [AsyncSnapshot].
typedef AsyncBuilder = Future<Widget> Function();

/// A page that shows a loading animation, while loading services and models.
/// 
/// Run initialization logic here to ensure that it is called even when the user
/// types a deep-link directly into the address bar. Wrapping routes in this
/// widget, ensures that this logic is always called. 
class SplashPage extends StatefulWidget {
	/// The callback for building the next page. 
	final AsyncBuilder nextPage;

	/// Creates a splash page while the app initializes. 
	/// 
	/// [nextPage] is a callback to build the page the app should go to next.
	const SplashPage(this.nextPage);

	@override
	SplashPageState createState() => SplashPageState();
}

/// The state for [SplashPage]. 
/// 
/// Manages loading services and models, and launches the next page when ready.
class SplashPageState extends State<SplashPage> {
	/// Loads services and models, then navigates to [SplashPage.nextPage].
	Future<void> init() async {
		await Services.instance.init();
		await Models.instance.init();
		final Widget result = await widget.nextPage();
		// ignore: unawaited_futures, this will last the rest of the app
		Navigator.of(context).push(MaterialPageRoute(
			builder: (_) => result,
		));
	}

	@override
	void initState() {
		super.initState();
		init();  // kick off the initialization logic
	}

	@override
	Widget build(BuildContext context) => const Scaffold(
		body: Center(child: CircularProgressIndicator())
	);
}
