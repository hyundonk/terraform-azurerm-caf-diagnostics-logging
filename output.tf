##export the logging details for EH and SA
##export one object with both

output "diagnostics_map" {
    depends_on = [
        azurerm_storage_account.log, 
        ]

    value = "${
        map(
            "diags_sa", azurerm_storage_account.log.id,
            "diags_sa_blob", azurerm_storage_account.log.primary_blob_endpoint,
            "diags_sa_primary_access_key", azurerm_storage_account.log.primary_access_key,
            "eh_name",  var.enable_event_hub == true ? azurerm_eventhub_namespace.log[0].name : null,
            "eh_id", var.enable_event_hub == true ? azurerm_eventhub_namespace.log[0].id : null,
            "primary_connection_string", azurerm_storage_account.log.primary_connection_string,
        )
    }"
}
