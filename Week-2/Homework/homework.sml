fun is_older ((y1:int, m1:int, d1:int), (y2:int, m2:int, d2:int)) =
    if (y1 < y2)
    then true
    else if (y1 = y2 andalso m1 < m2)
        then true
        else if (m1 = m2 andalso d1 < d2)
            then true
    else false


fun number_in_month (ds:(int * int * int) list, m:int) =
    if null ds
    then 0
    else
	if #2 (hd ds) = m
	then 1 + number_in_month (tl ds, m)
	else number_in_month (tl ds, m)
		 
				    
				   
    
    