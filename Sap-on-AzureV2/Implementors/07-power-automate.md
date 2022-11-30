# Exercise 7: Create a workflow to export the PowerBI Sales report and Share it to Teams

## Overview

Power Automate is a tool that helps users create workflows between desired applications to synchronize files, get notifications, and collect data. This intelligent cloud-based solution uses triggers and actions to create chain reactions within a workflow so that repetitive, manual, and time-consuming tasks are accomplished without human intervention.

> You can find complete information about Power Automate here: `https://docs.microsoft.com/en-us/power-automate/`.

### Task 1: Create Instant cloud flow

In this task, you will create instant cloud flow in Power Automate.

1. Open a new browser tab and navigate to the below URL to open the Power Automate Portal.

   ```
   https://flow.microsoft.com/en-us/
   ```
   
1. Select the **Sign in** option from the top right to sign in to the Power Automate Portal.

   ![](media/ex6-t1-step2.png)
   
1. On the **Welcome to Power Automate** window, choose your **Country/Region** and click on **Get Started** to agree with the terms and conditions.

   ![](media/ex6-t1-step1.png)

1. Select **My flows** **(1)** from the left-hand side menu then click on **+ New flow** **(2)** and select **Instant cloud flow** **(3)** from the drop=down.

   ![](media/ex7-t1-createinstantflow.png)
   
1. In Choose how to trigger this flow pane, click on **Skip**.

   ![](media/ex7-t1-skip.png)
   
1. Enter the title of the flow as **ExportPBIReport-to-Teams**.

   ![](media/ex7-t1-titleflow.png)
   
1. Search for **Schedule** **(1)** and select **Recurrence** **(2)** under Triggers.

   ![](media/ex7-t1-recurrence.png)
   
1. In the **Recurrence** update the **Interval** **(1)** to `1` and **Frequency** **(2)** to `Hour` then click on **+ New step** **(3)**.

   ![](media/ex7-t1-newstep1.png)
   
1. In Choose an operation, search for **Power BI** **(1)** and select **Power BI** **(2)**.

   ![](media/ex7-t1-powerbi1.png)
   
1. Search for **Export** **(1)** and select **Export To File for Power BI Reports** **(2)** under Actions.

   ![](media/ex7-t1-powerbi2.png)
   
1. In Export To File for Power BI Reports, enter the values given below:

     | Field              | Value                      |
     |------------------- |--------------------------- |
     | Workspace (1)      | **My Workspace**           |
     | Report (2)         | **SalesOrderPayments**       |
     | Export Format (3)  | select `PDF`               |
   
   
     ![](media/updatedd5.png)
   
1. Click on **Export To File for Power BI Reports** to minimize and then click on **+ New step**.

   
    ![](media/ex7-t1-newstep2.png)
   
1. Open a new browser tab and navigate to the URL below to open the **Encodian Signup** page.

   ```
   https://www.encodian.com/apikey
   ```
   
1. Enter your personal details for the ask as shown screenshot below then click on **Submit** to activate the free trial account.

   ![](media/setup-encodian.png)
   
1. Once you click on **Submit**, you can see the API Key as shown in the screenshot below. Copy the **API Key** and save it in notepad. You will be using it in the next steps.

    ![](media/copy-encodian-apikey.png)
   
1. Navigate back to the **Microsoft Power Automate** tab, search for **Encodian** **(1)** and then select **Encodian** **(2)** in Choose an operation.

    ![](media/ex7-t1-encodian.png)
   
1. Now, search for **Convert PDF to Images** **(1)** and select **Convert PDF to Images** **(2)** under Actions.

   ![](media/ex7-t1-convertptoi.png)
   
1. In the Encodian step, enter the Connection name as **SAP-Encodian** **(1)** and paste the **Encodian API Key** **(2)** which you have copied in the earlier steps. Click on **Create** **(3)**.

   ![](media/ex7-t1-encodiancreate.png)
   

1. On **Convert PDF to Images** filed, enter te below instaructions:

    - File Content : Click inside the edit box of **File Content** and select **File Content** from the dynamic content list appears on the right side of the designer.
    
      ![](media/filecontent.png)
    
    - Image Format : Select **PNG** from drop-down list.
    - Filename Prefix : Enter **Sales data**

     ![](media/ex7-t1-filecontent.png)

