#!/bin/bash

chmod 400 hooks/key.pem

# Please specify your file path
SSH_KEY_PATH="hooks/key.pem"

# Connect to EC2 instance via SSH and install LAMP stack
ssh -i "$SSH_KEY_PATH" -o StrictHostKeyChecking=no "$SSH_USER@$EC2_INSTANCE_IP" << 'EOF'
  # Apache installation
  sudo apt update
  sudo apt install -y apache2

  # MySQL installation
  sudo apt install -y mysql-server
  sudo mysql_secure_installation

  # PHP installation
  sudo apt install -y php libapache2-mod-php php-mysql

  # Apache restart
  sudo systemctl restart apache2

  # LAMP stack installation completed
  echo "LAMP stack installation completed."
EOF
