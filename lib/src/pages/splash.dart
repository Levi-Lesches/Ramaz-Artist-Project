import "package:flutter/material.dart";

import "package:artist_project/services.dart";
import "package:artist_project/models.dart";

class SplashPage extends StatefulWidget {
	final WidgetBuilder nextPage;
	const SplashPage(this.nextPage);

	@override
	SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
	Future<void> init() async {
		await Services.instance.init();
		await Models.instance.init();
		// ignore: unawaited_futures, this will last the rest of the app
		Navigator.of(context).push(MaterialPageRoute(
			builder: widget.nextPage,
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
