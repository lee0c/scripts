output = {}

for line in open("horizon.minttyrc", "r"):
    key,val = line.split("=")
    if "Bold" in key:
        key = key.replace("Bold", "bright")
    elif "ground" in key:
        key = key.replace("BackgroundColour", "background").replace("ForegroundColour", "foreground")
    elif "Cursor" in key:
        continue    
    else:
        key = key.lower()

    r,g,b = val.split(",")
    output[key] = "#%0.2X%0.2X%0.2X" %(int(r), int(g), int(b))
 

for k in sorted(output.keys()):
    print("\"%s\" : \"%s\"," %(k, output[k]))  

