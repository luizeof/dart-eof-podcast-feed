import 'eof_playback_state.dart';

/// Class Episode
/// Represents the Episode Entity and atributes
///
class EOFEpisode {
  /// Constructor
  EOFEpisode(
    this.title,
    this.description,
    this.pubDate,
    this.enclosureUrl,
    this.link,
    this.cover,
  );

  /// Episode Title
  String title;

  /// Episode Description
  String description;

  /// Episide Date
  String pubDate;

  /// Episode audio file Url
  String enclosureUrl;

  /// Episode link
  String link;

  /// Episode cover Url
  String cover;

  /// Episode Playback Status
  EOFPlaybackState _playback = EOFPlaybackState.stopped;

  /// Return Episode Playback Status
  EOFPlaybackState get playbackState => _playback;

  /// Play Episode
  void play() {
    _playback = EOFPlaybackState.playing;
  }

  /// Pause Episode
  void pause() {
    _playback = EOFPlaybackState.paused;
  }

  /// Stop Episode
  void stop() {
    _playback = EOFPlaybackState.stopped;
  }
}
