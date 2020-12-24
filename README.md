# iris-analytics-package
This project has the intention to show a basic approach using the Analytics capabilities of InterSystems IRIS

Especially for those who already using InterSystems IRIS, but without taking advantage of Analytics. The idea is to prove how simple it is.

## Installation

### ZPM
It's packaged with ZPM so it could be installed as:
```
zpm "install iris-analytics-package"
```
then open http://localhost:52773/csp/irisapp/analytics.csp

### Docker
The repo is dockerised so you can  clone/git pull the repo into any local directory

```
$ git clone https://github.com/diashenrique/iris-analytics-package.git
```

Open the terminal in this directory and run:

```
$ docker-compose up -d
```
and open then http://localhost:52773/csp/irisapp/analytics.csp

Or, open the cloned folder in VSCode, start docker-compose and open the URL via VSCode menu:
![](https://raw.githubusercontent.com/diashenrique/iris-analytics-package/master/img/vscodeLinks.png)

## The purpose of this project

The iris-analytics-package has the intention to demonstrate how easy and simple companies can take advantage of InterSystems Analytics support in their software. Whether creating new simple solutions or even using OpenExchange to improve existing ones.

## How this project was created

This project was created using other projects as a base and inspiration. Thanks to @intersystems-community @evshvarov @grongierisc @psteiwer

The projects are:

- [DeepSeeWeb](https://github.com/intersystems-community/DeepSeeWeb)
- [csvgen](https://github.com/evshvarov/csvgen) 
- [csvgen-ui](https://github.com/grongierisc/iris-csvgen-ui)
- [AnalyzeThis](https://github.com/psteiwer/AnalyzeThis)

Those projects together became this humble wizard.
![Fuuuuuuuusion](https://raw.githubusercontent.com/diashenrique/iris-analytics-package/master/img/fusion.gif)

## Import Wizard

The main csp page looks simples, and the process involved is straightforward.

![](https://raw.githubusercontent.com/diashenrique/iris-analytics-package/master/img/importWizard.png)

There a few fields to use the Wizard properly:

1. Choose your CSV file
2. Separator
3. Class Name
4. Choose if you want to create a Cube or not
5. Cube Name
6. Choose if the wizard should create a dashboard sample

### Visualizing the dashboard

O link DSW abre em uma nova aba o DeepSeeWeb. Prety simple, right?!

### Demo

The gif below shows the whole process. After the upload button was clicked, The gif could look frozen, but it's because we have many records there. The selected CSV file has more than 15Mb, and import 134.100 registers!

BTW, the dataset for this demo came from [The Humanitarian Data Exchange - Find, share and use humanitarian data all in one place](https://data.humdata.org/)

![Import Wizard in action!](https://raw.githubusercontent.com/diashenrique/iris-analytics-package/master/img/importWizard.gif)

You can try to use the same dataset; the CSV file is inside the folder ` iris-analytics-package/data`