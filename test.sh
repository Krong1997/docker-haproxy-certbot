# docker create --name=test -p 1618:80 -p 1619:443 -p 1883:1883 -p 9999:9999 xalauc/haproxy-certbot:1.7.9

# docker cp ./config/haproxy.cfg test:/config
# docker cp ./certs.d/ test:/usr/local/etc/haproxy/certs.d
# docker cp ./letsencrypt/ test:/etc/letsencrypt

# docker start test

# docker run -d \
#   --restart=always \
#   --name haproxy-certbot \
#   --net=bridge \
#   --cap-add=NET_ADMIN \
#   -p 80:80 \
#   -p 443:443 \
#   -v /home/innodisk/icap-sdk-latest/docker/haproxy/config:/config \
#   -v /home/innodisk/icap-sdk-latest/docker/haproxy/letsencrypt:/etc/letsencrypt \
#   -v /home/innodisk/icap-sdk-latest/docker/haproxy/certs.d:/usr/local/etc/haproxy/certs.d \
#   dock1100/haproxy-certbot 
sudo docker build -t kk_proxy .

docker run -d \
  --name haproxy-certbot \
  --cap-add=NET_ADMIN \
  -p 80:80 \
  -p 443:443 \
  -v /home/innodisk/icap-sdk-latest/docker/haproxy/config:/config \
  -v /home/innodisk/icap-sdk-latest/docker/haproxy/letsencrypt:/etc/letsencrypt \
  -v /home/innodisk/icap-sdk-latest/docker/haproxy/certs.d:/usr/local/etc/haproxy/certs.d \
  kk_proxy