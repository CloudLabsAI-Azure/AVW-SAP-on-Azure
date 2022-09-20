# Exercise 3: Configure the DataFlow

## Introduction

In this step we'll setup the dataflow from the SAP System and Cosmos DB towards the Synapse DB. Sales OrderHeaders will be extracted via the first Synapse pipeline 
using the SAP Table connector, Sales Order Items will be extracted via a second Synapse Pipeline using the SAP ECC (oData) connector. Payment data will be extracted
from CosmosDB using a third pipeline.

   ![](media/ex3-architectureOverview.png)
   
### Task 1: Create Synapse Tables in SQL Pool

1. From the Synapse Studio, click on **Develop** from the left-menu.

   ![](media/ex3-develop.png)
   
2. From the **Develop** pane, click on ```+``` **(1)** and select **SQL script** **(2)** to add table for SalesOrderHeaders.

   ![](media/ex3-create1.png)
   
3. In the Properties, enter the Name as **CreateSalesOrderHeaders** **(1)** and change the SQL pool ```Connect to``` **sapdatasynsql** **(2)**. Then copy the below code and paste it in the codespace **(3)** and click on **Run** **(4)**.

   ```sql
   CREATE TABLE SalesOrderHeaders(
	        BILLINGCOMPANYCODE nvarchar(4),
	        BILLINGDOCUMENTDATE date,
	        COUNTRY nvarchar(3),
	        CREATIONDATE date,
	        CREATIONTIME time,
	        CREDITCONTROLAREA nvarchar(4),
	        CUSTOMERACCOUNTGROUP nvarchar(4),
	        CUSTOMERGROUP nvarchar(2),
	        CUSTOMERNAME nvarchar(80),
	        DISTRIBUTIONCHANNEL nvarchar(2),
	        LASTCHANGEDATE date,
	        LASTCHANGEDATETIME decimal(21,0),
	        MANDT int,
	        ORGANIZATIONDIVISION nvarchar(2),
	        PRICINGDATE date,
	        PURCHASEORDERBYCUSTOMER nvarchar(35),
	        SALESDISTRICT nvarchar(6),
	        SALESDOCUMENT nvarchar(10) NOT NULL,
	        SALESDOCUMENTPROCESSINGTYPE nvarchar(1),
	        SALESDOCUMENTTYPE nvarchar(4),
	        SALESGROUP nvarchar(3),
	        SALESOFFICE nvarchar(4),
	        SALESORGANIZATION nvarchar(4),
	        SDDOCUMENTCATEGORY nvarchar(4),
	        SOLDTOPARTY nvarchar(10),
	        TOTALNETAMOUNT decimal(15, 2),
	        TRANSACTIONCURRENCY nvarchar(5),
	        CITYNAME nvarchar(35),
	        POSTALCODE nvarchar(10)
   )
   ```
   
   ![](media/ex3-sqlscript1.png)
   
4. From the **Develop** pane, click on ```+``` **(1)** and select **SQL script** **(2)** to add table for SalesOrderItems.

   ![](media/ex3-create2.png) 
   
5. In the Properties, enter the Name as **CreateSalesOrderItems** **(1)** and change the SQL pool ```Connect to``` **sapdatasynsql** **(2)**. Then copy the below code and paste it in the codespace **(3)** and click on **Run** **(4)**.

   ```sql
   CREATE TABLE SalesOrderItems(
                SalesOrder nvarchar(20),
                SalesOrderItem nvarchar(15),
                SalesOrderItemText nvarchar(80),
                SoldToParty nvarchar(20),
                MaterialByCustomer nvarchar(70),
                MaterialName nvarchar(80),
                Material nvarchar(80),
                ShipToParty nvarchar(25),
                FullName nvarchar(130),
                SDProcessStatus nvarchar(5),
                DeliveryStatus nvarchar(5),
                SDDocumentRejectionStatus nvarchar(5),
                SalesDocumentRjcnReason nvarchar(20),
                RequestedQuantity decimal(20,12),
                RequestedQuantityUnit nvarchar(10),
                TransactionCurrency nvarchar(10),
                NetAmount decimal(30, 10),
                MaterialGroup nvarchar(20),
                Batch nvarchar(20),
                ProductionPlant nvarchar(10),
                StorageLocation nvarchar(10),
                ShippingPointName nvarchar(60),
                ShippingPoint nvarchar(10),
                SalesOrderItemCategory nvarchar(10),
                BillingBlockCriticality tinyint,
                ItemBillingBlockReason nvarchar(6),
                OrderRelatedBillingStatus nvarchar(5),
                RequestedDeliveryDate date,
                HigherLevelItem nvarchar(15),
                SalesOrderProcessingType nvarchar(5),
                RequirementSegment nvarchar(80)
   )
   ```
   
   ![](media/ex3-sqlscript2.png)
   
