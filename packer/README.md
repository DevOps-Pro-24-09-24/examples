# HashiCorp Packer Example

This folder contains a simple example of using HashiCorp Packer to create machine images.

## Getting Started

To start the project, follow these steps:

### Prerequisites

- Install [Packer](https://www.packer.io/downloads)
- Ensure you have the necessary credentials and permissions for the cloud provider you are using (e.g., AWS, Azure, GCP).

### Usage

1. Clone the repository:

    ```bash
    git clone https://github.com/DevOps-Pro-24-09-24/examples.git
    cd examples/packer
    ```

2. Initialize the Packer configuration:

    ```bash
    packer init .
    ```

3. Format the Packer template:

    ```bash
    packer fmt aws-ubuntu.pkr.hcl
    ```

4. Validate the Packer template:

    ```bash
    packer validate aws-ubuntu.pkr.hcl
    ```

5. Build the image:

    ```bash
    packer build aws-ubuntu.pkr.hcl
    ```


### Tutorials

- Look at the [Packer documentation](https://www.packer.io/docs) for more information on how to use Packer.
- And do other tutorials from [HashiCorp Packer tutorials](https://developer.hashicorp.com/packer/tutorials).


## License

This project is licensed under the MIT License. See the [LICENSE](../LICENSE) file for details.