# Module 2: Exercise 1: Getting Started with Azure 

Duration: 10 mins

## Instructions

1. Once the environment is provisioned, a virtual machine (JumpVM) and lab guide will get loaded in your browser. Use this virtual machine throughout the workshop to perform the lab.

    ![](/media/M2-Ex1-Environment.png)
   
2. To get the lab environment details, you can select the **Environment Details** tab. Additionally, the credentials will also be sent to your email address provided during registration. You will see Deployment ID value on **Environment Details** tab, use it wherever you see SUFFIX or DeploymentID in lab steps. 

   ![](/media/M2-Ex1-Environmentdetails.png)
   
3. You can also open the Lab Guide on Separate full window by selecting the **Split Window** button on the bottom right corner.

   ![](/media/M2-Ex1-Splitwindow.png)

## Login to Azure Portal

1. Lets start by logging into the Azure Portal to check the resources deployed for the lab environment. In the JumpVM on the left, click on the Azure portal shortcut of Microsoft Edge browser which is available on the desktop.

   ![](/media/M2-Ex1-azureportal.png)

1. On the **Sign into Microsoft Azure** tab, you will see the login screen, enter the following username, and, then click on **Next**.

   * Email/Username: <inject key="AzureAdUserEmail"></inject>

   ![](/media/M2-Ex1-portalsignin-1.png)

1. Now enter the following password and click on **Sign in**. 

   * Password: <inject key="AzureAdUserPassword"></inject>
   
   ![](/media/M2-Ex1-portalsignin-2.png)

1. If you see the pop-up **Stay Signed in?**, click on No

   ![](/media/M2-Ex1-portalsignin-3.png)

1. If you see the pop-up **You have free Azure Advisor recommendations!**, close the window to continue the lab.

1. If a **Welcome to Microsoft Azure** popup window appears, click **Maybe Later** to skip the tour.

1. Now you can see Azure Portal Dashboard, click on **Resource groups** from the Navigate panel to see the resource groups.

   ![](/media/M2-Ex1-rg.png)

1. Click on the **aiw-sap-SUFFIX** Resource group and confirm whether you have all the below resources deployed successfully.

   * In the Resource group we have one **Virtual Machine**, **Logic App**, **Service Bus** and **IoT Hub** deployed.

   * **Virtual Machine**: You will be using the Virtual Machine which is already open on the left side of the page to perform all the Lab exercises.

   * **Logic App**: We have already deployed the Logic App 

   * **Service Bus**: You will use this
   
   * **IoT Hub**: You will be using this 

   ![](/media/M2-Ex1-resources.png)

1. Now, click on the **Next** from lower right corner to move on next page.
