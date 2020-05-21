file = open("text.txt", "r")

# Задача 1
def ips():
    ip = []
    for s in file:
        l = (s.split(" ")[0]).split(".")
        t = False
        if len(l)==4:
            for i in l:
                if not 0<=int(i)<=255:
                    t = False
                    break
                else:
                    t = True
        if t:
            ip.append(s.split(" ")[0])
    return ip


#print(ips())

def names():
    dict = {}
    for s in file:
        if len(s.split())==2:
            dict[s.split()[1]] = s.split()[0]
        else: dict[s.split()[2]] = s.split()[1]
    return dict

#print(names())

# Задача 3
def phone_numbers():
    numbers = []
    for s in file:
        str = ""
        for i in s:
            if i in ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0',]:
                str += i
        if len(str)==7:
            numbers.append(("+7-812-"+str[0:3]+"-"+str[3:5]+"-"+str[5:7],"--"))
        elif len(str)==10:
            numbers.append(("+7-"+str[0:3]+"-"+str[3:6]+"-"+str[6:8]+"-"+str[8:10],"--"))
        elif len(str)==11:
            if str[0]=='8':
                numbers.append(("+7-"+str[1:4]+"-"+str[4:7]+"-"+str[7:9]+"-"+str[9:11],"--"))
            else:
                numbers.append(("+"+str[0]+"-"+str[1:4]+"-"+str[4:7]+"-"+str[7:9]+"-"+str[9:11],"--"))
        else:
            numbers.append(("--", "ERROR"))
    return numbers

#print(phone_numbers())

# Задача 4
def fio():
    fio = []
    for s in file:
        x = s.split()
        if len(x)==2:
            fio.append((x[0],x[1],"--"))
        else:
            fio.append((x[0],x[1],x[2]))
    return fio

#print(fio())

# Задача 5
def ocaml():
    d = {}
    str = ""
    for s in file:
        str += s
    for i in ["let", "rec", "type", "open", "with", "match", "in", "if", "else"]:
        c = 0
        for j in range(0,len(str)-len(i)):
            if str[j:(j+len(i))]==i:
                c += 1
        d[i]=c
    return d

#print(ocaml())
