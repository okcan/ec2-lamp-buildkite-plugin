#!/bin/bash

# SSH anahtarını geçici bir dosyaya yazın
echo "$SSH_PRIVATE_KEY" > /tmp/ssh_key
chmod 600 /tmp/ssh_key

# EC2 instance'ına SSH ile bağlanın ve LAMP stack'i kurun
ssh -i /tmp/ssh_key -o StrictHostKeyChecking=no "$SSH_USER@$EC2_INSTANCE_IP" << 'EOF'
  # Apache kurulumu
  sudo apt update
  sudo apt install -y apache2

  # MySQL kurulumu
  sudo apt install -y mysql-server
  sudo mysql_secure_installation

  # PHP kurulumu
  sudo apt install -y php libapache2-mod-php php-mysql

  # Apache yeniden başlatma
  sudo systemctl restart apache2

  # LAMP stack kurulumu tamamlandı
  echo "LAMP stack installation completed."
EOF

# Geçici SSH anahtarını silin
rm /tmp/ssh_key
