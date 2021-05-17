    a = input()
    b = input()
    c = input()
     
    if a!=b and b!=c and c!=a:
        print('?')
    elif a[0]=='s' and b[0]=='r' and c[0]=='r':
        print('?')
    elif a[0]=='s' and b[0]=='p' and c[0]=='p':
        print('F')
    elif a[0]=='r' and b[0]=='p' and c[0]=='p':
        print('?')
    elif a[0]=='r' and b[0]=='s' and c[0]=='s':
        print('F')
    elif a[0]=='p' and b[0]=='s' and c[0]=='s':
        print('?')
    elif a[0]=='p' and b[0]=='r' and c[0]=='r':
        print('F')
    elif a[0]=='p' and b[0]=='s' and c[0]=='p':
        print('M')
    elif a[0]=='r' and b[0]=='s' and c[0]=='r':
        print('?')
    elif a[0]=='s' and b[0]=='r' and c[0]=='s':
        print('M')
    elif a[0]=='p' and b[0]=='r' and c[0]=='p':
        print('?')
    elif a[0]=='s' and b[0]=='p' and c[0]=='s':
        print('?')
    elif a[0]=='r' and b[0]=='p' and c[0]=='r':
        print('M')
    elif a[0]=='p' and b[0]=='p' and c[0]=='s':
        print('S')
    elif a[0]=='r' and b[0]=='r' and c[0]=='s':
        print('?')
    elif a[0]=='s' and b[0]=='s' and c[0]=='p':
        print('?')
    elif a[0]=='r' and b[0]=='r' and c[0]=='p':
        print('S')
    elif a[0]=='s' and b[0]=='s' and c[0]=='r':
        print('S')
    elif a[0]=='p' and b[0]=='p' and c[0]=='r':
        print('?')
    else:
        print('?')
