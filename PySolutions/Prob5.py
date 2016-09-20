
'''
Problem 5
Calculates the Least Common Multiple of a list of numbers.

Known limitation: Bound by Python VM memory limitations as a consequence of
recursion.
'''
def solution(elementList) : # Pass in an array list
    if len(elementList) == 1 : # if the length == 1 return the element in list
        return elementList.pop()
    else:   # take the product of the head and recurse against the tail-en of
            # the list after being divided by the head
        head = elementList.pop(0)
        # Uncomment print below to see how the array shrinks in each iteration
#        print(elementList)
        return head * solution([y // head if y % head == 0
            else y for y in elementList]) # Recursive step

if __name__ == '__main__':
    elements = list(range(1,21)) # Range of elements
    print(solution(elements))
