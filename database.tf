resource "azurerm_mysql_server" "srv-db-mysql-aula-infra" {
  name = "server-db-mysql"

  location            = azurerm_resource_group.rg-aula-infra.location
  resource_group_name = azurerm_resource_group.rg-aula-infra.name

  administrator_login          = "mysqladminun"
  administrator_login_password = "Teste@admin123"

  sku_name   = "GP_Gen5_2"
  storage_mb = 5120
  version    = "5.7"

  auto_grow_enabled                 = true
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = true
  infrastructure_encryption_enabled = true
  public_network_access_enabled     = true
  ssl_enforcement_enabled           = true
  ssl_minimal_tls_version_enforced  = "TLS1_2"
}

resource "azurerm_mysql_database" "db-aula" {
  name                = "db-aula"
  resource_group_name = azurerm_resource_group.rg-aula-infra.name
  server_name         = azurerm_mysql_server.srv-db-mysql-aula-infra.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}
