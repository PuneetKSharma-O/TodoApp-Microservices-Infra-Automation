# 🚀 TodoApp Microservices Infrastructure Automation

> **Infrastructure as Code (IaC) | Enterprise-Grade Azure Cloud | Kubernetes-Ready**

A production-ready **Terraform automation framework** for deploying a complete microservices infrastructure on Azure. This project orchestrates a full-stack Todo application ecosystem with Azure Kubernetes Service (AKS), containerized registry, secure vaulting, and SQL databases—all defined, versioned, and deployed through code.

---

## 🎯 What's Inside?

This repository is your **one-stop infrastructure shop** featuring:

- **🐳 Container Registry** - Azure Container Registry (ACR) for Docker image management
- **☸️ Kubernetes Cluster** - Azure Kubernetes Service (AKS) for scalable microservices deployment
- **🔐 Key Vault** - Secure secrets and certificate management
- **🗄️ SQL Database** - Managed database infrastructure with servers and databases
- **💾 Storage Account** - Azure blob storage for application data
- **📦 Modular Architecture** - Reusable Terraform modules for enterprise deployment patterns

---

## 📂 Project Structure

```
TodoApp-Microservices-Infra-Automation/
├── Environment/
│   └── dev/                              # Development environment configuration
│       ├── main.tf                       # Main Terraform orchestration
│       ├── provider.tf                   # Azure provider setup
│       ├── variable.tf                   # Input variables & configurations
│       └── terraform.tfvars              # Environment-specific values
│
├── Modules/                              # Reusable Terraform modules
│   ├── azurerm_acr/                      # Container Registry module
│   ├── azurerm_kubernetes_services/      # AKS cluster module
│   ├── azurerm_keyvault/                 # Key Vault module
│   ├── azurerm_keyvault_secret/          # Secrets management module
│   ├── azurerm_resource_group/           # Resource Group module
│   ├── azurerm_sql_database/             # SQL Database module
│   ├── azurerm_sql_server/               # SQL Server module
│   └── azurerm_storage_account/          # Storage Account module
│
├── .github/workflows/                    # CI/CD automation
│   └── dev-pipeline.yaml                 # Automated build, test & deploy
│
├── README.md                             # Project documentation
└── LICENSE                               # Open-source license
```

---

## 🏗️ Infrastructure Deployment Flow

The infrastructure follows a **dependency-managed architecture**:

```
Resource Group
    ├── → Storage Account
    ├── → ACR (Container Registry)
    ├── → Key Vault
    │   └── → Key Vault Secrets
    │       └── → SQL Server
    │           └── → SQL Database
    └── → AKS Cluster
```

---

## 🚀 Getting Started

### Prerequisites
- Terraform >= 1.0
- Azure CLI installed and authenticated
- Azure subscription with appropriate permissions
- GitHub account (for CI/CD workflows)

### 1️⃣ Configure Azure Credentials

```bash
az login
az account set --subscription "<SUBSCRIPTION_ID>"
```

### 2️⃣ Set Environment Variables

Navigate to `Environment/dev/` and update `terraform.tfvars`:

```hcl
resource_group = {
  name     = "rg-todoapp-dev"
  location = "eastus"
}

storage_account = {
  name             = "storagetodoappdev"
  account_tier     = "Standard"
  replication_type = "GRS"
}

kubernetes_cluster = {
  name             = "aks-todoapp-dev"
  node_pool_count  = 2
  vm_size          = "Standard_D2s_v3"
}

# ... additional configurations
```

### 3️⃣ Deploy Infrastructure

```bash
cd Environment/dev/

# Initialize Terraform
terraform init

# Validate configuration
terraform validate

# Preview changes
terraform plan -out=tfplan

# Apply infrastructure
terraform apply tfplan
```

---

## 🔄 CI/CD Pipeline

This project includes an **automated GitHub Actions workflow** (`dev-pipeline.yaml`) that:

✅ **Builds** - Initializes and validates Terraform  
✅ **Tests** - Runs security scanning with tfsec  
✅ **Deploys** - Automatically applies infrastructure on main branch push  

### Secrets Required in GitHub

Configure these secrets in your GitHub repository settings:

- `AZURE_CLIENT_ID` - Service Principal client ID
- `AZURE_TENANT_ID` - Azure Tenant ID
- `AZURE_SUBSCRIPTION_ID` - Azure Subscription ID

---

## 📦 Terraform Modules

Each module is self-contained and documented:

| Module | Purpose | Depends On |
|--------|---------|-----------|
| `azurerm_resource_group` | Foundation resource container | None |
| `azurerm_storage_account` | Blob storage for app data | Resource Group |
| `azurerm_acr` | Docker container registry | Resource Group |
| `azurerm_keyvault` | Secrets vault | Resource Group |
| `azurerm_keyvault_secret` | Secret values | Key Vault |
| `azurerm_sql_server` | Database server | Resource Group, Secrets |
| `azurerm_sql_database` | Database instance | SQL Server |
| `azurerm_kubernetes_services` | AKS cluster | Resource Group, ACR |

---

## 🔒 Security Best Practices

- Secrets managed through Azure Key Vault
- RBAC enabled on all resources
- Network policies enforced in AKS
- SQL database encryption enabled
- Container images scanned in ACR
- tfsec security scanning in CI/CD pipeline

---

## 📊 State Management

Terraform state is stored locally in `Environment/dev/`:
- `terraform.tfstate` - Current state
- `terraform.tfstate.backup` - State backup

**For production**, migrate to remote state with Azure Storage:

```bash
terraform backend "azurerm" {
  resource_group_name  = "rg-terraform-state"
  storage_account_name = "saterraformstate"
  container_name       = "tfstate"
  key                  = "prod.tfstate"
}
```

---

## 🧹 Clean Up

Destroy all infrastructure:

```bash
cd Environment/dev/
terraform destroy
```

---

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/improvement`)
3. Commit changes (`git commit -am 'Add improvement'`)
4. Push to branch (`git push origin feature/improvement`)
5. Open a Pull Request

---

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 💬 Support & Questions

For issues, questions, or suggestions:
- Open an [Issue](../../issues)
- Check existing documentation in module directories
- Review the `.github/workflows` for CI/CD insights

---

## 🎓 Learning Resources

- [Terraform Azure Provider Documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
- [Azure Kubernetes Service (AKS) Guide](https://learn.microsoft.com/en-us/azure/aks/)
- [Terraform Best Practices](https://www.terraform.io/language)
- [Azure Security Best Practices](https://learn.microsoft.com/en-us/azure/security/)

---

**Happy Infrastructure Coding! 🎉**