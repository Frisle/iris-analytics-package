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

## InterSystems Reports

### How to set up InterSystems Reports Designer with InterSystems IRIS

I created two simple examples using the InterSystems IRIS + InterSystems reports and will try to share how easy it is to set up these two applications together!

In the next few paragraphs, I describe a step-by-step guide to this process's ease and simplicity.

After installing the Logi Report Designer, open and choose the InterSystems IRIS icon.

![Logi Report Designer](https://raw.githubusercontent.com/diashenrique/iris-analytics-package/master/img/LogiReport.png)

For the second step, you have the option of choosing an existing Catalog or creating a new one.

![Catalog](https://raw.githubusercontent.com/diashenrique/iris-analytics-package/master/img/Catalog.png)

We will create a new catalog, saving it in your chosen folder, then we will create a new DataSource.

Fill in the fields with the server's IP or DNS name, port, namespace, user, and password.

![Connect](https://raw.githubusercontent.com/diashenrique/iris-analytics-package/master/img/reportConnection.png)

You can then add tables, views, and queries to your data source.

![Adding tables](https://raw.githubusercontent.com/diashenrique/iris-analytics-package/master/img/addTableViewQuery.png)

With your connection information, your tables, views, and/or queries configured, let's move on.

Clicking on the icon *New*, choose **New Report**.

For our report, I chose the Table (Group Left) as the image below:

![After Wizard is complete](https://raw.githubusercontent.com/diashenrique/iris-analytics-package/master/img/reportType.png)

The Table Wizard will guide us by choosing the data source, data display, grouping, summary, chart, filters, and style.

![Table Wizard Data](https://raw.githubusercontent.com/diashenrique/iris-analytics-package/master/img/tableWizard_01.png)

I'm using the covid table that [Evgeny Shvarov](https://github.com/evshvarov/csvgen) created for the [iris-analytics-template](https://github.com/intersystems-community/iris-analytics-template) to my data source on this report sample. The chosen fields are Confirmed and Deaths.

![Table Wizard Display](https://raw.githubusercontent.com/diashenrique/iris-analytics-package/master/img/tableWizard_02.png)

The group for this report will be Contry_Region.

![Table Wizard Group](https://raw.githubusercontent.com/diashenrique/iris-analytics-package/master/img/tableWizard_03.png)

The Summary for Country_Region group will be Confirmed with the Aggregate Function (SUM), the breaking field will be Country_Region in the Footer position.

![Table Wizard Summary](https://raw.githubusercontent.com/diashenrique/iris-analytics-package/master/img/tableWizard_04.png)

Inside the chart step, I chose the Bar Chart with Country_Region as my Category and showed values for the Confirmed field.

![Table Wizard Chart](https://raw.githubusercontent.com/diashenrique/iris-analytics-package/master/img/tableWizard_05.png)

I'm applying one of the pre-existents styles, and the chosen one was "Classic."

![Table Wizard Style](https://raw.githubusercontent.com/diashenrique/iris-analytics-package/master/img/tableWizard_06.png)

The image below shows how the report shows itself after the wizard finish.

![After Wizard is complete](https://raw.githubusercontent.com/diashenrique/iris-analytics-package/master/img/report.png)

The file covid19_cases_-_WorldCount-Sample.pdf (inside the reports folder) it's a "print sample" of the report.

If you want another simple sample, my repo has the file refugees_CitiesImpacted_ReportSample.pdf

Showing the report for the dataset for the [Refugee Admission to the US Ending FY 2018, the dataset is available on Refugee Admission to the US Ending FY 2018 - dataset by associatedpress | data.world](https://data.world/associatedpress/refugee-admissions-to-us-end-fy-2018)
