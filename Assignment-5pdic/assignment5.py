# 1. Repeat a tuple three times using * operator

t = (1, 2, 3)
result = t * 3

print("Repeated Tuple:", result)


# 2. Join three tuples using + operator

t1 = (1, 2)
t2 = (3, 4)
t3 = (5, 6)

new_tuple = t1 + t2 + t3

print("Joined Tuple:", new_tuple)


# 3. Check whether an element exists in a tuple

t = (10, 20, 30, 40)

element = 30

if element in t:
    print("Element exists in tuple")
else:
    print("Element does not exist")


# 4. Find total, highest and lowest value without sum(), max(), min()

numbers = (10, 25, 5, 40, 15)

total = 0
highest = numbers[0]
lowest = numbers[0]

for num in numbers:
    total += num

    if num > highest:
        highest = num

    if num < lowest:
        lowest = num

print("Total:", total)
print("Highest:", highest)
print("Lowest:", lowest)


# 5. Filter tuple values greater than 10

n = (3, 14, 7, 22, 9, 41, 18, 5)

filtered = ()

for num in n:
    if num > 10:
        filtered += (num,)

print("Filtered Tuple:", filtered)


# 6. Count elements in a set without len()

s = {"cat", "dog", "bird", "fish"}

count = 0

for item in s:
    count += 1

print("Number of elements:", count)


# 7. Combine two sets

s1 = {1, 2, 3, 4}
s2 = {3, 4, 5, 6}

combined = s1 | s2

print("Combined Set:", combined)


# 8. Find common elements in two sets

s1 = {1, 2, 3, 4}
s2 = {3, 4, 5, 6}

common = s1 & s2

print("Common Elements:", common)


