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
   
4. In the Create datastore pane, enter the following values in the respective fields and click on **Create** **(11)**.

   | Field                         | Value                        |
   |------------------------------ |----------------------------- |
   | Datastore name (1)            | **sap_data_ml_ds**           |
   | Datastore type (2)           | **Azure SQL Database**       |
   | Account Selection method (3)  | select `Enter Manually`      |
   | Enter your Synapse Workspace name as Server Name (4) | **sapdatasynwsSUFFIX** |
   | Enter your Synapse SQL Pool as Database Name (5) | **sapdatasynsql** |
   | Select your Subscription (6)  | Select the subscription in which **microhack-<inject key="DeploymentID" enableCopy="false"/>-rg** resource group is deployed |
   | Enter your resource group name (7) | **microhack-<inject key="DeploymentID" enableCopy="false"/>-rg** |
   | Authentication Type (8) | **SQL Authentication** |
   | Enter UserId (9)        | **azureadmin**         |
   | Enter Password (10)     |  **Sapdata!pass123**   |
   
   ![](media/ex5-t2-step4.png)
   
5. Once the Datastore is Successfully created, you will be able to see the **sap_data_ml_ds** listed under Datastores.

   ![](media/ex5-t2-step5.png)    

### Task 3: Configure the Automated ML Run

1. In the left menu, click on **Automated ML** **(1)** and select **New Automated ML Run** **(2)**.

   ![](media/ex5-t3-step1.png)
   
2. On the Create a new Automated ML job Select a data asset step, expand the **Create** **(1)** menu and select **From datastore** **(2)**.

   ![](media/ex5-t3-step2.png)
   
3. On the **Create dataset from datastore** blade Basic info step, name the dataset **SalesPaymentsView** **(1)**. Select **Next** **(2)**.

   ![](media/ex5-t3-step3.png)
   
4. From **Datastore selection** step, select the **sap_data_ml_ds** **(1)** datastore. Add the below SQL query **(2)** to get all the data from the view defined above and then click **Next** **(3)**. 

   ```sql
   select * from SalesPaymentsFull
   ```  
   
   ![](media/ex5-t3-step4.png)
   
5. In the **Settings and preview** step, you can ensure and verify the data for the query is working fine by visualizing the data in the next window. Click **Next**.

   ![](media/ex5-t3-step5.png)
   
6. In the **Schema** step, toggle the following **fields off** so that they are not included in the dataset and then select **Next**:

    - SALESDOCUMENT
    - BILLINGDOCUMENTDATE
    - PAYMENTDATE
    - SALESGROUP
    - SALESOFFICE

   ![](media/ex5-t3-step6.png)
   
7. In the **Confirm** details step, select **Create**.

   ![](media/ex5-t3-step7.png)
   
8. On the Select data asset step, select **SalesPaymentsView** **(1)** from the list and select **Next** **(2)**.

   ![](media/ex5-t3-step8.png)
   
9. On the Configure job step, enter the below values:

    | Field | Value |
    |-------|-------|
    | Experiment name (1)     | Check for **Create new**   |
    | New experiment name (2) | Enter **sap-data-ml-experiment** |
    | Target column (3) | Select **PAYMENTDELAYINDAYS** |
    | Select compute type (4) | Select **Compute cluster** |
    | Select Azure ML compute cluster (5) | Click on **+ New** |
   
   ![](media/ex5-t3-step9.png)
   
10. In the Create compute cluster blade Virtual machine step, accept the default values and select **Next**.

     ![](media/ex5-t3-step10.png)
     
11. In the Create compute cluster blade Advanced settings, enter the below values and then select **Create** **(3)**. It takes a few moments for the cluster to be provisioned.

    | Field | Value |
    |-------|-------|
    | Compute name (1) | Enter **sap-data-ml-vm** |
    | Maximum number of nodes (2) | Enter `3`. |
    
    ![](media/ex5-t3-step11.png)
    
12. Once the compute cluster is created successfully, you will be reverted back to the Configure job step. Select the **sap-data-ml-vm** **(1)** computer cluster For Select Azure ML compute cluster from the drop-down and select **Next** **(2)**.

    ![](media/ex5-t3-step12.png)
     
13. In the Select task and settings step, select **Regression** **(1)**, then select **View additional configuration settings** **(2)**.

    ![](media/ex5-t3-step13.png)
    
14. In the Additional configurations blade, select the Primary metric of **Normalized root mean squared error** **(1)**, then **expand the Blocked models** **(2)** drop down, check the following items, and select **Save** **(3)**. This will reduce the time to train the model. Make sure that **DecisionTree** and **XGBoostRegressor** are unchecked.

     - ElasticNet
     - GradientBoosting
     - KNN
     - LassoLars
     - SGD
     - RandomForest
     - ExtremeRandomTrees
     - LightGBM
     - FastLinearRegressor
     - OnlineGradientDescentRegressor    
   
    ![](media/ex5-t3-step14.png)
    
15. Select **Next** on the Select task and settings step. On the Validate and test step, select **Finish**.

    ![](media/ex5-t3-step15.png)
    
16. The job has started creating and opened in the browser. Use the **Refresh** button to monitor the current state.

    > **Note**: Training will take approximately 15-20 minutes.

    ![](media/ex5-t3-step16.png)
    
17. During the run you can follow-up on the tested models via **Models** tab.

    ![](media/ex5-t3-step17.png)
    
### Task 4: Deploy the best trained Model

1. Once the Automated ML job indicates a status of **Completed** **(1)**. Scroll-down to Best model summary card on the screen and select the hyperlink beneath the **Algorithm name** **(2)** heading.

   ![](media/ex5-t4-step1.png)
    
   
   
   
   
   
   
