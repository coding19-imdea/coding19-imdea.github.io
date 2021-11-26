def maximizeXor(min, max):

    #Check if min is smaller than max
    if (min < max):
    
        # Transform to bin and remove the 0b attached to the begining of the string
        bmin = bin(min)[2:]
        bmax = bin(max)[2:]

        lenmax = len(bmax)

        bopt = [0]*lenmax

        for i in range(lenmax):

            indmin = i - lenmax

            if indmin < 0:
                bopt[i] = str((int(bmax[i])+1)%2)

            else:
                if (int(''.join(bopt))>min):
                    bopt[i] = str((int(bmax[i])+1)%2)
                elif ( int(bmin[indmin]) !=1):
                    bopt[i] = str((int(bmax[i])+1)%2)


        bopt = ''.join(bopt)

        return int(bopt,2)^max
        
    # If both are equal, the max xor is 0
    elif (min == max):
        
        return 0

    else:
        return "min has to be lower than max"


result = maximizeXor(1000000000000,999999999999999999)
# result = maximizeXor(8,16)
print("The result is ",result)
