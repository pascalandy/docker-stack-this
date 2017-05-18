-- Execute this command to force a node to form a new cluster online
-- Useful in case a majority of nodes are down and a quorum cannot be formed
-- and you don't remember the exact variable name or value needed. :)
--
-- See https://www.percona.com/blog/2014/09/01/galera-replication-how-to-recover-a-pxc-cluster/
--
SET GLOBAL wsrep_provider_options='pc.bootstrap=true';
