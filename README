# dart-podcast-feed

Dart Podcast Feed Parser

```dart
import 'package:podcast_feed/podcast_feed.dart';
```

The `Podcast` class has a static method `fromFeed` that return a
`Podcast` object.

```dart
void main() async {

  // Start the Object with `fromFeed` static method
  var podcast =
      await Podcast.fromFeed('https://FEEDURL');

  // You can access the Podcast Details
  print('Podcast Autor: ' + podcast.author);
  print('Podcast Title: ' + podcast.title);
  print('Podcast Link: ' + podcast.url);
  print('Podcast Has Episode: ' + podcast.hasEpisodes.toString());
  print('Podcast Episode Count: ' + podcast.countEpisodes.toString());
  print('Podcast Playback: ' + podcast.playbackState.toString());
```

 You can access a `List` of `Episode` on `podcast.episodes` property:

```dart
  // And navigate on Episodes List
  var episode = podcast.episodes.first;

  print('Episode Title: ' + episode.title);
  print('Episode Description: ' + episode.description);
  print('Episode PubDate: ' + episode.pubDate);
  print('Episode Url: ' + episode.url);
  print('Episode Cover: ' + episode.cover);
  print('Episode Playback: ' + episode.playbackState.toString());

}
```
