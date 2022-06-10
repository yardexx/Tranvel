# Tranvel

[![Codemagic build status](https://api.codemagic.io/apps/62a3641c0a17acd2f04fa8fa/62a3641c0a17acd2f04fa8f9/status_badge.svg)](https://codemagic.io/apps/62a3641c0a17acd2f04fa8fa/62a3641c0a17acd2f04fa8f9/latest_build)
[![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg)](https://pub.dev/packages/very_good_analysis)

Simple Flutter application for searching train connections. Also informs about incidents and delays. 

Created as project in free time, now available for anyone to take a look.

## Getting Started

Clone this repository...

```shell
git clone https://github.com/yardexx/tranvel.git
```

... change directory to project ...

```shell
cd tranvel
```

... and run application.

```shell
flutter run
```

## State management

At first, Provider pattern was used. Right now, application relies on bloc pattern.

### Why bloc?

* better separation of concerns

* it plays nice with repository pattern

* future possibility of state persistence (Hydrated Bloc)

## Roadmap

* Search train connection (wip)

* Fake API repository

* State persistence

* Ride history

* Incidents

* Simple profile

* Onboarding

## Ideas

* Fake ticket buying

* Real API

If you like this repository, please give it a ⭐. It's free and it'll make me happy 😊