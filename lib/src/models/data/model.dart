import "package:flutter/foundation.dart";

/// Defines the common interface for all data models.
/// 
/// A data model is one that manages data needed throughout the app. View 
/// models, on the other hand, manage data and state for individual pages
/// in the UI. Data models must live across the entire app and be accessible
/// anywhere, with data already present. 
abstract class Model with ChangeNotifier {
	/// Initializes the data in this model.
	/// 
	/// Override this function if you have any async logic that needs to complete
	/// before the model is ready to expose data. If the logic is short and 
	/// synchronous, consider using the constructor to perform that logic instead. 
	Future<void> init();
}