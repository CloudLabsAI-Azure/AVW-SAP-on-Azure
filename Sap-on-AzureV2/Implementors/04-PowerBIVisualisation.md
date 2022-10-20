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
  
### Task 2: Create the relationship Model between the tables

1. From the left menu, select the **Model** item. This will switch to the Model view.

   ![](media/ex4-t2-step1.png)
   
2. On the Model design canvas, drag the **SALESDOCUMENT** field from the **SalesOrderHeaders** table and drop it on the **SalesOrder** field of the **SalesOrderItems** table. This establishes a **one-to-many relationship ( 1 : * )** between the tables.  
   
   ![](media/ex4-t2-step2new.png)
   
3. Now you can look at the relationship details by double clicking on the connection link between **SalesOrderHeaders** and **SalesOrderItems** tables. After reviewing the relationship details, click **Ok** to close the Edit relationship dialog.

   ![](media/ex4-t2-step3.png)   
   
4. On the Model design canvas, drag the **SalesOrderNr** field from the **Payments** table and drop it on the **SALESDOCUMENT** field in the **SalesOrderHeaders** table. This establishes a **one-to-one relationship ( 1 : 1 )** between the tables.

   ![](media/ex4-t2-step4new.png)

5. Now you can look at the relationship details by double clicking on the connection link between **Payments** and **SalesOrderHeaders** tables. After reviewing the relationship details, click **Ok** to close the Edit relationship dialog.

   ![](media/ex4-t2-step5.png)
   
### Task 3: Data Visualisation

1. To start the visualization, switch to the **Report** view.

   ![](media/ex4-t3-step1.png)
   
- Sales per Date and CustomerGroup visualization
   
2. In the Visualizations pane, select **Stacked column chart** **(1)**. From the Fields pane, drag-and-drop the **SalesOrderHeaders.CREATIONDATE** **(2)** field to the **X-axis** box, the **SalesOrderHeaders.TOTALNETAMOUNT** **(3)** field to the **Y-axis** box and the **SalesOrderHeaders.CUSTOMERGROUP** **(4)** field to the **Legend** box.

   ![](media/ex4-t3-step2new.png)
   
3. You can adjust the sizing of the chart on the report canvas as desired.

   ![](media/ex4-t3-step3.png)
   
- Sales per Region and CustomerGroup visualization
   
4. In the Visualizations pane, select **Map** **(1)**. From the Fields pane, drag-and-drop the **SalesOrderHeaders.CITYNAME** **(2)** field to the **Location** box, the **SalesOrderHeaders.CUSTOMERGROUP** **(3)** field to the **Legend** box and the **SalesOrderHeaders.TOTALNETAMOUNT** **(4)** to the **Bubble size** box.

   ![](media/ex4-t3-step4new.png)
   
5. Adjust the sizing and zoom of the map on the report canvas as desired.

   ![](media/ex4-t3-step5.png)
   
6. You can select a Year and CustomerGroup in the Sales Report, the Map report will automatically update and only show this data.

   ![](media/ex4-t3-step6.png)
   
- Payments per Date and CustomerGroup visualization

7. In the Visualizations pane, select **Stacked Column Chart** **(1)**. From the Fields pane, drag-and-drop the **Payments.PaymentDate** **(2)** field to the **X-axis** box, the **Payments.PaymentValue** **(3)** field to the **Y-axis** box and the **SalesOrderHeaders.CUSTOMERGROUP** **(4)** field to the **Legend** box.   
   
   ![](media/ex4-t3-step7.png)
   
8. Adjust the sizing of the chart on the report canvas as desired.

   ![](media/ex4-t3-step8.png)

- Sales Per CustomerGroup and MaterialGroup visualization

9. In the Visualizations pane, select **Stacked Bar Chart** **(1)**. From the Fields pane, drag-and-drop the **SalesOrderHeaders.CUSTOMERGROUP** **(2)** field to the **Y-axis** box, the **SalesOrderItems.NetAmount** **(3)** field to the **X-axis** box and the **SalesOrderItems.MaterialGroup** **(4)** field to the **Legend** box.

   ![](media/ex4-t3-step9new.png)
   
10. Adjust the sizing of the chart on the report canvas as desired.

    ![](media/ex4-t3-step10.png)

- Payment Offset per CustomerGroup visualization
  - This report shows the average number of days by which each customer group pays their SalesOrders. Afterwards, a comparison can be made with the outcome of the Machine Learning Model built in the next exercise. SalesOrderHeaders and the Payment data are combined to calculate the number of days between the billing date and the payment date.

11. In Power BI Desktop, on **Home** tab toolbar menu expand the **Transform data** item. Select **Transform data**.

    ![](media/ex4-t3-step11.png)
    
