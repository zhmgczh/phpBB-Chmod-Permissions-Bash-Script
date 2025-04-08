# phpBB Chmod Permissions Bash Script

This Bash script automates the process of setting the recommended file and directory permissions for phpBB installations, as described in the official phpBB documentation: [https://www.phpbb.com/support/docs/en/3.1/kb/article/phpbb3-chmod-permissions/](https://www.phpbb.com/support/docs/en/3.1/kb/article/phpbb3-chmod-permissions/)

**Please use this script with caution and understand the implications of changing file permissions on your system. It is highly recommended to back up your phpBB installation before running this script.**

## Purpose

The script aims to simplify the task of applying the necessary `chmod` commands to ensure the security and proper functioning of your phpBB forum. It helps in setting the correct read, write, and execute permissions for various files and directories within your phpBB installation.

## Usage

1.  **Download the script:** Download the `chmod_phpbb.sh` file to your server where your phpBB installation is located.

2.  **Make the script executable:** Open your terminal and navigate to the directory where you saved the script. Then, run the following command:

    ```bash
    chmod +x chmod_phpbb.sh
    ```

3.  **Navigate to your phpBB root directory:** In the same terminal, navigate to the root directory of your phpBB installation. This is the directory containing files like `config.php`, `index.php`, and the `cache/`, `files/`, `store/` directories.

4.  **Run the script:** Execute the script from within your phpBB root directory:

    ```bash
    ./chmod_phpbb.sh
    ```

5.  **Review the output:** The script will output the `chmod` commands it executes. Review the output to ensure the commands were applied as expected.

## Script Functionality

The script will attempt to set the following permissions based on the phpBB documentation:

* **Files:** Generally set to `644` (owner: read/write, group: read, others: read).
* **Directories:** Generally set to `755` (owner: read/write/execute, group: read/execute, others: read/execute).
* **Specific Directories (writable by phpBB):**
    * `cache/`: Set to `777` (owner: read/write/execute, group: read/write/execute, others: read/write/execute).
    * `files/`: Set to `777`.
    * `store/`: Set to `777`.
    * `images/avatars/upload/`: Set to `777`.
    * `config.php`: Set to `644` after making it writable temporarily (if needed).

**Important Notes:**

* The script assumes it is run from the root directory of your phpBB installation. Running it from a different location may lead to incorrect permission settings.
* The use of `777` permissions grants full read, write, and execute access to everyone. While necessary for certain phpBB directories, it's crucial to understand the security implications. Consider more restrictive permissions if your server environment allows it (e.g., using group permissions and ensuring the web server user is part of the correct group).
* This script is provided as a convenience and may need adjustments based on your specific server configuration and security requirements.
* Always consult the official phpBB documentation for the most up-to-date and accurate permission recommendations.

## Disclaimer

This script is provided "as is" without any warranty, express or implied. The author is not responsible for any data loss or security issues that may arise from the use of this script. Use it at your own risk.

## Contributing

Contributions to this script are welcome. If you find any issues or have suggestions for improvements, please feel free to submit a pull request or open an issue on this GitHub repository.