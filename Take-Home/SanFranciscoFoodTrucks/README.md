Submission notes

Logbook
- 25m - understanding SF city food truck API, building and testing needed requests on Insomnia, planning how each screen will consume those requests

Requests for List and Map screen
        - Separated requests for improved loading time on map

First screen (List)
        - use currently open food trucks request
Second screen (Map)
        - use currently open food trucks pin request - it will return locationid, latitude and longitute to present the pins
        - whenever a user taps on a pin, a new request is made asking for the location details (similar to the request made on first screen but adding the locationid and a limit of 1 - the reason for that is that the api returns more than one result for a given locationid - because of different record for each day of the week - and we want the specific currently open record to display the correct time that they are open)

- 1h - building up project initial structure as well as designing an initial architecture (Service + Mapper, Feature and iOS layer using MVVM). Decorator for Main Queue dispatch and Composer for connecting things up.
- 2h - Developing all project + adding pretty straightforward pagination solution due to time limit - I would use prefetch for this
- 30m - Small tweaks
- 5m - Writing README


Tasks
1. Connect up to data source - DONE
2. Food Truck List - DONE
3. Map - TO DO - Footer View is almost the same as the Cell on Food Truck List - Adding MapKit is pretty straightforward by the way
4. Tests - Service and Feature are testable, I would start creating unit tests for these and then creating one specific for VM

Next steps
1. Develop Map screen
2. Add unit tests
For a full-scale production application, I would also implement the following:
1. Clustering for multiple pins at same location
2. Add integration and E2E tests 
3. Separate Common/Helpers (Core), Service, Features(List and Map), destination specific code (iOS) into different modules
4. Separate App project from the SanFranciscoFoodTrucks - it will improve SoC, modularity/reusability, testing speed, dependency management and so on
5. Different App targets for specific environments