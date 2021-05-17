    n = int(input())
    overtaking = 0
    answer = 0
    speed = int(input()[2:])
    limits = [300]
    for _ in range(n-1):
        action = input()
        if action[0] == "1":
            speed = int(action[2:])
            while limits[-1] < speed:
                answer += 1
                limits.pop()
        elif action[0] == "2":
            answer += overtaking
            overtaking = 0
        elif action[0] == "3":
            newlimit = int(action[2:])
            if speed > newlimit:
                answer += 1
            else:
                limits.append(newlimit)
        elif action[0] == "4":
            overtaking = 0
        elif action[0] == "5":
            limits = [300]
        elif action[0] == "6":
            overtaking += 1
    print(answer)

