# Train Repository
[![style: very good analysis][style_shield]][style_link]

## Overview
This package provides provides wrapper around `Fake Train API` just to mimic how would that be in
the reality land. 

Encapsulates Fake Train API data into more consumable `Trip` model.

## Why?
Separation of concerns. App shouldn't really know WHERE it gets data from. It just wants results.
Whether it comes from API or local database.

## Models
Description of models chronologically.

### trip
Trip from point A to point B which hold List of data that makes this route.

### train (from `Fake Train API`)
A little simplification "stolen" from `Fake Train API` instead of having (the same) model. 
(Umm... yeah, HUGE simplification...).

## Idea list
Current idea list for improvement:
* getting tickets from `ticket_database` package
* tests (Umm... yeah (x2))

[style_shield]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[style_link]: https://pub.dev/packages/very_good_analysis