12. In the Power Query Editor window, select the **SalesOrderHeaders** **(1)** table from the Queries pane, and expand the **Combine** **(2)** followed by expand **Merge Queries** **(3)** option on the Home toolbar menu. Select the **Merge Queries as New** **(4)** option.

    ![](media/ex4-t3-step12.png)
    
13. In the Merge window, select the **SALESDOCUMENT** **(1)** column of the SalesOrderHeaders table. Select the **Payments** **(2)** table as the second table, and select the **SalesOrderNr** **(3)** field. Select **Inner (only matching rows)** **(4)** as **Join Kind** and  select **OK** **(5)**.

    ![](media/ex4-t3-step13.png)    

14. Rename the Merge query by right-clicking the Merge query in the Queries pane, and selecting **Rename**. Name the merged query **SalesOrderPayments**.

15. With the **SalesOrderPayments** **(1)** query selected, scroll the table completely to the right. Expand the **Payments** **(2)** column menu, and choose to include the following **fields** **(3)**: **PaymentNr**, **PaymentDate**, **PaymentValue** and **Currency**. Make sure to **Uncheck** **(4)** for Use original column name as prefix and select **OK** **(5)**.

    ![](media/ex4-t3-step15new.png)
    
16. Select **Close & Apply** in the Power Query editor toolbar.

    ![](media/ex4-t3-step16.png)
    
- Calculate Payment Offset visualization 

17. From the report designer on **Home** **(1)** tab toolbar menu, expand the **Transform data** **(2)** item. Select **Transform data** **(3)**.

    ![](media/ex4-t3-step17.png)   
   
18. In the Power Query Editor window, select the **SalesOrderPayments** **(1)** table from the Queries pane. A new column is required to calculate the difference between the billing date and the actual payment data. Select the **Add Column** **(2)** tab and select the **Custom Column** **(3)** button on the toolbar menu.

    ![](media/ex4-t3-step18.png)
    
19. In the Custom Column window, enter `Offset` **(1)** for the New column name. In the Custom column formula field, enter the following formula **(2)**. Select **OK** **(3)**.

    ```vb
    Duration.Days([PaymentDate] - [BILLINGDOCUMENTDATE])
    ```
    
    ![](media/ex4-t3-step19.png)
    
20. In the table, right-click on the newly created **Offset** **(1)** field and expand the **Change Type** **(2)** option. Select **WholeNumber** **(3)** to convert this column to integer.

    ![](media/ex4-t3-step20.png)
    
21. Return to the **Home** **(1)** tab and select **Close & Apply** **(2)** in the Power Query editor toolbar.

    ![](media/ex4-t3-step21.png)
    
22. On the report canvas, add a **Stacked Column chart** **(1)**. Drag-and-drop the **SalesOrderPayments.CUSTOMERGROUP** **(2)** to the **X-axis** box and **SalesOrderPayments.Offset** **(3)** to the **Y-axis** box.

    ![](media/ex4-t3-step22.png)

23. Expand the menu next to the **Offset column** and choose to report the **Average** **(4)**.

    ![](media/ex4-t3-step23.png)
    
24. Adjust the sizing of the chart on the report canvas as desired.

    ![](media/ex4-t3-step24.png)
    
- Payment offset per customer group box plot visualization (Optional)
  - A box plot can provide a more detailed view of the payment offset by customer group data.
  
25. In the Visualizations pane, expand the ellipsis menu and select **Get more visuals**.

    ![](media/ex4-t3-step25new.png)
    
26. On the Power BI visuals window, search for **Box and Whisker** **(1)**. Then choose the **Box and Whisker chart** **(2)** by DataScenarios.

    ![](media/ex4-t3-step26new.png)
    
27. On the AppSource window, select the **Add** button to add the Box and Whisker chart.

    ![](media/ex4-t3-step27new.png)
    
28. On the Visualizations pane, select the newly added **Box and Whisker chart** **(1)**. In the **Category** field, drag-and-drop the **SalesOrderPayments.CUSTOMERGROUP** **(2)**, **SalesOrderPayments.Offset** **(3)** into the **Sampling** field, and **SalesOrderPayments.Offset** **(4)** into the **Value** field.

    ![](media/ex4-t3-step28.png) 

29. Expand the menu in the **Value** field and select the **Average** option.

    ![](media/ex4-t3-step29.png)
    
30. Adjust the sizing of the chart on the report canvas as desired.    
   
    ![](media/ex4-t3-step30.png)

    From this diagram you can see that:
    * CustomerGroup1 pays within 70 days +/- 10 days
    * CustomerGroup2 pays within 30days +/- 5 days
    * Other customergroups pay after 10 days

>**Note**: Keep this report open in Power BI desktop for future exercises.
   
