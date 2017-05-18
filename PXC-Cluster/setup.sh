ctn_NAME=galera_proxy && \
ctnID=$(docker ps -q --filter label=com.docker.swarm.service.name=$ctn_NAME)
echo "$ctnID"

docker exec -i galera_proxy.1.mgr9h5f5c7hp6gu9lpvk6g89u add_cluster_nodes.sh

docker exec -it galera_proxy.1.mgr9h5f5c7hp6gu9lpvk6g89u mysql -uproxyuser -p

docker exec -it galera_proxy.1.mgr9h5f5c7hp6gu9lpvk6g89u mysql -uproxyuser -pMM98j290HU2vCD4f8723fZZ \
-e "SHOW DATABASES;"

docker exec -it $ctnID mysql --user=root --password=$ENV_PASS \


docker exec -it galera_proxy mysql -uproxyuser -pMM98j290HU2vCD4f8723fZZ \
-e "SHOW DATABASES;"

galera_proxy

# — — — # — — — # — — — #

mysql -H${galera_proxy} -uproxysqluser -p .....

mysql -H10.0.106.3 -uproxysqluser -p

mysql -H10.20.1.6 -uproxysqluser -p

mysql -H2c8ab3f0a110 -uproxysqluser -p

mysql galera_proxy.1.ked1ae73mef25rkvjyp3ydeza -uproxysqluser -p


ctn_NAME=galera_proxy && \
ctnID=$(docker ps -q --filter label=com.docker.swarm.service.name=$ctn_NAME)
echo "$ctnID"

mysql -h$ctnID -uproxyuser -p