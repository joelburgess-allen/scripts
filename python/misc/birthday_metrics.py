print '#, %'
for i in xrange(1, 366):
    numerator = 1
    for x in range(i):
        iter_num = 364 - x
        numerator *= iter_num
    denominator = 365 ** i
    prob = (1 - (float(numerator) / denominator) ) * 100
    print i + 1, prob
