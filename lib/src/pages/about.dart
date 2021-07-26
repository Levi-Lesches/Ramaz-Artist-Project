import "package:flutter/material.dart";
import "package:youtube_player_iframe/youtube_player_iframe.dart";

import "package:artist_project/pages.dart";
import "package:artist_project/widgets.dart";

class AboutPage extends StatelessWidget {
	static const String aboutVideo = "cseuplXRRRw";
	@override
	Widget build(BuildContext context) => Scaffold(
		appBar: Header(ramazLogoLink: null),
		body: Center(child: SizedBox(
			width: 500, 
			child: SingleChildScrollView(child: Column(
				children: [
					const SizedBox(height: 12),
					ArtistProjectLogo(
						style: Theme.of(context).textTheme.headline4,
						onTap: () => Navigator.of(context).pushReplacementNamed(Routes.home),
					),
					const SizedBox(height: 48),
					SizedBox(
						width: 500, 
						child: YoutubePlayerIFrame(
							controller: YoutubePlayerController(initialVideoId: aboutVideo)
						),
					),
					const SizedBox(height: 48),
					Text(
						"The Ramaz Artist Project is an online video series created by Moselle "
						"Kleiner as a homage to the Metropolitan Museum of Art’s own Artist "
						"Project, in which contemporary artists from around the world explore "
						"and engage with its renowned collection. The Ramaz Artist Project "
						"follows twelve senior studio art students as they vocalize their "
						"relationships with the very same body of work. In each episode a "
						"student encounters one or two pieces that have informed their artistic "
						"practice. Works were selected from several locations within the museum, "
						"including the American Wing, the Ancient Egyptian Wing, European "
						"Paintings, Greek and Roman Art, Modern and Contemporary Art (The Lila "
						"Acheson Wallace Wing), and the Period Rooms. Thank you so much to the "
						"interviewees, as well as students Levi Altzman and Andrew Lorber, "
						"faculty members Mr. Hatam Anvar, Ms. Rachel Rabhan, Ms. Adina Shafner, "
						"and Mr. Rami Yadid for making this project possible, and enjoy!",
						style: Theme.of(context).textTheme.bodyText1,
					),
					const SizedBox(height: 24),
					Align(
						alignment: Alignment.centerLeft, 
						child: Text(
							"All works shown belong to the Metropolitan Museum of Art, copyright "
							"2017.",
							textAlign: TextAlign.left,
							style: Theme.of(context).textTheme.caption,
						),
					)
				] 
			))
		)
	));
}
