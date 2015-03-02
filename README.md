# /restartserver Slack Command for DigitalOcean

Enables the following commands on Slack.

* `/restartserver [server_id]`
* `/restartserver`

## Installation

1. Deploy this sinatra app to Heroku. (Don't forget the config vars!)

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://dashboard.heroku.com/new?template=https%3A%2F%2Fgithub.com%2Fsubstrakt%2FSlack-DigitalOcean)

2. Create a slash command in your Slack integrations for `/restartserver` and point it to the Heroku URL given.

-----------

Made by [Substrakt](http://substrakt.co.uk)
![Substrakt Logo](http://substrakt.co.uk/files/2013/04/substrakt-logo1-1024x190.png)
