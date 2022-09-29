# Exercise 5: Predict Incoming Cashflow

In this exercise you wll create a model to predict incoming cashflow based on historical payment delays for previous sales.

You wll be using [Azure Machine Learning](https://ml.azure.com/) for this.

### Task 1: Create a View in Synapse Workspace

1. From the Synapse Studio, click on **Develop** **(1)** from the left-menu. Click on```+``` **(2)** and select **SQL script** **(3)** to create a new view.

   ![](media/ex5-t1-step1.png)
   
2. In the Properties, enter the Name as **CreateSalesPaymentsFull** **(1)** and change the SQL pool ```Connect to``` **sapdatasynsql** **(2)**. Then copy the below code and paste it in the codespace **(3)** and click on **Run** **(4)**.

   ```sql
   CREATE VIEW [dbo].[SalesPaymentsFull]
	        AS SELECT s.[SALESDOCUMENT]
      , s.[CUSTOMERNAME]
      , s.[CUSTOMERGROUP]
      , s.[BILLINGCOMPANYCODE]
      , s.[BILLINGDOCUMENTDATE]
      , p.[PaymentDate] as PAYMENTDATE
      , s.[CUSTOMERACCOUNTGROUP]
      , s.[CREDITCONTROLAREA]
      , s.[DISTRIBUTIONCHANNEL]
      , s.[ORGANIZATIONDIVISION]
      , s.[SALESDISTRICT]
      , s.[SALESGROUP]
      , s.[SALESOFFICE]
      , s.[SALESORGANIZATION]
      , s.[SDDOCUMENTCATEGORY]
      , s.[CITYNAME]
      , s.[POSTALCODE]
      , DATEDIFF(dayofyear, s.BILLINGDOCUMENTDATE, p.PaymentDate) as PAYMENTDELAYINDAYS
    FROM [dbo].[SalesOrderHeaders] as s
   JOIN [dbo].[Payments] as p ON REPLACE(LTRIM(REPLACE(s.[SALESDOCUMENT], '0', ' ')), ' ', '0') = p.[SalesOrderNr]
   ```
   
   ![](media/ex5-t1-step2.png)
   
3. From **Data** **(1)**, click on **Workspace** **(2)** and select **sapdatasynsql** SQL database **(3)**. You will see the created **dbo.SalesPaymentsFull** view under **Views** **(4)**. If you are not able to see, click on eclipse **(...)** button next to **Views** and select **Refresh**.

   ![](media/ex5-t1-step3.png)
   
4. You can now test the view by executing the SQL. From **Develop** **(1)**, click on ```+``` **(2)** and select **SQL script** **(3)** to create a new SQL script.

   ![](media/t6-ex3-16.png)
   
5. Enter the below SQL script into the codespace **(1)** and change the SQL pool ```Connect to``` **sapdatasynsql** **(2)**. Then click on **Run** **(3)** and explore the **Results** **(4)**.

    ```bash
    select * from SalesPaymentsFull
    ```

    ![](media/ex5-t1-step5.png)   
   
### Task 2: Configure the Data store in ML studio

1. Navigate to the **microhack-<inject key="DeploymentID" enableCopy="false"/>-rg** resource group in the Azure portal and open the Azure Machine Learning workspace named **sap-data-ml-ws** from the resources.

   ![](media/ex5-t2-step1.png)
   
2. In the Overview of **sapdatasynwsSUFFIX** Azure Machine Learning workspace, click on **Launch studio**. You will be to navigated to Microsoft Azure Machine Learning Studio.

   ![](media/ex5-t2-step2.png)
   
3. From **Machine Learning Studio**, scroll-down to **Manage** from left-menu. Click on **Datastores** **(1)** and select ```+ Create``` **(2)** to create new datastore.

   ![](media/ex5-t2-step3.png)
   
4. In the Create datastore pane, enter the following values in the respective fields:

   Datastore name : `sap_data_ml_ds`
   Use Data store type : `Azure SQL Database`
   Use Account Selection method : `Enter Manually`
   Use your Synapse Workspace name as `Server Name`
   Use your Synapse SQL Pool as Database Name, in our case this is `sapdatasynsql`
   Select your Subscription
   Enter your resource group name, in our case this is `microhack-sap-data-rg`
   Authentication Type : `SQL Authentication`
   Enter UserId and Password

