import rospy
import sys

#GLOBAL VARIABLES
Filename = "/home/sumanth/HECTOR_INSTALL/src/move_to_point/launch/multi_drone_build.launch"
start_altitude = 0.5
increment_altitude = 0.4
name_prefix = "uav"

#ARGUMENTS
no_of_drones = 0
Location_of_drones = []


class Point:
    def __init__(self,x,y,z):
        self.x = x
        self.y = y
        self.z = z
    

def read_arguments():
    global Location_of_drones, no_of_drones
    no_of_drones = int(sys.argv[1])
    print("NO OF DRONES : "+str(no_of_drones))
    if len(sys.argv) < 2:
        print("INVALID NUMBER OF ARGUMENTS")
        return False

    for i in range(2,len(sys.argv),3):        
        #READ LOCATION OF EACH DRONE
        Location_of_drones.append({"x":sys.argv[i],"y":sys.argv[i+1],"z":sys.argv[i+2]})
        
    return True

def write_to_file():
    
    global no_of_drones,Location_of_drones,Filename,name_prefix,start_altitude,increment_altitude
    
    #OPEN FILE
    fp = open(Filename,"w")

    #WRITE BASIC TAGS
    to_write = ["<?xml version=\"1.0\" encoding=\"utf-8\"?>\n", "<launch>\n"]
    
    for i in range(no_of_drones):
        to_write.append("\n<node pkg=\"move_to_point\" type=\"final_multi_drone.py\" name=\""+name_prefix+str(i)+"\" output=\"screen\" args=\""+name_prefix+str(i)+" "+str(start_altitude+i*increment_altitude)+"\" >\n")
        to_write.append("<param name=\"des_points\" value=\"5 6,3 4,-7 -8\" type=\"str\"/>\n")
        to_write.append("</node>\n\n")

    to_write.append("</launch>\n")
    
    fp.writelines(to_write)

    fp.close()

def main():
    
    if(not read_arguments()):
        return
    write_to_file()

main()
    
    
    
