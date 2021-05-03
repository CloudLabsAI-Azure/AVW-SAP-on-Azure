# Azure Immersion Workshop SAP on Azure

## Overview

SAP on Azure solutions help you optimise your enterprise resource planning (ERP) in the cloud using the security features, reliability and scalable SAP-certified infrastructure of Azure.

When managing a global, distributed supply chain and manufacturing environment, companies face challenges with constrained bandwidth, latency, and massive volumes of data that can adversely affect execution and quality scenarios.

SAP will use Microsoft Azure to run these solutions in a software-as-a-service (SaaS) model that can help reduce the customer’s need to manage the software and underlying infrastructure while accelerating time to value of supply chain applications. Customers will be able to scale globally by leveraging Azure which offers enterprise-grade compute, storage, and network services to support mission-critical performance and business continuity to run SAP Digital Supply Chain solutions.


## Hands-on Labs Scenario

For the purpose of the lab, let’s consider Contoso which is a large company which handles logistics. 
They are in charge of shipping the vaccines across the world. The vaccines will not be useful if the temperature of the storage containers exceeds 30 degree.

Hence, one of the core functions of Contoso's vaccine supply chain is to keep vaccine products properly refrigerated along every step in their journey. They are required to maintain proper temperatures for products that cannot tolerate excessive heat especially in places with extremely hot climates, unreliable connections to electricity, and weak transportation infrastructure. Temperature monitoring is a critical thing for Contoso to assess vaccine handling quality, detect malfunctioning equipment, and understand if it has negatively impacted vaccine potency and safety.

For this, Contoso has included IoT devices with temperature sensors in each package. Contoso is giving the opportunity to you to connect those devices in an Azure IoT Solution and retrieve the temperature readings from the package which will be then used to monitor and place a replacement order for any vaccine that gets damaged.

## Lab Context

This lab provides you a quick and easy way to get started with SAP on Azure. 

The vaccines will not be useful if the temperature of the storage containers exceeds 30 degree. Contoso has already included the temperature sensors within the packages.

In order to help Contoso to monitor the shipping packages, you will retrieve the data from the sensors using Azure IoT Hub and monitor it .
If the temperature goes above 30°, the vaccine is damaged and must be replaced. To replace the vaccine, a sales order is automatically created in SAP ECC in case the measured temperature is above 30°

You will also enable viewing the current sales orders in Excel, PowerBI, Outlook, and Teams.





