    def f(x):
        if x >= 100:
            return int(x/100) + f(x%100)
        elif x >= 20:
            return int(x/20) + f(x%20)
        elif x >= 10:
            return int(x/10) + f(x%10)
        elif x >= 5:
            return int(x/5) + f(x%5)
        else:
            return x
    print(f(int(input())))