6. From the **Develop** pane, click on ```+``` **(1)** and select **SQL script** **(2)** to add table for Payments.

   ![](media/ex3-create3.png) 
   
7. In the Properties, enter the Name as **CreatePayments** **(1)** and change the SQL pool ```Connect to``` **sapdatasynsql** **(2)**. Then copy the below code and paste it in the codespace **(3)** and click on **Run** **(4)**.

   ```sql
   CREATE TABLE Payments(
	   PaymentNr nvarchar(10),
	   SalesOrderNr nvarchar(10),
	   CustomerNr nvarchar(10),
	   CustomerName nvarchar(80),
	   PaymentDate date,
	   PaymentValue decimal(15,2),
	   Currency nvarchar(5)
   )
   ```
   
   ![](media/ex3-sqlscript3.png)
   
8. After running all the 3 SQL Scripts (CreateSalesOrderHeaders, CreateSalesOrderItems, CreatePayments), click on **Publish all**.

   ![](media/ex3-publishsql.png)
   
9. In the Publish all conformation page, click on **Publish**.

   ![](media/ex3-publishconfirm.png)
   
10. You will see the notification pop-up as Publishing completed.

    ![](media/ex3-publishcomplete.png)    

### Task 2: Create a Linked Service and Integration dataset to the SAP System

1. From the left-menu of Synapse Studio, click on **Manage** to create linked service.

   ![](media/ex2-clickmanage.png)
   
2. Under External connections, select **Linked services** **(1)** and click on **+ New** **(2)**.

   ![](media/ex3-linkedservicesh.png)
   
3. In New linked service pane, search for **SAP** **(1)** and select **SAP HANA** **(2)**. Then click on **Continue** **(3)**.

   ![](media/ex3-saphanals.png)
   
4. Now, enter the below values in New linked service pane:
   
    | Parameter                                  | Value                                                           |
    | -----------------------------------------  | --------------------------------------------------------------- |
    |  Name **(1)**                              |  **SapHanaLS<inject key="DeploymentID" enableCopy="false"/>**   |
    |  Connecte via integration runtime **(2)**  |  **sap-intrun-<inject key="DeploymentID" enableCopy="false"/>** |
    |  Server name **(3)**                       |  **10.0.1.6:30213**                                             |
    |  Authentication type **(4)**               |  **Basic authentication**                                       |
    |  User name **(5)**                         |  **SYSTEM**                                                     |
    |  Password **(6)**                          |  **Password#1219**                                              |
   
   After adding all the above values, click on **Test connection** **(7)** to ensure that connection is successful and then click on **Create** **(8)**.
   
   ![](media/ex3-shlscreate.png)

5. Now, click on **Data** from the left-menu of Synapse studio and select **Linked**.

   ![](media/ex3-datalinked.png)
   
6. To create a new integration dataset, click on ```+``` **(1)** and select **Integration dataset** **(2)**.

   ![](media/ex3-int-dataset.png)
   
7. Search for **SAP** **(1)** and select **SAP HANA** **(2)**. Then click on **Continue** **(3)** in New integration dataset pane. 

   ![](media/ex3-newid.png)
   
8. In Set properties pane, enter Name as **SapHanaTable<inject key="DeploymentID" enableCopy="false"/>** **(1)** and select **SapHanaLS<inject key="DeploymentID" enableCopy="false"/>** **(2)** for linked service from the drop-down which you have created earlier. Wait for few seconds to load the tables, search for  **SALES.Sales_Orders_Headers** **(3)** table and select it from the drop-down. Then click on **Ok** **(4)**.

   ![](media/ex3-id-setprop.png)
   
