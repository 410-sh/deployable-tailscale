# deployable-tailscale
For deploying VMs that will automatically connect to your tailnet, follow the steps below:
- Ensure the golden image OVA does **not** currently have Tailscale installed. If Tailscale is installed on a machine then the machine is cloned, you will get a `duplicate node key` error and will be required to reinstall Tailscale on each machine that has the duplicate key.
- Create an auth-key that has `reusable` and `ephemeral` enabled. This will ensure the machines can all authenticate to the Tailnet using one authenticaton key, and the machines will automatically be removed from the Tailnet after being disconnected for a period of time.

After you ensure Tailscale is not currently installed on the VM golden image and you have your auth-key, follow the steps below to configure the machine to install and authenticate on boot:
1. Create a file in `/etc/systemd/system/` with a unique name for the new service you are creating and add the contents of the `custom-tailscale-config.service` file in this repository.
2. Create a file named `ts-startup.sh` on the machine with the contents of the `ts-startup.sh` file in this repository. Ensure you modify the `ts-startup.sh` file to use either Tailscale's server, or a Headscale server with your auth key.
3. Once the `custom-tailscale-config.service`, and `ts-startup.sh` files have been created and set up, make the `ts-startup.sh` file executable.
4. Enter the command `sudo systemctl enable custom-tailscale-config.service` so the script will start on boot.

When the VM is rebooted, the script will run after the machine has network connectivity. The script will first check if Tailscale is already installed and install it if not, then authenticate to your Tailnet using your auth-key.
You can change the name of your machines in the admin console by just changing the hostname of the machine and rebooting.
