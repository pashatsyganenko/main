    k = 0
    for _ in range(int(input())):
        x1,y1,x2,y2 = input().split()
        k += (int(x2)-int(x1)+1)*(int(y2)-int(y1)+1)
    print(k)