9. Once the Integration dataset is created, click on **Preview data** to see the data for the selected table is the previous step.

   ![](media/ex3-previewdata.png) 
   
### Task 3: Create a Linked Service to the Synapse SQL Pool

1. From the left-menu of Synapse Studio, click on **Manage** to create linked service.

   ![](media/ex2-clickmanage.png)
   
2. Under External connections, select **Linked services** **(1)** and click on **+ New** **(2)**.

   ![](media/t4-ex3-1.png)
   
3. In New linked service pane, search for **Synapse** **(1)** and select **Azure Synapse Analytics** **(2)**. Then click on **Continue** **(3)**.

   ![](media/t4-ex3-2.png)

4. Now, enter the below values in New linked service pane:
   
    | Parameter                                  | Value                                                           |
    | ----------------------------------------   | --------------------------------------------------------------- |
    |  Name **(1)**                              |  **SynapseLS<inject key="DeploymentID" enableCopy="false"/>**   |
    |  Connecte via integration runtime **(2)**  |  **AutoResolveIntegrationRuntime**                              |
    |  Azure subscription **(3)**                |  **Select the available subscription in which Synapse workspace is deployed** |
    |  Server name **(4)**                       |  **sapdatasynwsSUFFIX**                                         |
    |  Database name **(5)**                     |  **sapdatasynsql**                                              |
    |  Authentication type **(6)**               |  **SQL authentication**                                         |
    |  User name **(7)**                         |  **azureadmin**                                                 |
    |  Password **(8)**                          |  **Sapdata!pass123**                                            |
    
   After adding all the above values, click on **Test connection** **(9)** to ensure that connection is successful and then click on **Create** **(10)**.
   
   ![](media/t4-ex3-3.png)
   
### Task 4: Create an Integration DataSet for the Synapse Sales Orders

1. Now, click on **Data** from the left-menu of Synapse studio and select **Linked**.

   ![](media/ex3-datalinked.png)
   
2. To create a new integration dataset, click on ```+``` **(1)** and select **Integration dataset** **(2)**.

   ![](media/t5-ex3-1.png)
   
3. Search for **Synapse** **(1)** and select **Azure Synapse Analytics** **(2)**. Then click on **Continue** **(3)** in New integration dataset pane. 

   ![](media/t5-ex3-2.png)
   
4. In Set properties pane, enter Name as **SynapseTable<inject key="DeploymentID" enableCopy="false"/>** **(1)** and select **SynapseLS<inject key="DeploymentID" enableCopy="false"/>** **(2)** for linked service from the drop-down which you have created earlier. Wait for few seconds to load the tables, search for  **dbo.SalesOrderHeaders** **(3)** table and select it from the drop-down. Then click on **Ok** **(4)**.

   ![](media/t5-ex3-3.png)
   
5. Once the Integration dataset is created, click on **Preview data** to see the column names for the selected table is the previous step.

   ![](media/t5-ex3-4.png)

### Task 5: Create an Integration pipeline to extract SalesOrderHeaders data

1. Now, click on **Integrate** from the left-menu of Synapse studio.

   ![](media/t6-ex3-1.png)
   
2. To create a new Pipeline, click on ```+``` **(1)** and select **Pipeline** **(2)**.

   ![](media/t6-ex3-2.png)
   
3. In Properties, under General enter the name as **ExtractSalesOrderHeaders** **(1)**. Under Move & transform from Activities menu, drag and drop the **Copy data** **(2)** option to the pipeline canvas. Then enter the name as **ExtractSalesOrderHeaders** **(3)** under General.

   ![](media/t6-ex3-3.png)
   
4. In the **Source** **(1)** tab, select **SapHanaTable<inject key="DeploymentID" enableCopy="false"/>** **(2)** Dataset as the source.

   ![](media/t6-ex3-4.png)

