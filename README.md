# Configure MK8 for iOS

Historical native iOS app for Mario Kart 8 kart configurations, statistics,
courses, and maps. This repository owns the Objective-C implementation. The
separate [Android app](https://github.com/clocksmith/cmk8-android) owns its
Java/Android implementation and release history.

## Shared data, separate applications

At iOS `69838cd` and Android `8f73bca`, the following data files have identical
Git blob IDs across both repositories:

| iOS path | Android path | Git blob |
|---|---|---|
| `configuremk8/configuremk8/src/res/data/courses.json` | `app/src/main/assets/data/courses.json` | `70fcef8ee248d409e00bfa13620584a9bff82ebb` |
| `configuremk8/configuremk8/src/res/data/parts.json` | `app/src/main/assets/data/parts.json` | `41d283bb3832fc7963b135faa0494c322356ae98` |

The `bugFix` branch is 11 commits ahead and 15 behind `master` as checked on
October 15, 2026, with distinct model, part, UI, and dependency changes. It is
preserved. Identical default-branch data does not justify dropping that work or
merging the two applications.

No source or data was moved by this organization pass. The existing Xcode project
and CocoaPods manifests describe the historical toolchain; current builds,
App Store availability, and device behavior were not verified here.
