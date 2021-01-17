# Modulate

By Sanath Nair & Jonah Bard
Created for the Hack the North East Hackathon 2021


## Inspiration

As current High School Students struggling to study with the pandemic we decided to create an app that will help us study. The current problem is that students are pacing themselves and end up with lots of studying to do at the last minute. This is really bad as studies have shown that procrastination doesn’t help one. Rather splitting the work over a certain time period is the best way to retain knowledge. 

## What it does

To use Modulate users can create an account which will be stored in Firebase. After that users can create their first personalized track or they can go to the explore tab where they can find community made tracks. Each track is broken down into modules which are small sections of the topic that students want to learn about. They can name the module and write some information about the module to help them study.

## How We built it

To build Modulate we used Flutter for the front-end and Firebase for authentication and database. We choose to use Flutter because it is a fast cross-platform development kit that would easily allow us to upload our apps to the Android Play Store and iOS App Store. We choose to use Firebase since it was also created by Google so the integration with Flutter was really good. Firebase also provides lots of features that would help deal with the expansion of the app.

## Challenges We ran into

Some of the challenges that we ran into was connecting our Flutter UI to Firebase. This originally took some time because we had to download specific JSON files and add configuration keys to make sure that our Flutter app would communicate with Firebase. Once we got Flutter to communicate it took a while to understand the Cloud Firestore No-SQL database structure and how to add and query data. 

## Accomplishments that we are proud of

We are proud to be able to create a running version of our app that works. We are proud about how we were able to set up a backend database to store user information so that they can retrieve data even if the app is closed.

## What We learned

From this project we learned a lot about Flutter and how it works behind the scenes. We learned about state management and also how to connect a UI to a backend database that stores user information.

## What's next for Modulate

We would like to add some more features to make the UX better and completely set up the backend so that it works securely. We would then try and publish the app to the Play Store.
