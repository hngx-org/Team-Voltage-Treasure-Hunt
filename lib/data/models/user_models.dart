class UserModel {
  final String uid; // Unique user identifier
  final String displayName; // User's display name
  final String email; // User's email address
  final String avatarUrl; // URL to the user's avatar image
  final List<String> createdTreasureHunts; // List of treasure hunts created by the user
  final List<String> participatedTreasureHunts; // List of treasure hunts participated in by the user

  UserModel({
    required this.uid,
    required this.displayName,
    required this.email,
    required this.avatarUrl,
    required this.createdTreasureHunts,
    required this.participatedTreasureHunts,
  });
}
