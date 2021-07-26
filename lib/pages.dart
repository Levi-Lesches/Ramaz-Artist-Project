/// The library for all the pages. 
/// 
/// Place all top-level UI code here. Smaller UI components should go in the 
/// `widgets` library, while each file here represents a new screen in the app.
/// 
/// All files are in `lib/src/pages`. 
library pages;

export "src/pages/about.dart";
export "src/pages/home.dart";
export "src/pages/project.dart";
export "src/pages/splash.dart";

/// Contains route keys for generic pages. 
/// 
/// For pages that need parameters, construct them manually using 
/// `Navigator.push`. These pages don't need any parameters, and can thus be 
/// opened by using `Navigator.pushNamed`. 
class Routes {
	/// The route key for the home page. 
	static const String home = "home";

	static const String about = "about";
}
