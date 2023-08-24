#!/bin/bash
              sudo apt-get update -y
              sudo apt-get install -y docker.io
              sudo systemctl start docker
              sudo usermod -aG docker ubuntu
              newgrp docker
              docker run -p 80:80 londontech/myweb-server:ver1