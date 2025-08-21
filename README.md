# 🚀  Automated AWS EKS Cluster Deployment with Terraform  ✨

This project leverages Terraform to provision a production-ready Amazon Elastic Kubernetes Service (EKS) cluster on AWS.  It streamlines the setup of the core infrastructure required for your Kubernetes workloads, ensuring a robust and scalable environment.

## 🌟 Key Features

*   **Infrastructure as Code (IaC) with Terraform:**  Define and manage your AWS resources efficiently and reproducibly.
*   **Custom VPC Setup:** Provisions a tailored Virtual Private Cloud (VPC) complete with:
    *   Public and Private Subnets
    *   Internet Gateway (IGW)
    *   NAT Gateway
    *   Routing tables configured for optimal traffic flow.
*   **Amazon EKS Cluster Deployment:**  Automates the creation of your EKS control plane.
*   **Managed Node Group (EC2 Worker Nodes):**  Deploys and manages the underlying EC2 instances that serve as your Kubernetes worker nodes.
*   **Auto Scaling Configuration:**  Ensures your worker nodes scale automatically based on demand, maintaining optimal performance and cost efficiency.


## 📂 Project Structure  

```bash
Terraform-Script/
│── main.tf                          # Root module: connects VPC + EKS modules
│── provider.tf                      # AWS provider configuration
│
├── Infrastructure(VPC)/
│   ├── main.tf                      # VPC, Subnets, IGW, NAT, Route Tables
│   ├── variables.tf                 # Input variables for VPC
│   └── outputs.tf                   # VPC & subnet outputs
│
├── Infrastructure(EKS-Cluster)/
│   ├── main.tf                      # EKS Cluster + Node Group
│   ├── variables.tf                 # Input variables for EKS
│   └── outputs.tf                   # Cluster outputs (endpoint, nodegroup info)
│
└── README.md                        # Documentation
```


*   **Terraform**  
*   **AWS CLI:**  Configured with appropriate credentials and permissions for EKS, VPC, EC2, and IAM.
*   **kubectl:**  The Kubernetes command-line tool.
*   **AWS Account:**  With sufficient permissions to create the necessary resources.

## 🚀 Deployment Steps

Follow these steps to deploy your EKS cluster:

1.  **Clone the Repository:**

    ```bash
    git clone https://github.com/Akhil-kr-khatri/EKS-Cluster-Infrastructure.git
    cd EKS-Cluster-Infrastructure
    ```

2.  **Initialize Terraform:**

    ```bash
    terraform init
    ```

3.  **Validate & Plan:** Review the infrastructure changes before applying them.

    ```bash
    terraform validate
    terraform plan
    ```

4.  **Apply Terraform Configuration:**

    ```bash
    terraform apply -auto-approve
    ```

5.  **Configure `kubeconfig`:**  Connect `kubectl` to your newly created EKS cluster.

    ```bash
    aws eks update-kubeconfig --region <your-aws-region> --name EKS-Cluster
    ```


6.  **Verify Cluster Connectivity:**

    ```bash
    kubectl get nodes
    ```

    _**(You should see your worker nodes listed)**_

## 📤 Outputs

Upon successful deployment, Terraform provides the following key outputs:

*   **EKS Cluster Endpoint & Name:**  The API endpoint and name of your Kubernetes cluster.
*   **VPC ID & Subnet IDs:**  Identifiers for the custom VPC and subnets provisioned.
*   **Node Group Information:**  Details about your managed node group, including auto-scaling configuration and instance types.

## 🧹 Destroying the Infrastructure

To remove all the provisioned AWS resources, execute the following command:

```bash
terraform destroy -auto-approve

```
📌 Author

👤 Akhil Kumar Khatri

📧 Email: akhilkhatri2024@gmail.com

🌐 GitHub: Akhil-kr-khatri
