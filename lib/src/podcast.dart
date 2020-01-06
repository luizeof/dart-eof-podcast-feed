import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';
import 'episode.dart';
import 'playback_state.dart';

/// Class Podcast
/// Represents the Podcast Entity and atributes:
///
class Podcast {
  /// Episode List
  List<Episode> episodes = List<Episode>();

  /// Podcast Title
  String title;

  /// Podcast Url
  String url;

  /// Podcast Cover Url
  String podcastCoverUrl;

  /// Podcast Author
  String author;

  /// Podcast Copyright
  String copyright;

  /// Podcast Description
  String description;

  /// Current Episde Playing index
  int _playing_index = -1;

  /// Constructor
  /// XmlDocument [_docXML]
  Podcast(XmlDocument _docXML) {
    //
    // Read the Podcast Author
    author = _docXML.findAllElements('itunes:author').isEmpty
        ? _docXML.findAllElements('author').first.text
        : _docXML.findAllElements('itunes:author').first.text;
    // Read the Podcast Title
    title = _docXML.findAllElements('title').first.text;
    // Read the Podcast URL
    url = _docXML.findAllElements('link').first.text;
    // Read the Podcast Copyright
    copyright = _docXML.findAllElements('copyright').first.text;
    // Read the Podcast Description
    description = _docXML.findAllElements('description').first.text;
    // Read the Podcast Cover URL
    podcastCoverUrl =
        _docXML.findAllElements('image').first.findElements('url').first.text;

    for (XmlElement e in _docXML.findAllElements('item')) {
      episodes.add(
        Episode(
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

  /// Init a Podcast Class with the Feed Address [uri]
  static Future<Podcast> fromFeed(String uri) async {
    if (uri == null) throw Exception('URL cannot be null');
    try {
      final rssResponse = await http.get(uri);
      var document = parse(rssResponse.body);
      return Podcast(document);
    } catch (e) {
      print("ERROR: Could not parse response body: \n${e.message}");
    }
    return null;
  }

  /// Return number of Show Episodes
  int get countEpisodes {
    return episodes.length;
  }

  /// Return if Show has Episodes
  bool get hasEpisodes {
    return !episodes.isEmpty;
  }

  /// Set currente playing episode index [i]
  void set isPlaying(i) {
    if (_playing_index >= 0) {
      this._playing_index = i;
    } else {
      this._playing_index = -1;
    }
  }

  /// Return current Playerback State
  PlaybackState get playbackState {
    if (_playing_index >= 0) {
      return this.nowPlaying.playbackState;
    } else {
      return PlaybackState.stopped;
    }
  }

  /// Return Episode now laying
  Episode get nowPlaying {
    if (_playing_index >= 0) {
      return episodes[this._playing_index];
    } else {
      return null;
    }
  }
}
