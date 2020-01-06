import 'playback_state.dart';

/// Class Episode
/// Represents the Episode Entity and atributes
///
class Episode {
  /// Constructor
  Episode(
    this.title,
    this.description,
    this.pubDate,
    this.url,
    this.cover,
  );

  /// Episode Title
  String title;

  /// Episode Description
  String description;

  /// Episide Date
  String pubDate;

  /// Episode File Url
  String url;

  /// Episode cover Url
  String cover;

  /// Episode Playback Status
  PlaybackState _playback = PlaybackState.stopped;

  /// Return Episode Playback Status
  PlaybackState get playbackState => _playback;

  /// Play Episode
  void play() {
    _playback = PlaybackState.playing;
  }

  /// Pause Episode
  void pause() {
    _playback = PlaybackState.paused;
  }

  /// Stop Episode
  void stop() {
    _playback = PlaybackState.stopped;
  }
}
