# Exercise 2: Configure Synapse Workspace

In this Exercise, you will be registring an integration runtime in Synapse Workspace.

## Task 1: Register Integration Runtime

1. Navigate to the **microhack-<inject key="DeploymentID" enableCopy="false"/>-rg** resource group and open Synapse workspace with the name **sapdatasynwsSUFFIX**.

   ![](media/ex2-opensynapse.png)
   
2. From the Overview pane of Synapse workspace, scroll-down to Getting started and click on **Open** to Open Synapse Studio.

   ![](media/ex2-openstudio.png)

3. You will see that Synapse studio opened in the new tab. Click on **Manage** from the left-menu to register the integration runtime.

   ![](media/ex2-clickmanage.png)
   
4. Under Integration, select **Integration runtimes** **(1)** and click on **+ New** **(2)**.

   ![](media/ex2-newir.png)
   
5. In the Integration runtime setup pane, choose **Azure, Self-Hosted** and click on **Continue**.

   ![](media/ex2-selfhosted.png)
   
6. Choose **Self-Hosted** as the Network enviornment and click on **Continue**.

   ![](media/ex2-networksh.png)
   
7. Enter the Name for integration runtime as **sap-intrun-<inject key="DeploymentID" enableCopy="false"/>** and click on **Create**.  

   ![](media/ex2-nameir.png)
   
8. Once the integration runtime is created, you will see Authentication keys under Option 2: Manual setup. Make sure to **copy** **(1)** those keys to notepad, in the next step you need one of these keys. 

   ![](media/ex2-copykeys.png)
   
9. In Option 2: Manual setup, you can download the integration runtime via Step 1. Click on **Download and install integration runtime**.

   ![](media/ex2-downloadir.png)
 
10. You will see a new tab to Download Microsoft Integration Runtime, scroll-down and click on **Download**.

    ![](media/ex2-microsoftir.png)
    
11. Select the latest version of integration runtime and click on **Next**. You will see the download started.

    ![](media/ex2-latestvir.png)
    
12. Once the downloading is completed, click on **Open file** of the downloaded integration runtime from Downloads.

    ![](media/ex2-installir.png)
    
13. 
 
 
 
 
