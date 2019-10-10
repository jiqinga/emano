#!/bin/bash
docker ps | grep emano_postgre &>/dev/null
if [ $? -eq 0 ];then
expect <<EOF
spawn docker exec -it `docker ps -q --filter name=emano_postgre` bash
expect "#"   {send "psql -U postgres\n"}
expect "=#"  {send "\\\c nfvo;\n"}
expect "=#"  {send "alter sequence cpds_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence cprs_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence data_files_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence departments_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence dictdata_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence dicts_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence elk_history_lps_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence feedbacks_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence folders_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence group_permissions_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence groups_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence hosts_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence k8s_clusters_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence lccnsubscriptions_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence log4ts_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence nfp_cpds_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence nfprs_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence nfps_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence nsd_flavour_vnfs_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence nsd_flavours_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence nsds_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence nsds_nsds_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence nslcmopoccs_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence nsrs_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence nsrs_nsrs_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence packages_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence permissions_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence pnfds_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence pnfrs_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence reviews_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence rights_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence roles_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence sequences_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence sessions_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence share_links_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence tenants_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence traps_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence user_files_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence users_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence vdur_vnfcs_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence vdurs_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence vdus_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence vims_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence vlds_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence vlrs_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence vnfcs_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence vnfd_flavour_vdus_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence vnfd_flavours_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence vnfds_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence vnffgds_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence vnffgrs_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence vnfms_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence vnfrs_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence vrm_flavors_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence vrm_images_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence vrm_networks_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence vrm_ports_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence vrm_router_interfaces_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence vrm_routers_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence vrm_servers_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence vrm_subnets_id_seq restart with $1;\n"}
expect "=#"  {send "\\\c auth;\n"}
expect "=#"  {send "alter sequence departments_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence domains_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence groups_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence rights_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence roles_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence tenants_id_seq restart with $1;\n"}
expect "=#"  {send "alter sequence users_id_seq restart with $1;\n"}
expect "=#"  {send "exit;\n"}
EOF
else
exit 0
fi
