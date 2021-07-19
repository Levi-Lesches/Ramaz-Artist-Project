import "package:flutter/material.dart";

final List<String> names = [
	"Gabrielle Amar",
	"Danielle Bendavid",
	"Simone Finkelstein",
	"Arielle Hadad",
	"Hannah Hoff",
	"Mariah Hubert",
	"Moselle Kleiner",
	"Ilan Kogan",
	"Laura Rosen",
	"Sabrina Schochet",
	"Olivia Schwartz",
	"Lily Shams",
];

class HomePage extends StatelessWidget {
	Widget middleBold(
		TextStyle? basic, 
		String beginning, 
		String middle, 
		String end
	) => RichText(text: TextSpan(
		children: [
			TextSpan(
				text: beginning, 
				style: basic,
			),
			TextSpan(
				text: middle, 
				style: basic?.copyWith(fontWeight: FontWeight.bold),
			),
			TextSpan(
				text: end, 
				style: basic,
			),
		]
	));

	@override
	Widget build(BuildContext context) => Scaffold(
		backgroundColor: Colors.white,
		body: Center(
			child: FractionallySizedBox(
				widthFactor: 3/4,
				// A ListView can't center its children horizontally, so we use Column instead
				child: SingleChildScrollView(child: Column(
					children: [
						Text("The Ramaz Upper School", style: Theme.of(context).textTheme.headline5),
						const SizedBox(height: 8),
						middleBold(
							Theme.of(context).textTheme.headline2?.copyWith(color: Colors.black),
							"THE ", "ARTIST", " PROJECT"
						),
						const SizedBox(height: 8),
						Text("What artists see when they look at The Met", style: Theme.of(context).textTheme.subtitle1),

						const SizedBox(height: 72),
						const Divider(),
						const SizedBox(height: 16),

						Row(
							mainAxisAlignment: MainAxisAlignment.spaceBetween,
							children: [
								const SizedBox(width: 8),
								NamesList(names.sublist(0, 6)),
								NamesList(names.sublist(6)),
								const SizedBox(width: 4),
							],
						),

						const SizedBox(height: 4),
						const Divider(),
						const SizedBox(height: 24),

						middleBold(
							Theme.of(context).textTheme.subtitle1,
							"ABOUT THE ", "ARTIST", " PROJECT"
						)
					]
				))
			)
		)
	);
}

class NamesList extends StatelessWidget {
	final List<String> names;
	const NamesList(this.names);

	@override
	Widget build(BuildContext context) => Column(
		children: [
			for (final String name in names) ...[
				Text(name, style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.red, fontWeight: FontWeight.bold)),
				const SizedBox(height: 12),
			]
		]
	);
}

