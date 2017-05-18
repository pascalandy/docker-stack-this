Use flag files to manage the bootstrapping process. Pick one node (e.g. "db1") to be the seed and put the other nodes
(e.g. "db2" and "db3" on "hold" until you are ready to have them join.


    db1 $ docker volume create mysql-data
    db1 $ touch /var/lib/docker/volumes/mysql-data/_data/new-cluster
    db1 $ chmod 666 /var/lib/docker/volumes/mysql-data/_data/new-cluster  #IMPORTANT!
    db2 $ docker volume create mysql-data
    db2 $ touch /var/lib/docker/volumes/mysql-data/_data/hold-start
    db3 $ docker volume create mysql-data
    db3 $ touch /var/lib/docker/volumes/mysql-data/_data/hold-start
    $ kontena stack install kontena.yml
    $ # Check logs for generated root password
    $ # Import database dump on db1
    db2 $ rm /var/lib/docker/volumes/mysql-data/_data/hold-start
    $ # Wait for db2 to become Synced
    db3 $ rm /var/lib/docker/volumes/mysql-data/_data/hold-start
    $ # All done!
