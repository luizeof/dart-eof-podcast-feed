import '../lib/podcast_feed.dart';

void main() async {
  var podcast =
      await Podcast.fromFeed('https://anchor.fm/s/848f2e4/podcast/rss');

  print('Podcast Autor: ' + podcast.author);
  print('Podcast Title: ' + podcast.title);
  print('Podcast Link: ' + podcast.url);
  print('Podcast Has Episode: ' + podcast.hasEpisodes.toString());
  print('Podcast Episode Count: ' + podcast.countEpisodes.toString());
  print('Podcast Playback: ' + podcast.playbackState.toString());

  var episode = podcast.episodes.first;

  print('Episode Title: ' + episode.title);
  print('Episode Description: ' + episode.description);
  print('Episode PubDate: ' + episode.pubDate);
  print('Episode Url: ' + episode.url);
  print('Episode Cover: ' + episode.cover);
  print('Episode Playback: ' + episode.playbackState.toString());
}
