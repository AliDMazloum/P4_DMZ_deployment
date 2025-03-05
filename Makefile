
compile:
	cd /sde/bf-sde-9.4.0/ ; sh . ../tools/./set_sde.bash
	/sde/tools/p4_build.sh --with-p4c=bf-p4c /home/edgecore_DMZ/P4_DMZ_deployment/p4src/Per_Flow_Collector.p4

run:
	pkill switchd 2> /dev/null ; cd /sde/bf-sde-9.4.0/ ;./run_switchd.sh -p Per_Flow_Collector

conf_links1:
	cd /sde/bf-sde-9.4.0/ ; ./run_bfshell.sh --no-status-srv -f /home/edgecore_DMZ/P4_DMZ_deployment/ucli_cmds_part1

conf_links2:
	cd /sde/bf-sde-9.4.0/ ; ./run_bfshell.sh --no-status-srv -f /home/edgecore_DMZ/P4_DMZ_deployment/ucli_cmds_part2

start_control_plane_measurements:
	/sde/bf-sde-9.4.0/./run_bfshell.sh --no-status-srv -i -b /home/edgecore_DMZ/P4_DMZ_deployment/bfrt_python/control_plane.py

