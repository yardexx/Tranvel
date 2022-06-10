# Tranvel

[![Codemagic build status][codemagic_ci_shield][codemagic_ci_link]
[![ci: very good workflows][github_ci_shield][github_ci_link]
[![style: very good analysis][style_shield][style_link]

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

[codemagic_ci_shield]: https://api.codemagic.io/apps/62a3641c0a17acd2f04fa8fa/62a3641c0a17acd2f04fa8f9/status_badge.svg
[codemagic_ci_link]: https://codemagic.io/apps/62a3641c0a17acd2f04fa8fa/62a3641c0a17acd2f04fa8f9/latest_build
[github_ci_shield]: https://github.com/yardexx/tranvel/actions/workflows/main.yml/badge.svg
[github_ci_link]: https://github.com/yardexx/tranvel/actions
[style_shield]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[style_link]: https://pub.dev/packages/very_good_analysis