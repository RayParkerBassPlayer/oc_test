# Owens Corning Developer Test

## Notes
The majority of time spend was on Rev 0 stuff:  setting up the app, getting the testing environment set up, etc.
Not a lot of time was spent on testing the resulting JS interface, but here are some highlights:
* The lower level stuff was mainly test-driven after some R & D
* The basic page was test-driven until Javascript got involved and then it was pure R&D type development.  Some specs were sketched in and would be completed before handing in the feature.  The resultant testing wouldn't be that interesting to you, was my thinking.
* Implementation was driven toward a known preference for REST preference at OC with a nod toward some of the bonus questions.
* MySql was used for database.  No Postgres install on my laptop at present.
* Headless JS testing was set up using Selenium/Webkit.  A note below will help with setup if you're not set up for this.

## Bonus Features
* Zip code selection has now been implemented. 
* Email a link to the shingle link added.
* URL is already RESTful, so bookmarking the links is easy.  There is no universal way to bookmark the page automagically from the page as all browers (Chrome, in particular) don't allow this.  A normal user bookmarking of the page is the best that can be offered.
* Favoriteering of a page installed.  This is based on IP and URL.  Not the best measure, but saves to user having to log in to 'favorite' a page.  If a requirement came down the pike that a user should be able to view his favorites a login would likely have to be added. 

### Setup 
The chromedriver needs to be installed to be able to run the tests.  If you're running HomeBrew, the following is all that you should have to do outside of a normal Rails app installation. 
```bash
brew cask install chromedriver
``` 
 

