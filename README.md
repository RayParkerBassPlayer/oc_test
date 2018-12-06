# Owens Corning Developer Test

## Notes
The majority of time spend was on Rev 0 stuff:  setting up the app, getting the testing environment set up, etc.
Not a lot of time was spent on testing the resulting JS interface, but here are some highlights:
* The lower level stuff was mainly test-driven after some R & D
* The basic page was test-driven until Javascript got involved and then it was pure R&D type development.  Some specs were sketched in and would be completed before handing in the feature.  The resultant testing wouldn't be that interesting to you, was my thinking.
* Implementation was driven toward a known preference for REST preference at OC with a nod toward some of the bonus questions.
* MySql was used for the unused database.  No Postgres install on my laptop at present.
* Headless JS testing was set up using Selenium/Webkit.  A note below will help with setup if you're not set up for this.

## Bonus Features
* Zip code selection has now been implemented. 
* Email a link to the shingle link added.


### Setup 
The chromedriver needs to be installed to be able to run the tests.  If you're running HomeBrew, the following is all that you should have to do outside of a normal Rails app installation. 
```bash
brew cask install chromedriver
``` 
 

