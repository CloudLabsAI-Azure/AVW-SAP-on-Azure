# Exercise 6: Integrate Azure Machine Learning and PowerBI

In this exercise, you can now integrate the Azure Machine Learning Model within PowerBI. The Azure Machine Learning exposes a REST interface which you can integrate in PowerBI.

### Task 1: Add Machine Learning info to the PowerBI Datamodel

1. On the Power BI report from **Home** **(1)** tab toolbar menu, expand the **Transform data** **(2)** item. Select **Transform data** **(3)**.

   ![](media/ex6-t1-step1.png)
   
2. In the Power Query Editor window, select the **SalesOrderPayments** **(1)** table from the Queries pane and select the **Azure Machine Learning** **(2)** item from the Home toolbar menu.

   ![](media/ex6-t1-step2.png)
   
3. In the Azure Machine Learning Models dialog, select the **AzureML.sap-data-ml-model** **(1)** item and select **OK** **(2)**. This will add an additional column to the table with the predicted offset.

   ![](media/ex6-t1-step3.png)
   
4. In the Power Query Editor, with the SalesOrderPayments table selected in the Queries pane, scroll all the way to the right of the displayed table. Right-click the **AzureML.sap-data-ml-model** **(1)** field menu and choose **Rename** **(2)**. Rename the field to **predOffset** **(2)**.

   ![](media/ex6-t1-step4.png)

5. Right-click the **predOffset** **(1)** column, expand the **Change Type** **(2)** option, and select **Whole Number** **(3)**.

   ![](media/ex6-t1-step5.png)
   
6. On the Power Query Editor, select the **Add Column** **(1)** tab, select **Custom Column** **(2)**.

   ![](media/ex6-t1-step6.png)
   
7. In the Custom Column dialog, name the new column **predPaymentDate** **(1)** and set the formula given below **(2)** and select **OK** **(3)**.

    ```vb
    Date.AddDays([BILLINGDOCUMENTDATE], [predOffset])
    ```   
    
   ![](media/ex6-t1-step7.png)
   
8. Right-click the new **predPaymentDate** **(1)** column and expand the **Change Type** **(2)** option and choose **Date** **(3)**.

   ![](media/ex6-t1-step8.png)
   
9. Select the **Home** **(1)** tab then **Close & Apply** **(2)**.

   ![](media/ex6-t1-step9.png)
   
### Task 2: PowerBI Report Creation   
   