1. Now click on **New step**.

    ![](media/ex7-t1-newstep3.png)
    
1. Serch for **Apply to each (1)** in the search bar and select **Apply to each (2)** from Actions tab.

    ![](media/ex7-t1-applytoeach.png)

1. Click inside the edit box of **Select an output from the previous step** and seach for **Documents (1)** in the dynamic content list appears on the right side of the designer, then select **Documents (2)**.

    ![](media/documents.png)

1. After selecting the **Documents**, click on **Add an Action**.

    ![](media/ex7-t1-addaction1.png)
    
1. Open a new browser tab and navigate to the below URL to sign-in to OneDrive.

   ```
   https://onedrive.live.com/about/en-ca/signin/
   ```
   
   >**Info :** To establish the connection for OneDrive in Power Automate, you need to sign in to OneDrive to avoid the authorization failure error(s). 
   
1.  Complete the **Sign-in** process using the below credentials.

      * Email/Username: <inject key="AzureAdUserEmail"></inject>
      * Password: <inject key="AzureAdUserPassword"></inject>

1. Wait until OneDrive set up is complete and close the browser tab by clicking on **X**.

1. Now, serach for **Create file (1)** in search bar and select **Create file (2)** from Actions tab.

    ![](media/ex7-t1-createafile.png)
    
1. Under **Create file** field, follow the below instructions:

     - Folder path : Enter **/Images/Sales Data**
     - File Name : Enter **Sales Data.PNG**
     - File Content :  Select **Documents File Content** from the dynamic content list appears on the right side of the designer.

     ![](media/ex7-t1-createfiledata.png)
     
 1. Click on **Add an action**

    ![](media/ex7-t1-addaction2.png)
    
 1. Search for **Get file thumbnail (1)** and select **Get file thumbnail (2)** from Actions tab.

    ![](media/ex7-t1-getfilethumnail.png)
    
 1. Under **Get file thumbnail** field, follow the below instructions :

     - File : Select **Id (1)** from the dynamic content list appears on the right side of the designer.
     - Thumbnail Size : Select **Large (2)** from the drop-down list.
     - Click on **Add an action (3)**.

     ![](media/ex7-t1-addaction3.png)
     
1. Now, search for **Start and wait for an Approval (1)** in the search bar and select **Start and wait for an Approval** **(2)** from Actions tab.

     ![](media/ex7-t1-startandwait.png)
     
1. Click on **Create** to create a connection for Approval.

    ![](media/ex7-t1-approvalscreate.png)
    
1. On **Start and wait for an approval** field, follow the below instructions:

    - Approval type : Select **Approve/Reject - First to respond (1)** from the drop-down list.
    - Title : Enter **Request to Access PowerBI report (2)**
    - Assigned to : Enter **<inject key="AzureAdUserEmail"></inject> (3)** and select it.
    - Click on **Add an Action (4)**.

    ![](media/startandwait.png)
  
1. Serch for **Apply to each (1)** in the search bar and select **Apply to each (2)** from Actions tab.

    ![](media/ex7-t1-applytoeach.png)
    
1. Click inside the edit box of **Select an output from the previous step** and seach for **Responses (1)** in the dynamic content list appears on the right side of the designer, then select **Responses (2)**.

    ![](media/responses.png)
    
1.  Now, click on **Add an action**
    
    ![](media/addanaction1.png)

1. Search for **Condition** in the search bar and select **Condition** from Actions tab.

    ![](media/condition.png)
    
1. Under **Condition** filed, follow the below instructions: 

    - Select inside the **Choose a value** box which is at the left side of **is equal to** box and search for **Responses Approver Response** in the dynamic content list appears on the right side of the designer, then select **Responses Approver Response (2)**.

      ![](media/responsesapprover.png)
    
    - Select inside the **Choose a value** box which is at the right side of **is equal to** box and enter **Approve**

       ![](media/conditionapprove.png)
       
1. Select **Add an action** under **If Yes** to add a new action.

    ![](media/yescondition.png)
    
1. Search for **Microsoft Teams (1)**, in the search bar and select **Microsoft Teams (2)**.

    ![](media/teamsselect.png)
    