5. In the **Sink** **(1)** tab, select the **SynapseTable<inject key="DeploymentID" enableCopy="false"/>** **(2)** Dataset as the sink. Under Copy method ensure to select **PolyBase** **(3)**.

   ![](media/t6-ex3-5.png)

6. In the **Mapping** **(1)** tab, choose **Import schemas** (2). Since source and target fields have the same name, the system can auto-generate the mapping.

   ![](media/t6-ex3-6.png)

7. Once the Import schemas is completed, you will be able to see the Mapping tab as shown below.

   ![](media/t6-ex3-7.png)

8. For the prediction model we will calculate the offset between the billing document date and the actual payment data. For this we need to have these date fields mapped to SQL Date fields. Therefore, go to the **View JSON Code** **{}** for the pipeline.

   ![](media/t6-ex3-8.png)

9. Add the parameters **convertDateToDatetime** and **convertTimeToTimespan** at the existing **typeproperties > source** element. The resulting document should looks as follows :

   ```bash
     "typeProperties": {
             "source": {
                   "type": "SapTableSource",
                   "partitionOption": "None",
                   "convertDateToDatetime": true,
                   "convertTimeToTimespan": true
              },
              "sink": { 
                        ...
    ```

    ![](media/t6-ex3-9.png)

10. In the **Settings** **(1)** blade, check the box for **Enable staging** **(2)** and use the existing staging account linked service **sapdatasynwsSUFFIX** **(3)** to the Synapse Data Lake. Click on **Browse** **(4)** to the staging directory **sap-data-adls/staging** **(5)**, which was already created by the Terraform script.

    ![](media/t6-ex3-10.png)

11. Now click **Publish all** at the top of the Synapse studio. In the Publish all pane, click on **Publish** to confirm.

    ![](media/t6-ex3-11.png)

    ![](media/t6-ex3-12.png)

12. Once the Publish completed. click on **Add trigger** **(1)** and select **Trigger now** **(2)** to trigger the pipeline. In the Pipeline run pane, click on **Ok** to confirm.

    ![](media/t6-ex3-13.png)
    
    ![](media/t6-ex3-14.png)

13. Swith to **Monitor** **(1)** from the left-menu, click on **Pipeline runs** **(2)** under Integration and select the **ExtractSalesOrderHeaders** pipeline which got **Succeeded**.

    ![](media/t6-ex3-15.png)

14. Check the result in Synapse using SQL. You can do this via the **Develop** **(1)**, click on ```+``` **(2)** and select **SQL script** **(3)** to create a new SQL script.

    ![](media/t6-ex3-16.png)

15. Enter the below SQL script into the codespace **(1)** and change the SQL pool ```Connect to``` **sapdatasynsql** **(2)**. Then click on **Run** **(3)** and explore the **Results** **(4)**.

    ```bash
    select count(*) from SalesOrderHeaders
    select * from SalesOrderHeaders
    ```

    ![](media/t6-ex3-17.png)

### Task 6: Create an Integration Dataset for the SAP Sales Order Item

1. Now, click on **Data** from the left-menu of Synapse studio and select **Linked**.

   ![](media/ex3-datalinked.png)
   
2. To create a new integration dataset, click on ```+``` **(1)** and select **Integration dataset** **(2)**.

   ![](media/t5-ex3-1.png)
   
3. Search for **SAP** **(1)** and select **SAP HANA** **(2)**. Then click on **Continue** **(3)** in New integration dataset pane. 

   ![](media/ex3-newid.png)
   
4. In Set properties pane, enter Name as **SapHanaTableItems<inject key="DeploymentID" enableCopy="false"/>** **(1)** and select **SapHanaLS<inject key="DeploymentID" enableCopy="false"/>** **(2)** for linked service from the drop-down which you have created earlier. Wait for few seconds to load the tables, search for  **SALES.Sales_Orders_items** **(3)** table and select it from the drop-down. Then click on **Ok** **(4)**.

   ![](media/t6-orderitems-1.png)
   
5. Once the Integration dataset is created, click on **Preview data** to see the data for the selected table is the previous step.

   ![](media/t6-orderitems-2.png)   

### Task 7: Create an Integration Dataset for the Synapse Sales Order Items

