import re
import matplotlib.pyplot as plt
from matplotlib.ticker import ScalarFormatter

file_name = "slurm.out"
file_name = "slurm-49624630.out"

def get_expe(data_lines):
    for line in data_lines:
        if "gpu" in line: 
            name_expe = re.search("(cucalln2|cucalln2_loki)\/([a-zA-Z_.0-9]*)\/", line)
            if name_expe : 
                if name_expe[1] == "cucalln2":
                    return f"Météo France : {name_expe[2]}"
                elif name_expe[1] == "cucalln2_loki":
                   return f"Ecmwf : {name_expe[2]}"
                else:
                   raise Exception("Expe in wrong dir")
    raise Exception("No expe name found")

def get_time(file_name):
    with open(file_name, "r") as f:
        data_lines = f.readlines()
        data = f.read()
    
    

    name_expe = get_expe(data_lines)
    for line in data_lines:
        if "ZTC" in line:
            array_pt_virgule = [i for i, char in enumerate(line) if char == ';']
            break
    
    
    idx_name = {0 :  "CLARCH"     ,
                1 :  "CLMETHOD"   ,
                2 :  "NPROMA"     ,
                3 :  "NGPBLKS"    ,
                4 :  "NTIME"      ,
                5 :  "ZTCTOT"     ,
                6 :  "ZTC"        ,
                7 :  "ZTDTOT"     ,
                8 :  "ZTD"} 
    
    idx_time_name = {"CLARCH"   :  0  ,
                     "CLMETHOD" :  1  ,
                     "NPROMA"   :  2  ,
                     "NGPBLKS"  :  3  ,
                     "NTIME"    :  4  ,
                     "ZTCTOT"   :  5  ,
                     "ZTC"      :  6  ,
                     "ZTDTOT"   :  7  ,
                     "ZTD"      :  8} 
    idx_field = {}
    for idx_pt_virgule in range(len(array_pt_virgule)):
        idx_field[idx_name[idx_pt_virgule]] = array_pt_virgule[idx_pt_virgule]
    
    # idx_field = nom_champs : position du pt_virgule
    
    def get_value(array_pt_virgule, line, idx_value_name, field_name):
        start = array_pt_virgule[idx_value_name[field_name]-1]
        end = array_pt_virgule[idx_value_name[field_name]]
        return float(line[start+1:end])
        
    def get_value_in_dict(array_pt_virgule, line, idx_value_name, field_name, value_name):
        value = get_value(array_pt_virgule, line, idx_value_name, field_name)
        value_name[field_name] = value
    
    method = "openaccsinglecolumn"
    param = "NGPBLKS"
    time = {}
    for line_idx in range(len(data_lines)):
        time_name = {}
        line = data_lines[line_idx]
        if param in line and ";" in line: #param is what is changing between each run, for example NGPBLKS
            idx_param = line_idx
            
        if method in line and ";" in line:
            if line_idx == idx_param + 1:
                get_value_in_dict(array_pt_virgule, line, idx_time_name, "ZTCTOT", time_name)
                get_value_in_dict(array_pt_virgule, line, idx_time_name, "ZTC", time_name)
                param_value = get_value(array_pt_virgule, line, idx_time_name, param)
                time[param_value] = time_name   
    return time, name_expe



file_names = ["slurm_loki_gvmode.out", "slurm_loki_default.out", "slurm_mf.out"]
#file_names = ["../cucalln2/slurm-49636071.out", "../cucalln2_loki/slurm-49692880.out", "../cucalln2_loki/slurm-49692908.out", "../cucalln2_loki/slurm-49697506.out"]
file_names = ["../cucalln2/slurm-49636071.out", "../cucalln2_loki/slurm-50094233.out", "../cucalln2_loki/slurm-50095064.out"]

# Computation time by point
#for file_name in file_names:
#    time, label = get_time(file_name)
#    
#    graph1_name = "ZTCTOT"
#    graph2_name = "ZTC"
#    X = [key for key in time.keys()]
#    print(X)
#    Y = [time[x][graph2_name] for x in X]
#    #plt.plot(X,Y_mf,"x-", label="Météo france time in function of ngpblks")
#    plt.plot(X,Y,"x-", label=label)
#    plt.gca().yaxis.set_major_formatter(ScalarFormatter(useMathText=True))
#    plt.gca().ticklabel_format(style='sci', axis='y', scilimits=(0,0))
#    plt.legend()
#
#
#plt.xlabel("Number of blocks")
#if graph2_name == "ZTC":
#    plt.ylabel("Computation time by point")
#elif graph2_name == "ZTCTOT":
#    plt.xlabel("Computation time")
#plt.title("Cucalln testing with mf scc")
#plt.show()

for file_name in file_names:
    time, label = get_time(file_name)
    
    graph1_name = "ZTCTOT"
    graph2_name = "ZTC"
    X = [key for key in time.keys()]
    print(X)
    Y = [1/time[x][graph2_name] for x in X]
    #plt.plot(X,Y_mf,"x-", label="Météo france time in function of ngpblks")
    plt.plot(X,Y,"x-", label=label)
    plt.gca().yaxis.set_major_formatter(ScalarFormatter(useMathText=True))
    plt.gca().ticklabel_format(style='sci', axis='y', scilimits=(0,0))
    plt.legend()


plt.xlabel("Number of blocks")
if graph2_name == "ZTC":
    plt.ylabel("Points computed per second")
elif graph2_name == "ZTCTOT":
    plt.xlabel("Computation time")
plt.title("Cucalln testing with mf scc")
plt.show()
