# dbt and Google Bigquery

This repository contains the code that reads data from a Google BigQuery project, creates an ELT pipeline that pushes the data as a view to a different project. It extracts, transforms and loads it into the required format using dbt. There are 3 layers - the source, staging and mart layer. It also implements generic and singular tests using dbt to ensure the data is clean and processed correctly. It also implements a Gitlab CI pipeline that checks if the code compiles. 

### Prerequisites

Requirements for the software and other tools to build, test and push 
- [dbt-bigquery](https://docs.getdbt.com/docs/core/pip-install)
- [dbt-utils](https://hub.getdbt.com/dbt-labs/dbt_utils/latest)
- [dbt-expectations](https://hub.getdbt.com/calogica/dbt_expectations/latest)
- Service account file for a Google Cloud project with the right IAM roles 

### Installation and Setup

1. Clone the repository. Create a virtual environment (preferred) before completing the next steps.

2. To install `dbt-bigquery`, follow the instructions [here](https://docs.getdbt.com/docs/core/pip-install).
3. To install `dbt-utils` and `dbt-expectations`, make sure you have the packages.yml file in the root folder and run the following command in the terminal.

        dbt deps

4. To connect dbt to your Google Cloud project using a service account file, follow the instructions [here](https://docs.getdbt.com/docs/core/connect-data-platform/bigquery-setup). This step will generate a profiles.yml file. 
5. For this project, set the project to `analytics-data` and the dataset to `dbt_your_name` (replace `your_name` with your name). Obtain the service account file from your project admin.


### Model structure

The models directory is structured as follows:

    
    models
        ├── staging                         
            ├── analytics_case       
                ├── sources.yml        
                ├── stg_commission.sql    
                ├── stg_orders.sql
                ├── stg_tables.yml
        ├── marts                            
            ├── sales       
                ├── yearly_sales_and_gross_profit.sql      
                ├── yearly_sales_and_gross_profit.yml    
                

### Running the model, tests
cd to the directory assignment1_dbt. 

1. To run the model, run the following command:

        dbt run

2. To test the model, run

        dbt test

3. To run and test the model, run

        dbt build

### View Docs

To view the dbt docs, run 

    dbt docs generate

Once the catalog.json file is created, run

    dbt docs serve

This will open up the documentation locally and you can view the description, tests, lineage.

<!-- ### Deployment

Add additional notes to deploy this on a live system -->

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on the process for submitting pull requests.

## Authors

  - **Sonu Ranjit Jacob** - [sonuranjitjacob](https://gitlab.com/sonuranjitjacob)

