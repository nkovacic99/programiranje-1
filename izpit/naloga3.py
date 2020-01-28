from functools import lru_cache
@lru_cache(maxsize = 1000)
def mama_Franca(n, m, l, p):
    '''n -> širina balkona, m -> število korit, l -> širina korit'''
    if n < l or n == 0 or m == 0:
        return 1
    else:
        counter = 0
        #ko mama Franca položi eno korito jih ima torej še (m - 1)
    if p == 0:
        #prvič prištejemo za eno dolžino, kot da je mama Franca
        #dala rože čisto na začetek korita, nato pa spuščala po
        #vsaj en prostor med njimi
        if n - l == 0:
            counter += 1
        elif  n - l > 0:
            l += 1
            counter += 1 + mama_Franca(n - l, m - 1, l, 1)
    else:
        if n - l == 0:
            counter += 1
        elif  n - l > 0:
            counter += 1 + max(mama_Franca(n - l - k + 1, m - 1, l, p + 1) for k in range(n + 1))
            #ta k je zraven zato, ker ni nujno, 
            #da bo spustila zgolj en prostor med rožami
    return counter

def mama_Franca_sadi(n, m, l):
    return mama_Franca(n, m, l, 0)

print(mama_Franca_sadi(9, 3, 2))

def random_korita(n, ls):
    counter = 0
    for korito in ls:
        counter += 1 + mama_Franca_sadi(n - korito, 1, korito) 