import 'swplayback_state.dart';

/// Class Episode
/// Represents the Episode Entity and atributes
///
class SWEpisode {
  /// Constructor
  SWEpisode(
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
  SWPlaybackState _playback = SWPlaybackState.stopped;

  /// Return Episode Playback Status
  SWPlaybackState get playbackState => _playback;

  /// Play Episode
  void play() {
    _playback = SWPlaybackState.playing;
  }

  /// Pause Episode
  void pause() {
    _playback = SWPlaybackState.paused;
  }

  /// Stop Episode
  void stop() {
    _playback = SWPlaybackState.stopped;
  }
}
