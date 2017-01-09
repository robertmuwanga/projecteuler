def decompose(x):
    j = []
    while(x != []):
        j.append(x[0])
        x = [i for i in x[1:] if i % x[0] != 0]
        if(len(j) > 10001) :
            return j[10000]
    return j

print(decompose(list(range(2,1000000))))
