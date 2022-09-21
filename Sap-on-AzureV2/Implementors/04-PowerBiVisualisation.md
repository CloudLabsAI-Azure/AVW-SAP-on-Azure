# Exercise 4: Power BI Visualization

In this exercise you will be setting up the powerBI reports for the extracted data in the last exercise. You will be using [PowerBI Desktop](https://powerbi.microsoft.com/en-us/desktop/) for this.

### Task 1: Setup & Importing Data to Power BI

1. Navigate to the **microhack-<inject key="DeploymentID" enableCopy="false"/>-rg** resource group in the Azure portal and open the Synapse workspace named **sapdatasynwsSUFFIX** from the resources.

   ![](media/ex4-t1-opensynapse.png)
   
2. In the **Overview** of **sapdatasynwsSUFFIX** Synapse workspace, copy the **Dedicated SQL endpoint** and paste it in notepad for later use.

   ![](media/ex4-t1-copydep.png)
   
3. Open the **Power BI Desktop** application from the LabVM Desktop.

   ![](media/ex4-t1-step1.png)
   
4. On the splash screen, select the **Get Data** item.

   ![](media/ex4-t1-step2.png)
  
5. In the **Get data** pane, search for **Synapse** **(1)** and select **Azure Synapse Analytics (SQL DW)** **(2)**. Then click on **Connect** **(3)**.

   ![](media/ex4-t1-step3.png)

6. On the SQL Server database dialog, enter the below values:

    | Field | Value |
    |-------|-------|
    | Server **(1)** | Enter the **Dedicated SQL endpoint** value recorded in the earlier steps. |
    | Database **(2)** | **sapdatasynsql** |
    | Data Connectivity mode **(3)** | Select **Import**. |
    
   After adding all the above values, click on **Ok** **(4)**.
   
   ![](media/ex4-t1-step4.png)
   
7. An authentication dialog displays, select **Microsoft account** **(1)** from the left menu and then select the **Sign in** **(2)** button.

   ![](media/ex4-t1-step5.png)
   
8. You will see the Sign in dialog apperas, enter the following username, and, then click on **Next**.

   * Email/Username: <inject key="AzureAdUserEmail"></inject>

   ![](media/ex4-t1-step6.png)
   
9. Now enter the following password and click on **Sign in**. 

   * Password: <inject key="AzureAdUserPassword"></inject>

   ![](media/ex4-t1-step7.png)
   
10. Once signed in, select the **Connect** button on the dialog.

    ![](media/ex4-t1-step8.png)
    
11. On the Navigator dialog, **check the box** next to all three tables and then select the **Transform Data** button.

    ![](media/ex4-t1-step9.png)
    
12. Once the data is transformed, you will be seeing the Power Query editor window as shown below:

    ![](media/ex4-t1-step10.png)

13. The columns in the tables representing sales order numbers were incorrectly interpreted as strings by Power BI. In the Power Query editor screen, select **SalesOrderItems** **(1)** from the Queries pane, then right-click on the **SalesOrder** **(2)** field and expand the **Change Type** **(3)** item and choose **Whole Number** **(4)**.

    ![](media/ex4-t1-step15.png)
    
14. Repeat the previous step, this time changing the type of the following table columns to Whole Number.

    | Table (Queries pane) | Column |
    |-------|-------|
    | SalesOrderHeaders | SALESDOCUMENT |
    | Payments | SalesOrderNr |
    
    ![](media/ex4-t1-step11.png)
    
    ![](media/ex4-t1-step12.png)
    
15. Select **Close & Apply** in the Power Query editor toolbar.

    ![](media/ex4-t1-step13.png)
    
16. Once the data loading is completed, you will be able to see all the three tables under the Fields in Power BI Desktop application.

    ![](media/ex4-t1-step14.png)
  
   
   
   
   
   
   
  
