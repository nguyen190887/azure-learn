# Create resource group
az group create --name azuredemo1 --location westeurope

# Create standard public IP address
az network public-ip create \
    --resource-group azuredemo1 \
    --name azpublicip \
    --sku standard

# Create load balancer
az network lb create \
    --resource-group azuredemo1 \
    --name azloadbalancer \
    --public-ip-address azpublicip \
    --frontend-ip-name frontendpool \
    --backend-pool-name backendpool \
    --sku standard

# Create a VM
az vm create \
    --resource-group azuredemo1 \
    --name zonedvm \
    --image ubuntults \
    --size Standard_B1ls \
    --admin-username azuremol \
    --generate-ssh-keys \
    --zone 3

# Show VMs
az vm show \
    --resource-group azuredemo1 \
    --name zonedvm \
    --query zones