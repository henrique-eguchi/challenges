# n-test

### Build tools & versions used

- Xcode 26.0.1 / iOS 26

### Steps to run the app

- Open /NTest/NTest.xcodeproj and run the project

### Time spent

- ~6 hours

---

# URL shortener and retrieval app 

---

# URL shortener and retrieval app 

## URL shortener feature specs

### Story: Customer requests to see the recent shortened URLs

```
As a customer
I want the app to load a list of recent shortened URLs
So I can see the latest shortened URLs
```

#### Scenarios (Acceptance criteria)

```
Given the customer has already shortened at least one URL
When the customer stays at the app screen
Then the app should display the list of the recent shortened URLs
```

### Story: Customer requests to shorten a given URL

```
As a customer
I want the app to shorten a given URL
So I can get a shortened version of it on a list
```

#### Scenarios (Acceptance criteria)

```
Given the customer has connectivity
When the customer opens up the app and send an URL to be shortened
Then the app should update the already displayed list of the recent URLs with this new shortened URL
```

## Use Cases

### Load recent shortened URLs from Memory Use Case

#### Primary course (happy path):
1. System present a list of shortened URLs and its aliases.

#### Empty data (sad path):
1. System present an empty list.

#### No connectivity – error course (sad path):
1. System delivers connectivity error.


### Shorten URL to Remote Service Use Case

#### Data:
- URL

#### Primary course (happy path):
1. Execute "Shorten URL" with above data.
2. System deliver a shorten URL.

#### Invalid data - error course (sad path):
1. System delivers invalid data error.

#### No connectivity – error course (sad path):
1. System delivers connectivity error.

---

## Model Specs

### Alias

| Property      | Type              |
|---------------|-------------------|
| `alias`       | `String`          |
| `_links`      | `Links`           |

### Links

| Property      | Type          |
|---------------|---------------|
| `self`        | `String`      |
| `short`       | `String`      |

### AliasId

| Property      | Type              |
|---------------|-------------------|
| `url`         | `String`          |

### Payload contract

```
Base URL: https://url-shortener-server.onrender.com

> See collection at /api-collection/URL-Shortener

```

---

## Implementation Details

I have developed this project using SwiftUI for Views, MVVM for presentation layer, Repository for data management, Use Cases for business logic encapsulation and async/await throughout the project and XCTests for unit and UI tests.

---

## Logbook

### Oct 25

- Started test on Oct 25 at 6:00PM
- Created draft README.md at 6:00PM
- Started reading challenge docs at 6:02PM
- Finished reading challenge docs at 6:10PM
- Started writing README.md at 6:11PM
- Finished writing the following README.md sections: basic setup info, Stories and Scenarios based on docs at 6:15PM
- Started creating collection to test APIs at 6:15PM
- Finished creating collection at 6:25PM
- Paused progress at 6:30PM
- Resumed at 8:45PM
- Finished writing Use Cases Model specs and other info sections at README.md at 9:15PM
- Stopped at 9:18PM

### Oct 27
- Started developing project at 6:00PM
- Paused for 30m at around 9:00PM
- Stopped at 11:00PM