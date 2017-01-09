limit = 10001

for a in range(1,1001):
    for b in range(a, 1001):
        for c in range(b, 1001):
            if(a**2 + b ** 2 == c**2) and (a + b + c == 1000):
                print (a * b * c)
                break
