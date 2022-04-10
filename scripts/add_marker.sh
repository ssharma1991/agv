#!/bin/sh

echo "Deploying a factorybot in a warehouse environment"
gnome-terminal --tab --title 'gazebo' -- sh -c "roslaunch factorybot sim_world.launch factorybot_type:=amr factorybot_name:=AMR"
sleep 5

echo "Opening rviz to observe the map"
gnome-terminal --tab --title 'rviz' -- sh -c "roslaunch factorybot rviz_visualize_amr_urdf.launch rviz_config:=pick_and_drop_amr.rviz" 
sleep 5

echo "Starting amcl (adaptive monte carlo localization)"
gnome-terminal --tab --title 'amcl' -- sh -c  "roslaunch factorybot amcl.launch map_file:=building_agv_slam.yaml" 
sleep 5

echo "Starting picking and dropping operation"
gnome-terminal --tab --title 'mission_control' -- sh -c  "rosrun factorybot add_markers" 