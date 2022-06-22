class Publication {
  final String title;
  final DateTime datePubli;
  final String imagegPubli;
  final int commentsCount, shareCounts;
  final User user;
  final Reaction userReaction;

  Publication({
    required this.title,
    required this.datePubli,
    required this.imagegPubli,
    required this.commentsCount,
    required this.shareCounts,
    required this.user,
    required this.userReaction,
  });
}

class User {
  final String avatar, userName;

  User({required this.avatar, required this.userName});
}

enum Reaction { like, love, laughing, sad, shocked, angry }
