enum SnackBarType {
  error,
  success,
}

enum VoteType {
  abstain,
  support,
  against,
}

extension VoteTypeExtension on VoteType {
  String get name {
    switch (this) {
      case VoteType.abstain:
        return 'abstain';
      case VoteType.support:
        return 'for';
      case VoteType.against:
        return 'against';
      default:
        return "";
    }
  }
}

enum SpeechTimeState {
  inProgress,
  paused,
  restart,
  none,
}