1. Now, click on **Data** from the left-menu of Synapse studio and select **Linked**.

   ![](media/ex3-datalinked.png)
   
2. To create a new integration dataset, click on ```+``` **(1)** and select **Integration dataset** **(2)**.

   ![](media/t5-ex3-1.png)
   
3. Search for **Synapse** **(1)** and select **Azure Synapse Analytics** **(2)**. Then click on **Continue** **(3)** in New integration dataset pane. 

   ![](media/t5-ex3-2.png)
   
4. In Set properties pane, enter Name as **SynapseTableItems<inject key="DeploymentID" enableCopy="false"/>** **(1)** and select **SynapseLS<inject key="DeploymentID" enableCopy="false"/>** **(2)** for linked service from the drop-down which you have created earlier. Wait for few seconds to load the tables, search for  **dbo.SalesOrderItems** **(3)** table and select it from the drop-down. Then click on **Ok** **(4)**.

   ![](media/t7-synapseitems-1.png)
   
5. Once the Integration dataset is created, click on **Preview data** to see the column names for the selected table is the previous step.

   ![](media/t7-synapseitems-1.png)
   
### Task 8: Create the integration pipeline to extract SalesOrderItems data

1. Now, click on **Integrate** from the left-menu of Synapse studio.

   ![](media/t6-ex3-1.png)
   
2. To create a new Pipeline, click on ```+``` **(1)** and select **Pipeline** **(2)**.

   ![](media/t6-ex3-2.png)
   
3. In Properties, under General enter the name as **ExtractSalesOrderHeaders** **(1)**. Under Move & transform from Activities menu, drag and drop the **Copy data** **(2)** option to the pipeline canvas. Then enter the name as **ExtractSalesOrderHeaders** **(3)** under General.

   ![](media/t6-ex3-3.png)
   
4. In the **Source** **(1)** tab, select **SapHanaTable<inject key="DeploymentID" enableCopy="false"/>** **(2)** Dataset as the source.

   ![](media/t6-ex3-4.png)

5. In the **Sink** **(1)** tab, select the **SynapseTable<inject key="DeploymentID" enableCopy="false"/>** **(2)** Dataset as the sink. Under Copy method ensure to select **PolyBase** **(3)**.

   ![](media/t6-ex3-5.png)

6. In the **Mapping** **(1)** tab, choose **Import schemas** (2). Since source and target fields have the same name, the system can auto-generate the mapping.

   ![](media/t6-ex3-6.png)

7. Once the Import schemas is completed, you will be able to see the Mapping tab as shown below.

   ![](media/t6-ex3-7.png)

8. For the prediction model we will calculate the offset between the billing document date and the actual payment data. For this we need to have these date fields mapped to SQL Date fields. Therefore, go to the **View JSON Code** **{}** for the pipeline.

   ![](media/t6-ex3-8.png)

9. Add the parameters **convertDateToDatetime** and **convertTimeToTimespan** at the existing **typeproperties > source** element. The resulting document should looks as follows :

   ```bash
     "typeProperties": {
             "source": {
                   "type": "SapTableSource",
                   "partitionOption": "None",
                   "convertDateToDatetime": true,
                   "convertTimeToTimespan": true
              },
              "sink": { 
                        ...
    ```

    ![](media/t6-ex3-9.png)

10. In the **Settings** **(1)** blade, check the box for **Enable staging** **(2)** and use the existing staging account linked service **sapdatasynwsSUFFIX** **(3)** to the Synapse Data Lake. Click on **Browse** **(4)** to the staging directory **sap-data-adls/staging** **(5)**, which was already created by the Terraform script.

    ![](media/t6-ex3-10.png)

11. Now click **Publish all** at the top of the Synapse studio. In the Publish all pane, click on **Publish** to confirm.

    ![](media/t6-ex3-11.png)

    ![](media/t6-ex3-12.png)

12. Once the Publish completed. click on **Add trigger** **(1)** and select **Trigger now** **(2)** to trigger the pipeline. In the Pipeline run pane, click on **Ok** to confirm.

    ![](media/t6-ex3-13.png)
    
    ![](media/t6-ex3-14.png)

