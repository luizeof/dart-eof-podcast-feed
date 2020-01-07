# dart-sw-podcast-feed

Dart Podcast Feed Parser

[![Pub](https://img.shields.io/pub/v/sw_podcast_feed.svg)](https://pub.dartlang.org/packages/sw_podcast_feed)

## Features

- Parse a Podcast Feed with
  **Name**, **URL**, **Copyright**, **Author**, **Cover** and **Description**.
- Parse a Episode from Feed with **Title**, **Cover**, **Media URL**, **Date** and  **Description**.

## Getting started

```dart
import 'package:sw_podcast_feed/sw_podcast_feed.dart';
```

The `SWPodcast` class has a static method `fromFeed` that return a
`Podcast` object.

```dart
void main() async {

  // Start the Object with `fromFeed` static method
  var podcast =
      await SWPodcast.fromFeed('https://FEEDURL');

  // You can access the Podcast Details
  print('Podcast Autor: ' + podcast.author);
  print('Podcast Title: ' + podcast.title);
  print('Podcast Link: ' + podcast.url);
  print('Podcast Has Episode: ' + podcast.hasEpisodes.toString());
  print('Podcast Episode Count: ' + podcast.countEpisodes.toString());
  print('Podcast Playback: ' + podcast.playbackState.toString());
```

 You can access a `List` of `SWEpisode` on `podcast.episodes` property:

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

## Changelog
Please see the [Changelog](https://github.com/stackingwidgets/dart-sw-podcast-feed/blob/master/CHANGELOG.md) page to know what's recently changed.

## Contributions
Feel free to contribute to this project.

If you find a bug or want a feature, but don't know how to fix/implement it, [please fill an issue](https://github.com/stackingwidgets/dart-sw-podcast-feed/issues).

If you fixed a bug or implemented a feature, [please send a pull request](https://github.com/stackingwidgets/dart-sw-podcast-feed/pulls).

## Coding Style

Follow the Default Code Style and use the [Dart Analizer](https://github.com/stackingwidgets/dart-sw-podcast-feed/blob/master/analysis_options.yaml) tool:

```bash
dartanalyzer --options analysis_options.yaml .
```

The production Dart Analizer [log is here](https://github.com/stackingwidgets/dart-sw-podcast-feed/blob/master/LINT.md).