# Fake Train API
[![style: very good analysis][style_shield]][style_link]

## Overview
This package provides provides simple way of generating and providing fake data about trains.
This also brought some little advantages such as offline availability (since its fully local) and
also modifiability (nobody can really stop you from doing it).

Notice that this package sends final data (like you would pull from API) rather then faked http 
answer to call.

*Also this "API" is reliable = never sends "failed" answers*

## Why?
Unfortunately, there is no easy-to-use API for getting train connections in Slovakia and/or Czechia.
The most popular in here is iDOS/CP.sk which does not provide convenient way of getting data (
scrapping just does not feel right). So instead this package came as answer.

## Models
Description of models chronologically.

### carrier
Train carrier of given train. 

### train_stop
Single place where train stops.

### delay
Delay in minutes with information if delay was planned (e.g. train track construction) or not
(e.g. train accident).

### train
Consists of train category enum (contains all czech and slovak related categories) as well as
additional information about train

For more details, please refer to the model definitions.

## Utils
Utils contains actual "random" generators of trains and journeys. *Names of TrainStop 
are not generated!* 

## Idea list
Current idea list for improvement:
* generating train incidents
* random failure generating
* random not found generating
* tests (Umm... yeah)
* independent package

[style_shield]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[style_link]: https://pub.dev/packages/very_good_analysis