13. Swith to **Monitor** **(1)** from the left-menu, click on **Pipeline runs** **(2)** under Integration and select the **ExtractSalesOrderHeaders** pipeline which got **Succeeded**.

    ![](media/t6-ex3-15.png)

14. Check the result in Synapse using SQL. You can do this via the **Develop** **(1)**, click on ```+``` **(2)** and select **SQL script** **(3)** to create a new SQL script.

    ![](media/t6-ex3-16.png)

15. Enter the below SQL script into the codespace **(1)** and change the SQL pool ```Connect to``` **sapdatasynsql** **(2)**. Then click on **Run** **(3)** and explore the **Results** **(4)**.

    ```bash
    select count(*) from SalesOrderHeaders
    select * from SalesOrderHeaders
    ```

    ![](media/t6-ex3-17.png)

### Task 10: Create Linked Service for Cosmos DB

1. From the left-menu of Synapse Studio, click on **Manage** to create linked service.

   ![](media/ex2-clickmanage.png)
   
2. Under External connections, select **Linked services** **(1)** and click on **+ New** **(2)**.

   ![](media/t4-ex3-1.png)
   
3. In New linked service pane, search for **Cosmos** **(1)** and select **Azure Cosmos DB (SQL API)** **(2)**. Then click on **Continue** **(3)**.

   ![](media/t10-ex3-1.png)   
   
4. Now, enter the below values in New linked service pane:
   
    | Parameter                                  | Value                                                                 |
    | ----------------------------------------   | ---------------------------------------------------------------       |
    |  Name **(1)**                              |  **CosmosDbLS<inject key="DeploymentID" enableCopy="false"/>**        |
    |  Connecte via integration runtime **(2)**  |  **AutoResolveIntegrationRuntime**                                    |
    |  Authentication type **(3)**               |  **Account key**                                                      |
    |  Azure subscription **(4)**                |  **Select the available subscription in which Cosmos DB is deployed** |
    |  Azure Cosmos DB account name **(5)**      |  **sap-data-cosmos-SUFFIX**                                           |
    |  Database name **(6)**                     |  **SAPS4D**                                                           |
    
   After adding all the above values, click on **Test connection** **(7)** to ensure that connection is successful and then click on **Create** **(8)**.
   
   ![](media/t10-ex3-2.png)
   
### Task 11: Create an Integration Dataset for the Cosmos DB Payments

1. Now, click on **Data** from the left-menu of Synapse studio and select **Linked**.

   ![](media/ex3-datalinked.png)
   
2. To create a new integration dataset, click on ```+``` **(1)** and select **Integration dataset** **(2)**.

   ![](media/t5-ex3-1.png)
   
3. Search for **Cosmos** **(1)** and select **Azure Cosmos DB (SQL API)** **(2)**. Then click on **Continue** **(3)** in New integration dataset pane. 

   ![](media/t11-ex3-1.png)
   
4. In Set properties pane, enter Name as **CosmosDbIDS<inject key="DeploymentID" enableCopy="false"/>** **(1)** and select **CosmosDbLS<inject key="DeploymentID" enableCopy="false"/>** **(2)** for linked service from the drop-down which you have created earlier. For Conatiner select **paymentData** **(3)** from the drop-down and then click on **Ok** **(4)**.

   ![](media/t11-ex3-2.png)    

### Task 12: Setup Payments Integration Dataset and create an Integration Dataset for the Synapse Payments

1. Now, click on **Data** from the left-menu of Synapse studio and select **Linked**.

   ![](media/ex3-datalinked.png)

2. An Azure Synapse is deployed with an underlying Azure Data Lake Storage Gen2 linked service which was already created by the Terraform script. Click on down arrow of **Azure Data Lake Storage Gen2** **(1)**, followed by click on down arrow of **sapdatasynwsSUFFIX** **(2)** and then double-click on **sap-data-adls (Primary)** **(3)**. Ensure that you are inside the **sap-data-adls >staging** **(4)** directory.

   ![](media/t7-ex3-1.png)

