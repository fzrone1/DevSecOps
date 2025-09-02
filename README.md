Test Female Daily Networks : DevSecOps

#untuk build aplikasi docker
docker build -t myflaskapp:latest ./app-web-helm-chart/app/

#untuk menalankan ansible 
ansible-playbook -i hosts.ini playbook.yml

#untuk menjalankan terraform
terraform init
terraform plan -out=tfplan
terraform apply

#untuk CI/CD Gitlab
docker exec -it gitlab-runner gitlab-runner register

#untuk build Gitlab Selfhost
masuk ke folder gitlab-selfhost lalu perintah docker compose up -d (tergantung versi dokcernya)

Terimakasih, mohon maaf jika ada salah atau kekurangan
