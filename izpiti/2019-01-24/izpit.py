# def doloci_max(st, ls):
#     max = 0
#     for i in range(st + 1):
#         if ls[i] > max:
#             max = i
#     return max
# 
# def zabica(energija, mocvirje):
#     energija += mocvirje[0]
#     if energija >= len(mocvirje):
#         return 1
#     
#     idealen_skok = doloci_max(energija, mocvirje)
# 
#     return 1 + zabica(energija - idealen_skok, mocvirje[idealen_skok::])