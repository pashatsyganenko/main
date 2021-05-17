    n = int(input())
    s1 = input()
    s2 = input()
    s = ''
     
    for i in range(0,n):
        if s1[i] == "0" and s2[i] == "1":
            s += "1"
        else:
            s += "0"
    print(s)
