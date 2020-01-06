import 'playback_state.dart';

class Episode {
  /// Episode Title
  String _title;

  /// Episode Description
  String _description;

  /// Episide Date
  String _pubDate;

  /// Episode File Url
  String _url;

  /// Episode cover Url
  String _cover;

  /// Episode Playback Status
  PlaybackState _playback = PlaybackState.stopped;

  /// Constructor
  Episode(
    var this._title,
    var this._description,
    var this._pubDate,
    var this._url,
    var this._cover,
  );

  /// Return Episode Title
  String get title {
    return _title;
  }

  /// Return Episode Description
  String get description {
    return _description;
  }

  /// Return Episode Date
  String get pubDate {
    return _pubDate;
  }

  /// Return Episode File Url
  String get url {
    return _url;
  }

  /// Return Episode Cover Url
  String get cover {
    return _cover;
  }

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
