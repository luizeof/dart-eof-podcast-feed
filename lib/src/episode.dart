import 'playback_state.dart';

class Episode {
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

  /// Constructor
  Episode(
    this.title,
    this.description,
    this.pubDate,
    this.url,
    this.cover,
  );

  /// Return Episode Playback Status
  PlaybackState get playbackState {
    return _playback;
  }

  /// Play Episode
  void play() {
    this._playback = PlaybackState.playing;
  }

  /// Pause Episode
  void pause() {
    this._playback = PlaybackState.paused;
  }

  /// Stop Episode
  void stop() {
    this._playback = PlaybackState.stopped;
  }
}
