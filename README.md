# The Green Apple Line
The Ruby Line API adapted for iOS applications and reworked to run in Rails.

Making your DC commute even less painful with real-time updates straight to your iPhone.

## Features
WMATA Metrorail predictions

This will pull data for arrival predictions for the station closest to a fixed location. Location is based on latitude and longitude and must be passed in as optional parameters. Note that this is different than Ruby Line API requests.

```GET "/train"```

Capital BikeShare information

This will pull data for dock and bike availabilities for the 5 closest docking stations to a fixed location. Location is based on latitude and longitude and must be passed in as optional parameters. Note that this is different than Ruby Line API requests.

```GET "/bike"```

## Future Features
WMATA Bus predictions

This will pull data for arrival predictions for bus stops within 1mi of a fixed location. Location is based on latitude and longitude and must be passed in as parameters.

```GET "/bus"```

