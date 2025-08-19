# Azure ETL Pipeline: Tokyo Olympics Data Project

## 📌 Project Overview

This project demonstrates an **end-to-end ETL pipeline on Microsoft
Azure** using the **Tokyo Olympics Dataset (from Kaggle)**.\
We leverage **Azure Data Factory, Data Lake Gen2, Azure Databricks, and
Azure Synapse Analytics** to build a modern data pipeline capable of
ingestion, transformation, storage, analytics, and visualization.

------------------------------------------------------------------------

## 🏗 Architecture

The following architecture was implemented:

![Architecture Diagram](./313a9ea2-c947-4484-99b3-815c31681e89.png)

### Workflow:

1.  **Data Source (Kaggle - Tokyo Olympics Dataset)**
    -   Dataset downloaded from Kaggle (CSV files: Athletes, Coaches,
        Teams, Medals, Entries by Gender).
2.  **Data Ingestion (Azure Data Factory)**
    -   Pipelines created in **Azure Data Factory (ADF)** to ingest raw
        CSVs.\
    -   Data copied from Kaggle/local storage → **Azure Data Lake
        Storage Gen2 (Raw Zone)**.
3.  **Raw Data Storage (Azure Data Lake Gen2)**
    -   Ingested CSV files stored in the **Raw Data zone** of ADLS
        Gen2.\
    -   Organized into containers and folders for efficient data
        management.
4.  **Transformation (Azure Databricks + PySpark)**
    -   Azure Databricks notebook connected with ADLS Gen2.\
    -   Performed data cleaning, type casting, and transformations.\
    -   Example transformations:
        -   Cast gender counts to integers.\
        -   Calculate **top countries by Gold medals**.\
        -   Compute **average male/female participation per
            discipline**.\
    -   Curated & transformed data saved back to **ADLS Gen2
        (Curated/Transformed Zones)** in **CSV/Parquet formats**.
5.  **Analytics (Azure Synapse Analytics)**
    -   Transformed data loaded into **Azure Synapse Analytics**.\
    -   SQL queries executed for analytical insights:
        -   Medal tallies per country.\
        -   Gender participation analysis.\
        -   Top 10 medal-winning countries.\
    -   Visualized results in Synapse Studio using **bar and line
        charts**.
6.  **Dashboards (Optional Future Enhancement)**
    -   Data exposed to BI tools for dashboards:
        -   **Power BI**\
        -   **Tableau**\
        -   **Looker Studio**

------------------------------------------------------------------------

## 📊 Dataset Details

**Tokyo Olympics Dataset (Kaggle)**\
- **Files Included**:\
- Athletes.csv\
- Coaches.csv\
- Teams.csv\
- Medals.csv\
- EntriesGender.csv\
- Contains information on participants, coaches, medal tallies, and
gender participation.

------------------------------------------------------------------------

## ⚙️ Tools & Technologies Used

-   **Azure Data Factory** → Data ingestion pipelines\
-   **Azure Data Lake Gen2** → Data storage (Raw, Curated, Transformed
    zones)\
-   **Azure Databricks (PySpark)** → Data cleaning & transformation\
-   **Azure Synapse Analytics** → Data warehousing & SQL analytics\
-   **Visualization Tools** → Synapse Studio (bar/line charts), optional
    Power BI/Tableau

------------------------------------------------------------------------

## 🚀 Steps Implemented

1.  **Ingestion**: Load raw Kaggle CSV files into ADLS Gen2 via Azure
    Data Factory.\
2.  **Storage**: Organize files into Raw Zone (unprocessed data).\
3.  **Transformation**: Use Databricks & PySpark to clean, cast types,
    and derive metrics.\
4.  **Loading**: Store curated & transformed data back into ADLS Gen2.\
5.  **Analytics**: Query using Azure Synapse SQL to derive insights.\
6.  **Visualization**: Create bar/line charts in Synapse Studio and
    explore future dashboard integration.

------------------------------------------------------------------------

## 📈 Example Insights from the Data

-   **Top Gold Medal Countries**: Ordered medal tallies highlight
    dominant nations.\
-   **Gender Participation**: Ratio of male vs female athletes across
    disciplines.\
-   **Discipline-Wise Trends**: Breakdown of entries per event.

------------------------------------------------------------------------

## 🔮 Future Enhancements

-   Automate data refresh with **scheduled pipelines in ADF**.\
-   Implement **Delta Lake format** for optimized storage and ACID
    compliance.\
-   Develop dashboards in **Power BI** or **Tableau** for business
    stakeholders.\
-   Add **CI/CD integration (Azure DevOps / GitHub Actions)** for
    pipeline deployments.

------------------------------------------------------------------------

## 📂 Repository Structure

    ├── notebooks/  
    │   ├── etl_pipeline_tokyo_olympics.ipynb      # Parquet-based pipeline  
    │   ├── etl_pipeline_tokyo_olympics_csv.ipynb  # CSV-based pipeline  
    ├── docs/  
    │   ├── architecture.png                       # Architecture diagram  
    ├── README.md                                  # Project documentation  

------------------------------------------------------------------------

## 🙌 Conclusion

This project showcases how to build a **scalable, cloud-native ETL
pipeline on Azure** by combining **Data Factory, Data Lake Gen2,
Databricks, and Synapse Analytics**.\
It highlights the full data lifecycle from ingestion → transformation →
analytics → visualization, and sets the stage for future dashboarding
and real-time analytics.
