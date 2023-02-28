# Technical Workshop: SAP on the Microsoft Cloud 


## Overview

**Contoso Retail** processes and distributes food to supermarkets and other small-to-medium sized companies. Generous credit terms based on relationships instead of data analytics has put the company in financial difficulty. 

**Contoso** have challenges identifying customers payment behaviours and notifying customers when they are behind on invoice payments. The accounting department uses manual processes to identify delinquent accounts making the accounts receivable (AR) management time consuming. Also, lenders and have capped CFD’s line of credit and increased the interest rate until they can lower their AR balance and be able to predict near term future cash flow.


When customers buy goods, the corresponding payments are not completed immediately. Some customers will pay directly while other customers will pay at the end of their payment terms. This makes it difficult for Contoso to predict the incoming cashflow. 

To tackle this, Contoso wants to use Azure tooling to predict the incoming cashflow. To predict cash flow, historical Sales Orders and payments data is required. 

## Hands-on lab

To assist Contoso retail, we must develop a solution for predicting cashflow by analysing historical sales orders and payments and employing an Azure machine learning model. To improve the solution even further, we can create powerful dashboards with insights and add the ability to easily share these reports via teams channel.

In this hands-on session, you will learn how to use Azure Synapse Analytics pipelines to extract Sales Order data from SAP and payment information from a non-SAP system (Cosmos DB). The extracted sales orders and invoice data will then be visualised using Power BI. Then, using Azure Machine Learning, you will create a model for forecasting incoming cash flow. Finally, based on the Approver's response status, you will be able to use Power Automate to share the Power BI reports with customers via Teams channels (whether it is approved or rejected).


### Azure services and related products

- SAP HANA
- Power BI
- Power Automate
- Azure Machine Learning
- Azure Automated ML
- Azure Synapse Analytics


## Solution architecture
The solution architecture diagram displays as described below.

 ![](../SAP-on-the-Microsoft-Cloud/media/sap.png)

1. **Sales Order** information is stored in an **SAP system** and **payments data** is stored in Cosmos DB. 
2. **Synapse Pipelines** are used to ingest historical data from both sources (**SAP system** and **Azure Cosmos DB**). 
3. **Power BI** is used to visualize historical data and create reports.
4. **Azure Machine Learning** is used to create a model to predict incoming cash flow. 
5. Finally, a workflow will be triggered from **Power Automate** to share the **Power BI reports to Teams Channel** based on the Approver's response status (Approve/Reject).
