# bipa-ios-test

### Build tools & versions used

- Xcode 16.2 / iOS 18.2

### Steps to run the app

- Open bipa-ios-test.xcodeproj and run the project

### What areas of the app did you focus on?

- Most of the time the app architecture, service, domain models and mapping (from API models)

### What was the reason for your focus? What problems were you trying to solve?\

- Because it concentrates the business logic

### How long did you spend on this project?

### Did you make any trade-offs for this project? What would you have done differently with more time?

- SwiftUI over UIKit to show off SwiftUI skills while losing the possibility of unit testing

### What do you think is the weakest part of your project?

### Is there any other information you’d like us to know?


---

# mempool.space Case 

## Top Nodes by Connectivity List feature specs

### Story: Customer requests to see the top nodes by connectivity list

```
As a customer
I want the app to automatically load a list of the top nodes by connectivity
So I can see the top lightning nodes with opened channels
```

#### Scenarios (Acceptance criteria)

```
Given the customer has connectivity
When the customer opens up the app
Then the app should display the list of the top lightning nodes by connectivity
```

## Use Cases

### Load Top Nodes by Connectivity from Remote Use Case

#### Data:
- URL

#### Primary course (happy path):
1. Execute "Load Top Nodes by Connectivity" with above data.
2. System downloads data from the URL.
3. System validates downloaded data.
4. System creates nodes from valid data.
5. System delivers nodes data.

#### Invalid data - error course (sad path):
1. System delivers invalid data error.

#### No connectivity – error course (sad path):
1. System delivers connectivity error.

---

## Model Specs

### Node

| Property      | Type              |
|---------------|-------------------|
| `publicKey`   | `String`          |
| `alias`       | `String`          |
| `channels`    | `Int`             |
| `capacity`    | `Int`             |
| `firstSeen`   | `Int`             |
| `updatedAt`   | `Int`             |
| `city`        | `LocatedName?`    |
| `country`     | `LocatedName?`    |

### LocatedName

| Property      | Type          |
|---------------|---------------|
| `en`          | `String`      |
| `ptBR`        | `String?`     |

### Payload contract

```
GET /api/v1/lightning/nodes/rankings/connectivity

200 RESPONSE

> See top-100-nodes-by-connectivity-sample.json
```

---

## Logbook

### Jan 14

- Started test on Jan 14 at 7:40PM
- Created repository at 7:45PM
- Started reading challenge docs at 7:48PM
- Finished reading challenge docs and mempool.space docs (https://mempool.space/docs/api/rest)
  - Goals: Tried to find paging and other resources but couldn't find it... 
- Started thinking about project constraints, recommendations, technical requirements and project delivery planning at 8:00PM
  - Given the expected time box of 3 to 5 hours, I will create a pretty straightforward project on SwiftUI (as it is a positive thing) with a simple list, without pagination since there's no API capability for it and pull-to-refresh feature. 
  - The first thing is to organize the data I will use from the API as well as the UI design,
  - I will try to focus on the architecture (View) I am used to deal on my daily activities so it will be written on MVVM.
  - Unit tests are important so I will develop things that's not related to the UI with tests just to avoid having a third-party dependencies to deal with snapshot tests
- Finished initial plan at 8:08PM
- Paused progress at 8:08PM
- Resumed at 8:15PM
- Started developing project / docs
- Finished docs for node listing at 8:46PM
- Paused progress on Jan 14 at 8:46PM

### Jan 15

- Started developing project at 7:52PM
- Paused progress at 9:21PM
- Resumed progress at 10:00PM
