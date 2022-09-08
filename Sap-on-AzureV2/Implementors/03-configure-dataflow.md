# Exercise 3: Configure the DataFlow

## Introduction

In this step we'll setup the dataflow from the SAP System and Cosmos DB towards the Synapse DB. Sales OrderHeaders will be extracted via the first Synapse pipeline 
using the SAP Table connector, Sales Order Items will be extracted via a second Synapse Pipeline using the SAP ECC (oData) connector. Payment data will be extracted
from CosmosDB using a third pipeline.

   ![](media/ex3-architectureOverview.png)
   
### Task 1: Synapse Table Setup

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
           SalesOrder nvarchar(10),
           SalesOrderItem nvarchar(6),
           SalesOrderItemText nvarchar(40),
           SoldToParty nvarchar(10),
           MaterialByCustomer nvarchar(35),
           MaterialName nvarchar(40),
           Material nvarchar(40),
           ShipToParty nvarchar(10),
           FullName nvarchar(80),
           SDProcessStatus nvarchar(1),
           DeliveryStatus nvarchar(1),
           SDDocumentRejectionStatus nvarchar(1),
           SalesDocumentRjcnReason nvarchar(2),
           RequestedQuantity decimal(15,3),
           RequestedQuantityUnit nvarchar(3),
           TransactionCurrency nvarchar(5),
           NetAmount decimal(16, 3),
           MaterialGroup nvarchar(9),
           Batch nvarchar(10),
           ProductionPlant nvarchar(4),
           StorageLocation nvarchar(4),
           ShippingPointName nvarchar(30),
           ShippingPoint nvarchar(4),
           SalesOrderItemCategory nvarchar(4),
           BillingBlockCriticality tinyint,
           ItemBillingBlockReason nvarchar(2),
           OrderRelatedBillingStatus nvarchar(1),
           RequestedDeliveryDate date,
           HigherLevelItem nvarchar(6),
           SalesOrderProcessingType nvarchar(1),
           RequirementSegment nvarchar(40)
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
