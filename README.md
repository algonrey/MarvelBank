# MarvelBank

![Logo](https://github.com/algonrey/MarvelBank/raw/main/MarvelBank/MarvelBank/Assets%20/Assets.xcassets/AppIcon.appiconset/180.png)

Sample app to explore the Marvel API

![AppSample](https://github.com/algonrey/MarvelBank/raw/main/AppExample.gif)

# Development process

The development was done using the MVC architecture trying to be as much organized and independent as possible.

# Libraries used

The following libraries are used in this app:
* **Alamofire**: In order to fire the API calls and retrieve the information
* **KingFisher**: To download and cache the images.

The dependency method used is Swift Package Manager.

# Testing

The app provides some test to assure the the correct behaviour of the components used.

# Final thoughts and improvements

* As requested there is a call to the character api with the character id, but the information it's exactly the same as the call for all the character, so, in order to improve the use of the application, the call to that api can be removed.
* Some of the improvements i was thinking to add are:
    * Add search bar in the main view to search for characters.
    * Change the loading to a less invasive one, while loading more characters while scrolling.
    * Add Paralallax efect on the image of the detail view.
    * Add more information about comics, series, events and stories in the detail view.

Make with ❤️ in Pontevedra.
