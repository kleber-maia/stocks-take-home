# Stocks App / Take Home

### The architectural approach I took and why.
I chose MVVM as main architectural design, together with single-responsibility and dependency injection principles.

And the reasons behind those choices are:

- I wanted to showcase (as much as possible) the kind of work I'm used to do;
- I believe these are current industry standards adopted by many companies;

### The trade offs I made and why.
The majority of the trade offs are related to limiting the UI/UX scope to:

1. Device: iPhone only;
2. Orientation: portrait only;

In addition to not seeking 100% code coverage, but rather picking high value areas to put under test.

And the reason behind those choices is:

- Being able to finish the project inside the 7 days time frame.

### How to run the project.
1. Open Stocks.xcodeproj
2. Pick an iPhone simulator
3. Run

### 3rd party libraries or copied code I'm using.
1. Quick, Nimble: XCTest replacement;
2. Cuckoo: mocking framework;
3. OHHTTOStubs: stubbing for network requests;

### Additional information.
Throughout this week, I took my time to setup and implement the project simulating real world, production conditions. 

I wanted to show as much as possible my mindset and passion for creating software, which includes aspects of craftsmanship for writing code, as well as looking into the product from the owner and end user standing points.

With that in mind, these are a few touches I decided to implement as a way to make it look a little more polished than a simple take home project:

1. Support to system light / dark modes;
2. Accessibility: dynamic font type;
3. Prepared for localization;
4. Filtered, sorted results;
5. Non-fatal errors logging;

I've also simulated a team environment by following Gitflow workflow.