1. Search for **Post a message in chat or channel (1)** in the search bar and select it **(2)** from actions tab.

    ![](media/postamessage.png)
    
1. Under **Microsoft Teams** field, follow the below instructions:

     - Post as : Select **Flow bot** from the drop-down list.
     - Post in : Select **Channel** from the drop-down list.
     - Team : Selct **SAP on Azure-<inject key="DeploymentID" enableCopy="false"/>** from the drop-down list
     - Channel : Select **SAP Channel** from the drop-down list.
     - Click on **Code View**.
     
     ![](media/EX7-T1-S43.png)
     
     - Message : Click inside the message box and enter the following content.
         
        ```
        <p>
        <i> Sales Order Data </i>
        <img src="Relace with URL" alt="Client Image"/> <br>
        </p>
        ```
        
      > After adding the content, notice that few values are to be replaced in the content with values from the dynamic content list.

1. Remove **Relace with URL** which is next to **img src** and select **URL** from the dynamic content list.

    ![](media/EX7-T1-S44.png)
    
1. Select **Save** which is at the top right corner to save the flow.

1. Now, click on **Test** which is at the top right corner to the test the flow manually.

1. On the **Test Flow** page, select **Manually (1)** and click on **Test (2)**

    ![](media/testflow.png)

1. Click on **Run flow**.

   ![](media/runflow.png)

1. After successfully triggering the flow, click on **Done**.

   ![](media/done1.png)
    
1. Select **Approvals** from the left-hand side menu and hover the cursor on **Request to Access Power BI report** then click on **&#9745;** to approve.

   ![](https://github.com/CloudLabsAI-Azure/AVW-SAP-on-Azure/raw/prod/Sap-on-AzureV2/SAP-on-the-Microsoft-Cloud/media/approve1.png)

1. On the **Respond:  Approve** page, click on **Confirm**.

   ![](https://github.com/CloudLabsAI-Azure/AVW-SAP-on-Azure/raw/prod/Sap-on-AzureV2/SAP-on-the-Microsoft-Cloud/media/confirm.png)
    
1. Once you get the notification stating that the **Response successfully recorded**, click on **Done**.

   ![](https://github.com/CloudLabsAI-Azure/AVW-SAP-on-Azure/raw/prod/Sap-on-AzureV2/SAP-on-the-Microsoft-Cloud/media/done.png)

1. Select **My Flows (1)** from the left-hand side menu and select the **ExportPBI (2)** flow you created in the previous steps.

   ![](media/exportto.png)
   
1. Review that the run status under the **28-day run history** tile has been changed to the **Succeeded** state. Open the flow and review it.

   ![](media/totalflow.png)
   

### Task 2: Review the PowerBI report in teams

In this task, you will review the Power BI report is being sent to Microsoft Teams by Power Automate flow.

1. Launch the **Microsoft Teams** application by clicking on the Microsoft Teams shortcut on the virtual machine desktop.

1. You can use the below credentials to sign in to the Teams account.

   * Email/Username: <inject key="AzureAdUserEmail"></inject>
   * Password: <inject key="AzureAdUserPassword"></inject>

1. On the **Stay Signed in to all your Apps** pop-up, uncheck the **Allow my organization to manage my device** option.

   ![](https://github.com/CloudLabsAI-Azure/AIW-SAP-on-Azure/blob/main/media/M2-p2-logicapp-50.png?raw=true)

1. Now, click on **No, sign in to this app only** to sign in to **Microsoft Teams** application.

   ![](https://github.com/CloudLabsAI-Azure/AIW-SAP-on-Azure/blob/main/media/M2-p2-logicapp-49.png?raw=true)

1. Select **Teams** from the left-hand side menu to view the available teams.

1. Review the messages which are being sent as a part of the Power Automate flow run into the **SAP on Azure-<inject key="DeploymentID" />** teams channel.

   ![](https://github.com/CloudLabsAI-Azure/AVW-SAP-on-Azure/blob/prod/Sap-on-AzureV2/SAP-on-the-Microsoft-Cloud/media/iotdatapng.png?raw=true)
   
## Summary

In this exercise, you have covered the following:

* Created Connections in Power Automate.
* Imported the workflow in Power Automate.
* Reviewed the PowerBI report in teams.
