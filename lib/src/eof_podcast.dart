import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';
import 'eof_episode.dart';
import 'eof_playback_state.dart';

/// Class Podcast
/// Represents the Podcast Entity and atributes
///
class EOFPodcast {
  /// Constructor
  /// XmlDocument [_docXML]
  EOFPodcast(XmlDocument _docXML) {
    //
    // Read the Podcast Author
    author = _docXML.findAllElements('itunes:author').isEmpty
        ? _docXML.findAllElements('author').first.text
        : _docXML.findAllElements('itunes:author').first.text;
    // Read the Podcast Title
    title = _docXML.findAllElements('title').first.text;
    // Read the Podcast link
    link = _docXML.findAllElements('link').first.text;
    // Read the Podcast Copyright
    copyright = _docXML.findAllElements('copyright').first.text;
    // Read the Podcast Description
    description = _docXML.findAllElements('description').first.text;
    // Read the Podcast Cover URL
    podcastCoverUrl =
        _docXML.findAllElements('image').first.findElements('url').first.text;

    for (var e in _docXML.findAllElements('item')) {
      episodes.add(
        EOFEpisode(
          e.findElements('title').isEmpty
              ? ''
              : e.findElements('title').first.text,
          e.findElements('description').isEmpty
              ? ''
              : e.findElements('description').first.text,
          e.findElements('pubDate').isEmpty
              ? ''
              : e.findElements('pubDate').first.text,
          e.findElements('enclosure').isEmpty
              ? ''
              : e.findElements('enclosure').first.getAttribute('url'),
          e.findElements('link').isEmpty
              ? ''
              : e.findElements('link').first.text,
          e.findElements('itunes:image').isNotEmpty
              ? e.findElements('itunes:image').first.getAttribute('href')
              : _docXML
                  .findAllElements('image')
                  .first
                  .findElements('url')
                  .first
                  .text,
        ),
      );
    }
  }

  /// Episode List
  List<EOFEpisode> episodes = [];

  /// Podcast Title
  String title;

  /// Podcast Link
  String link;

  /// Podcast Cover Url
  String podcastCoverUrl;

  /// Podcast Author
  String author;

  /// Podcast Copyright
  String copyright;

  /// Podcast Description
  String description;

  /// Current Episde Playing index
  int _playingIndex = -1;

  /// Init a Podcast Class with the Feed Address [uri]
  static Future<EOFPodcast> fromFeed(String uri) async {
    try {
      var rssResponse = await http.get(uri);
      var document = parse(rssResponse.body);
      return EOFPodcast(document);
    } catch (e) {
      return null;
    }
  }

  /// Return number of Show Episodes
  int get countEpisodes => episodes.length;

  /// Return if Show has Episodes
  bool get hasEpisodes => episodes.isNotEmpty;

  /// Set current playing episode index [i]
  void isPlaying(int i) =>
      (_playingIndex >= 0) ? _playingIndex = i : _playingIndex = -1;

  /// Return current Playerback State
  EOFPlaybackState get playbackState => (_playingIndex >= 0)
      ? nowPlaying.playbackState
      : EOFPlaybackState.stopped;

  /// Return Episode now playing
  EOFEpisode get nowPlaying =>
      (_playingIndex >= 0) ? episodes[_playingIndex] : null;
}
