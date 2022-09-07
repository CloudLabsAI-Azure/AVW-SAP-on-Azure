# Exercise 1: Deploying the Microhack environment with Terraform

Here, we are using Terraform to deploy the zzure resources.

## Task 1: Getting started with Terraform deployment in Azure cloud shell

1. Open Azure Portal from the desktop by double-clicking on it.

2. On the **Sign into Microsoft Azure** tab, you will see the login screen, enter the following username, and, then click on **Next**.

   * Email/Username: <inject key="AzureAdUserEmail"></inject>

   ![](media/azure-login-enter-email.png "Enter Email")

3. Now enter the following password and click on **Sign in**. 

   * Password: <inject key="AzureAdUserPassword"></inject>

   ![](media/azure-login-enter-password1.png "Enter Password")

4. If you see the pop-up **Stay Signed in?**, click on No

5. If you see the pop-up **You have free Azure Advisor recommendations!**, close the window to continue the lab.

6. If a **Welcome to Microsoft Azure** popup window appears, click **Maybe Later** to skip the tour.

7. From the Home page of the Azure portal, open **Cloud shell** from the top menu bar.

8. In the Welcome to Azure Cloud Shell pane, click on **Bash**.

9. Click on Advanced settings and select the existing Resource group **aiw-sap-DeploymentID**. Create a new Storage account with the name **sapstorageDeploymentID** and also create a File share with the name **blob**. Then click on **Create storage**.

10. 
