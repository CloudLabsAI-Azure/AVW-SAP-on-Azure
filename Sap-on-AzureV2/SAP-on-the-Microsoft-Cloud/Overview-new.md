# Microsoft Immersion  Workshop: SAP on the Microsoft Cloud

**SAP on the Microsoft Cloud** solution helps you optimize your Enterprise Resource Planning (ERP) in the cloud using the security features, reliability, and scalable SAP-certified infrastructure of Azure.

When managing a global, distributed supply chain and manufacturing environment, companies face challenges with constrained bandwidth, latency issues, and massive volumes of data that can adversely influence execution and quality scenarios.

SAP uses Microsoft Cloud to run these solutions in a software-as-a-service (SaaS) model that can help reduce the customer’s need to manage the software and underlying infrastructure while accelerating the time to value of supply chain applications. Customers will be able to scale globally by leveraging Microsoft Cloud which offers enterprise-grade compute, storage, and network services to support mission-critical performance and business continuity to run SAP Digital Supply Chain solutions


## Hands-on Labs Scenario

**Contoso Retail** processes and distributes food to supermarkets and other small-to-medium sized companies. Generous credit terms based on relationships instead of data analytics has put the company in financial difficulty. 

**Contoso** have challenges identifying customers payment behaviours and notifying customers when they are behind on invoice payments. The accounting department uses manual processes to identify delinquent accounts making the accounts receivable (AR) management time consuming. Also, lenders and have capped CFD’s line of credit and increased the interest rate until they can lower their AR balance and be able to predict near term future cash flow.


When customers buy goods, the corresponding payments are not completed immediately. Some customers will pay directly while other customers will pay at the end of their payment terms. This makes it difficult for Contoso to predict the incoming cashflow. 

To tackle this, Contoso wants to use Azure tooling to predict the incoming cashflow. To predict cash flow, historical Sales Orders and payments data is required. 


## Solution architecture
The solution architecture diagram displays as described below.


![](media/sap.png)

1. **Sales Order** information is stored in an **SAP system** and **payments data** is stored in Cosmos DB. 
2. **Synapse Pipelines** are used to ingest historical data from both sources (**SAP system** and **Azure Cosmos DB**). 
3. **Power BI** is used to visualize historical data and create reports.**Azure Machine Learning** is used to create a model to predict incoming cash flow. 
4. Finally, a workflow will be triggered from **Power Automate** to share the **Power BI reports to Teams Channel** based on the Approver's response status (Approve/Reject).



 ## Lab Context

In this hands-on lab, you will extract (historical) Sales Orders from SAP system and historical payments from a non-SAP system, in this case Cosmos DB and telemetry data sent by the simulated IoT Hub device to Azure IoT Hub using Azure Synapse Analytics pipelines. You will visualize the extracted Sales Orders, IoT Hub device and invoice data with Power BI. 

You will unleash the power of data using Azure Machine Learning to train a model to predict incoming cash flow. You will learn to implement dashboards using Power BI and Power Automate. Finally, you will add the ability to share the Power BI reports to users in Teams channel based on the Approver's response status (Approve/Reject).

This lab includes the following exercises.

## Exercise 1: Getting Started with Azure 

In this exercise, you will log in to the Azure Portal and review the pre-deployed resource groups that are deployed as part of the lab environment.

## Exercise 2: Combine and streamline SAP and non-SAP Data Flow

In this exercise, you will review the pre-deployed **Synapse Pipelines** that are used to extract the  Sales Orders, IoT Hub device and invoice data. You will also run the SQL scripts to review the data for the tables SalesOrderHeaders, SalesOrderItems, Payments, and IoT Hub device.

## Exercise 3: Drive Sales Insight through Power Bi Visualization

In this exercise, you will visualize the Sales Orders data, Payments, and IoT Hub device data in the PowerBI application using the pre-built PowerBI reports. You will also publish the Power BI report to your workspace.

## Exercise 4: Visualize the Sales Orders Payments data in PowerBI

In this exercise, you will visualize the Sales Orders Payments data in the PowerBI application using the pre-built PowerBI reports.

## Exercise 5: Predict Incoming Cashflow

In this exercise, you will be reviewing the pre-deployed Automated ML Run and best-trained model that predicts incoming cash flow based on historical payment delays for previous sales. You will also test the best model and review the results.

## Exercise 6: Import a workflow to export the PowerBI Sales report and Share it with Teams

In this exercise, you will establish connections for Power BI, One Drive for business, Approvals, Microsoft Teams, and Encodian in Power Automate. You will also import and trigger a flow to export the Power BI report and share it to Teams

### Azure services and related products

- SAP HANA
- Power BI
- Power Automate
- Azure Machine Learning
- Azure Automated ML
- Azure Synapse Analytics

