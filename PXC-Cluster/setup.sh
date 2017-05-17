docker exec -i galera_proxy.1.mgr9h5f5c7hp6gu9lpvk6g89u add_cluster_nodes.sh

docker exec -it galera_proxy.1.mgr9h5f5c7hp6gu9lpvk6g89u mysql -uproxyuser -p

docker exec -it galera_proxy.1.mgr9h5f5c7hp6gu9lpvk6g89u mysql -uproxyuser -pMM98j290HU2vCD4f8723fZZ \
-e "SHOW DATABASES;"

docker exec -it $ctnID mysql --user=root --password=$ENV_PASS \


docker exec -it galera_proxy mysql -uproxyuser -pMM98j290HU2vCD4f8723fZZ \
-e "SHOW DATABASES;"

galera_proxy