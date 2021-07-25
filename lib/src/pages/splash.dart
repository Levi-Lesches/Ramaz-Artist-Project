import "package:flutter/material.dart";

import "package:artist_project/services.dart";
import "package:artist_project/models.dart";

typedef AsyncBuilder = Future<Widget> Function(BuildContext);

class SplashPage extends StatefulWidget {
	final AsyncBuilder nextPage;
	const SplashPage(this.nextPage);

	@override
	SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
	Future<void> init() async {
		await Services.instance.init();
		await Models.instance.init();
		final Widget result = await widget.nextPage(context);
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
