import sys


#GLOBAL VARIABLES

Filename = "/home/sumanth/PROJECT/drone_navigation/catkin_ws/src/multidrone_exploration/launch/multi_drone_sim.launch"
start_altitude = 0.25
increment_altitude = 0.4
name_prefix = "uav"

#ARGUMENTS
no_of_drones = 0
Location_of_drones = []

def read_arguments():
    global Location_of_drones, no_of_drones
    no_of_drones = int(sys.argv[1])
    print("LENGTH OF ARGS"+str(len(sys.argv)))
    print("NO OF DRONES : "+str(no_of_drones))
    if len(sys.argv) < (3*no_of_drones):
        print("3x "+str(3*no_of_drones))
        print("LEN "+str(len(sys.argv)))
        print("INVALID NUMBER OF ARGUMENTS")
        return False

    for i in range(2,len(sys.argv),3):        
        #READ LOCATION OF EACH DRONE
        Location_of_drones.append({"x":sys.argv[i],"y":sys.argv[i+1],"z":sys.argv[i+2]})
        
    return True


def write_to_file():
    #OPEN FILE
    fp = open(Filename,"w")

    #WRITE BASIC TAGS
    to_write = ["<?xml version=\"1.0\" encoding=\"utf-8\"?>\n", "<launch>\n"]
    to_write.append(
        "<arg name=\"model\" default=\"$(find hector_quadrotor_description)/urdf/quadrotor_hokuyo_utm30lx.gazebo.xacro\"/>\n"        
        )
    to_write.append(
        """"<arg name="controllers" default="
        controller/attitude
        controller/velocity
        controller/position
        \"/>\n"""
        )
    to_write.append("<include file=\"$(find gazebo_ros)/launch/empty_world.launch\"/>\n\n")

       
    for i in range(2,len(sys.argv),3):
        to_write.append("\n\n<group ns=\""+name_prefix+str(i//3)+"\">\n")
        to_write.append("<include file=\"$(find hector_quadrotor_gazebo)/launch/spawn_quadrotor.launch\">\n")
        to_write.append("<arg name=\"name\" value=\""+name_prefix+str(i//3)+"\" />\n")
        to_write.append("<arg name=\"tf_prefix\" value=\""+name_prefix+str(i//3)+"\" />\n")
        to_write.append("<arg name=\"model\" value=\"$(arg model)\" />\n")
        to_write.append("<arg name=\"x\" value=\""+sys.argv[i]+"\" />\n")
        to_write.append("<arg name=\"y\" value=\""+sys.argv[i+1]+"\" />\n")
        to_write.append("<arg name=\"z\" value=\""+sys.argv[i+2]+"\" />\n")
        to_write.append("</include>\n")
        to_write.append("</group>\n\n")

    to_write.append("</launch>")
    fp.writelines(to_write)

    fp.close()

def main():
    
    if(not read_arguments()):
        return
    write_to_file()

main()

        
                    
