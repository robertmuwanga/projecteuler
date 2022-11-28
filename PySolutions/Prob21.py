def factorise(num):
  proper_factors = [x for x in range(1,num+1) if num % x == 0]
  if len(proper_factors) > 1:
    proper_factors.remove(num)
  
  return proper_factors

for number in range(1, range_limit+1):
  dict_pairs[number] = sum(factorise(number))

amicable_pairs = []

for k,_ in enumerate(dict_pairs):
  if k == dict_pairs.get(dict_pairs.get(k, -1), -1):
    amicable_pairs.append((k, dict_pairs[k]))
  
print(amicable_pairs)