3. In the Upload Files pane, click on **Browse** **(1)** icon and navigate to ```C:\LabFiles``` directory and select the **paymentData_CAL2021.csv** **(2)** file from the local disk. Then click on **Upload** **(3)**.

   ![](media/t7-ex3-2.png)
   
4. Once File upload completed, select the **paymentData_CAL2021.csv** **(1)** file and click on **New integration dataset** **(2)**.

   ![](media/t7-ex3-3.png)
   
5. In the New integration dataset pane, enter the name as **PaymentDataset<inject key="DeploymentID" enableCopy="false"/>** **(1)** and for Format select **DelimitedText** **(2)** from the drop-down. Leave default for Import schema and click on **Create** **(3)**.

   ![](media/t7-ex3-4.png)

6. From the **PaymentDataset<inject key="DeploymentID" enableCopy="false"/>** integration dataset pane, select **Semicolon(;)** **(1)** for **Column delimiter** and ensure to **check box** **(2)** for **First row as header**. Then click on **Preview data** **(3)** to see the the payments data.

   ![](media/t7-ex3-5.png)
   
7. Now create a new synapse integration dataset for payments, click on ```+``` **(1)** and select **Integration dataset** **(2)**.

   ![](media/t5-ex3-1.png)
   
8. Search for **Synapse** **(1)** and select **Azure Synapse Analytics** **(2)**. Then click on **Continue** **(3)** in New integration dataset pane. 

   ![](media/t5-ex3-2.png)
   
9. In Set properties pane, enter Name as **SynapsePaymentsIDS<inject key="DeploymentID" enableCopy="false"/>** **(1)** and select **SynapseLS<inject key="DeploymentID" enableCopy="false"/>** **(2)** for linked service from the drop-down which you have created earlier. Wait for few seconds to load the tables, search for  **dbo.Payments** **(3)** table and select it from the drop-down. Then click on **Ok** **(4)**.

   ![](media/t12-ex3-1.png)
   
10. Once the Integration dataset is created, click on **Preview data** to see the column names for the selected table is the previous step.

    ![](media/t12-ex3-2.png)
        
### Task 13: Create an Integration Pipeline for extracting data from Payment Integration dataset to Cosmos DB Integration dataset

1. Now, click on **Integrate** from the left-menu of Synapse studio.

   ![](media/t6-ex3-1.png)
   
2. To create a new Pipeline, click on ```+``` **(1)** and select **Pipeline** **(2)**.

   ![](media/t6-ex3-2.png)

3. In Properties, under General enter the name as **ExtractPayments** **(1)**. Under Move & transform from Activities menu, drag and drop the **Copy data** **(2)** option to the pipeline canvas. Then enter the name as **ExtractPayments** **(3)** under General.

   ![](media/t13-ex3-1.png)
   
4. In the **Source** **(1)** tab, select **PaymentDataset<inject key="DeploymentID" enableCopy="false"/>** **(2)** Dataset as the source.

   ![](media/t13-ex3-2new.png)

5. In the **Sink** **(1)** tab, select the **CosmosDbIDS<inject key="DeploymentID" enableCopy="false"/>** **(2)** Dataset as the sink. Under Copy method ensure to select **PolyBase** **(3)**.

   ![](media/t13-ex3-3new.png)

6. In the **Mapping** **(1)** tab, choose **Import schemas** (2). Since source and target fields have the same name, the system can auto-generate the mapping.

   ![](media/t13-ex3-4.png)

7. Once the Import schemas is completed, make sure to remove the mappings by unchecking the checkbox behind them as shown in the below screenshot.

   ![](media/t13-ex3-5.png)

8. In the **Settings** **(1)** blade, check the box for **Enable staging** **(2)** and use the existing staging account linked service **sapdatasynwsSUFFIX** **(3)** to the Synapse Data Lake. Click on **Browse** **(4)** to the staging directory **sap-data-adls/staging** **(5)**, which was already created by the Terraform script.

    ![](media/t6-ex3-10.png)

9. Now click **Publish all** at the top of the Synapse studio. In the Publish all pane, click on **Publish** to confirm.

    ![](media/t13-ex3-6.png)

