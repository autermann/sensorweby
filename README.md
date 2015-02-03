# sensorweby

A JavaScript sensor web client with graphs and analytics powered by Shiny. `sensorweby` is an R extension package building on [Shiny](http://www.rstudio.com/shiny/) and the [52°North JavaScript SOS client](https://github.com/52North/js-sensorweb-client/).

[![Build Status](https://travis-ci.org/52North/sensorweby.png?branch=master)](https://travis-ci.org/52North/sensorweby)

## Installation

The sensorweby packageand the required package `sensorweb4R` are not on CRAN yet, so please download and install the package manually. The first option is using the package ``devtools``, which also works well for your own fork or development versions by other contributors.

```r
devtools::install_github("52North/sensorweb4R")
devtools::install_github("52North/sensorweby")
```

Alternatively, you can download the source code and install the package from source. For this to work must have both [git](http://git-scm.com/downloads) and R (see documentation [here](http://cran.r-project.org/bin/windows/base/rw-FAQ.html#Rcmd-is-not-found-in-my-PATH_0021) for Windows) on your path. Then run the following commands:


```sh
git clone https://github.com/52North/sensorweby
R CMD INSTALL sensorweby
```

## Running 

The `sensorweby` package only has one function to start the interactive web client:

```r
library(sensorweby)
run()
```

To close the client interrupt R, usually by hitting Esc or Ctrl + C.

For more information about running Shiny apps on the server see the [Shiny documentation](http://shiny.rstudio.com/).

The package ships with example applications:

```r
runExample("basic")
runExample("distance-matrix")
runExample("pollutionPlot")
runExample("timePlot")
```

## Configuration

You can configure the application by passing a configuration file in YAML format to the function `run(..)`. The default configuration files is at `js-swc/settings.yml`.

### Interface Builder Functions

#### Begin Time Input

`swcTimeBeginInput` adds a new reactive input that contains the currently selected start time (as a `POSIXct`) of the JavaScript SensorWebClient. Returns a HTML `input` tag.

| Parameter | Description         |
|-----------|---------------------|
| `id `     | the id of the input |

##### Example

```r
swcTimeBeginInput('begin')

```

#### End Time Input

`swcTimeEndInput` adds a new reactive input that contains the currently
selected end time (as a `POSIXct`) of the JavaScript SensorWebClient.
Returns a HTML `input` tag.

| Parameter | Description         |
|-----------|---------------------|
| `id `     | the id of the input |

##### Example

```r
swcTimeEndInput('end')

```

#### Timeseries Input

`swcTimeseriesInput` adds a new reactive input that contains a list identifiers of the currently selected time series of the JavaScript SensorWebClient. Returns a HTML `input` tag.

| Parameter | Description         |
|-----------|---------------------|
| `id `     | the id of the input |

##### Example

```r
swcTimeseriesInput('series')

```

#### I18N Definition

`swcI18N` adds a new I18N value to the JavaScript SensorWebClient. Returns a HTML `script` tag setting the value.

| Parameter | Description             |
|-----------|-------------------------|
| `lang`    | the language identifier |
| `key`     | the message key         |
| `value`   | the message value       |

##### Example

```r

swcI18N('eng', 'button_label', 'OK')

```

#### Left Panel Definition

`swcLeftPanel` creates the left panel of the analysis view of the JavaScript SensorWebClient. Returns a HTML `div` tag for the left panel.

| Parameter   | Description                                         |
|-------------|-----------------------------------------------------|
| `...`       | inherited from `shiny::tags$div`                    |

##### Example

```r
swcLeftPanel(
	plotOutput("output", width="100%", height="100%")
)

```

#### Right Panel Definition

`swcLeftPanel` creates the right panel of the analysis view of the JavaScript SensorWebClient. Returns a HTML `div` tag for the right panel.

| Parameter   | Description                                         |
|-------------|-----------------------------------------------------|
| `header`    | the header of the right panel                       |
| `...`       | inherited from `shiny::tags$div`                    |

##### Example

```r
swcRightPanel(
	header="Parameters",
	selectInput(
 		"pollutant",
 		label="Pollutant",
		choices = c("NOX", "NO2", "O3", "PM10", "SO2", "CO", "PM25"),
 		selected = "NOX"
	),
	swcTimeBeginInput("begin"),
	swcTimeEndInput("end"),
	swcTimeseriesInput("series"),
)

```

#### JavaScript SensorWebClient Page Definition

`swcPage` creates a new page containing the JavaScript SensorWebClient. Returns a HTML `html` tag containing the client.

| Parameter     | Description                                         |
|---------------|-----------------------------------------------------|
| `title`       | the title of the page                               |
| `author`      | the HTML `meta` tag author                          |
| `description` | the HTML `meta` tag description                     |
| `debug`       | indicates if the client should be run in debug mode |
| `...`         | inherited from `shiny::tags$div`                    |

##### Example

```r
swcPage(
	swcLeftPanel(...),
	swcRightPanel(...)
)

```

## Developer Documentation

### Change and test code


```r
require(devtools)

# do your developments...

# install the package or build & reload in RStudio
devtools::install() # when workdir is directory /sensorweby

# load the package
require(sensorweby)

# test...

```

### Updating the JavaScript Sensor Web Client

To install the latest tag of the 52°North JavaScript Sensor Web Client just run:

```r
#require("devtools")
#devtools::install_github('cscheid/rgithub')
#require("github")

# http://stackoverflow.com/questions/15347233/ssl-certificate-failed-for-twitter-in-r
# Set SSL certs globally
#options(RCurlOptions = list(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl")))

require("sensorweby")
installSensorWebClient()
```

To install your own fork:

```r
installSensorWebClient(owner = 'myusername', version = 'mybranch')
```

Both commands require the packages `RCurl` and [`github`](https://github.com/cscheid/rgithub) to be installed. Also, [Maven](http://maven.apache.org/) has to be found in your `PATH`.

## Contact / Support

Please direct support questions to the 52°North Sensor Web Community mailing list/forum: http://sensorweb.forum.52north.org/ (and read the [guidelines](http://52north.org/resources/mailing-list-and-forums/mailinglist-guidelines) beforehand).

Add an issue/comment on [the GitHub repository](https://github.com/52North/sensorweby) if you found a bug or want to collaborate on new features.

## License

This R extension package is licensed under [Apache License 2](https://www.tldrlegal.com/l/apache2).

Documentation (namely the vignettes) are published under [CC BY 4.0](http://creativecommons.org/licenses/by/4.0/).

