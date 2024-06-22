
ls
cd DVWA
echo $(aws ssm get-parameter --name \
                                /hv-param/docker-hub/token-harc --with-decryption --output text --query Parameter.Value)>docker_pass.txt
cat docker_pass.txt | docker login --username dilishmadduri --password-stdin
docker build -t dilishmadduri/hv-ecr-harc:DVWA-${BUILD_NUMBER} -f Dockerfile .
docker push dilishmadduri/hv-ecr-harc:DVWA-${BUILD_NUMBER}