10. Once the Publish completed. click on **Add trigger** **(1)** and select **Trigger now** **(2)** to trigger the pipeline. In the Pipeline run pane, click on **Ok** to confirm.

    ![](media/t13-ex3-8.png)
    
    ![](media/t6-ex3-14.png)

11. Swith to **Monitor** **(1)** from the left-menu, click on **Pipeline runs** **(2)** under Integration and select the **ExtractPayments** pipeline which got **Succeeded**.

    ![](media/t13-ex3-9.png)

12. To verify the results, navigate to Azure portal and open the Azure Cosmos DB account with the name **sap-data-cosmos-SUFFIX** in resource group **microhack-<inject key="DeploymentID" enableCopy="false"/>-rg**. Then select **Data Explorer** from the left-menu of Azure Cosmos DB account.

    ![](media/t13-ex3-10.png)
    
13. In the SQL API panel, expand the **SAPS4D** **(1)** and **paymentData** **(2)** conatiner. Select **Items** **(3)**, then choose an item from the paymentData tab. This will display the contents of the selected document for review.

    ![](media/t13-ex3-11.png)  

### Task 14: Create an Integration Pipeline for moving data from Cosmos DB Integration dataset to Synapse payments Integration dataset
    
1. Now, click on **Integrate** from the left-menu of Synapse studio.

   ![](media/t6-ex3-1.png)
   
2. To create a new Pipeline, click on ```+``` **(1)** and select **Pipeline** **(2)**.

   ![](media/t6-ex3-2.png)

3. In Properties, under General enter the name as **ExtractPaymentsData** **(1)**. Under Move & transform from Activities menu, drag and drop the **Copy data** **(2)** option to the pipeline canvas. Then enter the name as **ExtractPaymentsData** **(3)** under General.

   ![](media/t14-ex3-1.png)
   
4. In the **Source** **(1)** tab, select **CosmosDbIDS<inject key="DeploymentID" enableCopy="false"/>** **(2)** Dataset as the source.

   ![](media/t13-ex3-2.png)

5. In the **Sink** **(1)** tab, select the **SynapsePaymentsIDS<inject key="DeploymentID" enableCopy="false"/>** **(2)** Dataset as the sink. Under Copy method ensure to select **PolyBase** **(3)**.

   ![](media/t13-ex3-3.png)

6. In the **Mapping** **(1)** tab, choose **Import schemas** (2). Since source and target fields have the same name, the system can auto-generate the mapping.

   ![](media/t13-ex3-4.png)

7. Once the Import schemas is completed, make sure to remove the mappings by unchecking the checkbox behind them as shown in the below screenshot.

   ![](media/t13-ex3-5.png)

8. In the **Settings** **(1)** blade, check the box for **Enable staging** **(2)** and use the existing staging account linked service **sapdatasynwsSUFFIX** **(3)** to the Synapse Data Lake. Click on **Browse** **(4)** to the staging directory **sap-data-adls/staging** **(5)**, which was already created by the Terraform script.

    ![](media/t6-ex3-10.png)

9. Now click **Publish all** at the top of the Synapse studio. In the Publish all pane, click on **Publish** to confirm.

    ![](media/t14-ex3-2.png)

10. Once the Publish completed. click on **Add trigger** **(1)** and select **Trigger now** **(2)** to trigger the pipeline. In the Pipeline run pane, click on **Ok** to confirm.

    ![](media/t14-ex3-3.png)
    
    ![](media/t6-ex3-14.png)

11. Swith to **Monitor** **(1)** from the left-menu, click on **Pipeline runs** **(2)** under Integration and select the **ExtractPaymentsData** pipeline which got **Succeeded**.

    ![](media/t14-ex3-4.png)

12. Check the result in Synapse using SQL. You can do this via the **Develop** **(1)**, click on ```+``` **(2)** and select **SQL script** **(3)** to create a new SQL script.

    ![](media/t6-ex3-16.png)

13. Enter the below SQL script into the codespace **(1)** and change the SQL pool ```Connect to``` **sapdatasynsql** **(2)**. Then click on **Run** **(3)** and explore the **Results** **(4)**.

    ```bash
    select count(*) from Payments
    select * from Payments
    ```

    ![](media/t14-ex3-5.png)


