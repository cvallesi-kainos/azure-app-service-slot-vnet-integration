# azure-app-service-slot-vnet-integration

Example to test enabling vnet integration for web app slots

To test:

- `cd terraform/env`
- `terraform init`
- `terraform plan`
- `terraform apply`

1. Open your Azure Dashboard and go to the "Web Services" index.
2. You should see your application deployed. Open the details and check the "Networking" section.
3. On the "Outbound Traffic" panel you should see "VNet Integration" turned on.
4. On the side menu, look for "Deployment Slots". Open it.
5. Select the "non-production" slot listed. It will have suffix `example-slot`. Click on the name to open the details.
6. Now on the details of the example slot, go to the "Networking" section from the side menu again
7. The "VNet Integration" for this slot will not be enabled despite the configuration saying so in `terraform\modules\app-service\main.tf` line 25.

This issue will cause problems when you also use the `azurerm_web_app_active_slot` resource block to switch slots on deployments because the new slot will lack the necessary "Vnet Integration".  
To test this, simply open the configuration file `terraform\modules\app-service\main.tf` and uncomment the resource block `azurerm_web_app_active_slot`. Deploy again to see that now, the "production slot" will not have VNet Integration as it was the "example slot" that has been promoted to production.

The only workaround I've found is to add the parameter `overwrite_network_config` set to `false`. That will always maintain the main network configuration used in the initial configuration specified in the `azurerm_linux_web_app` resource block.
