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


fun number_in_months (ds:(int * int * int) list, ms:int list) =
    if null ms
    then 0
    else
	number_in_month (ds, hd ms) + number_in_months (ds, tl ms)


fun dates_in_month (ds:(int * int * int) list, m:int) =
    if null ds
    then []
    else
	if #2 (hd ds) = m
	then (hd ds) :: dates_in_month (tl ds, m)
	else dates_in_month (tl ds, m)
			    
		
fun dates_in_months (ds:(int * int * int) list, ms:int list) =
    if null ms
    then []
    else dates_in_month (ds, hd ms) @ dates_in_months (ds, tl ms) 

						      
fun get_nth (strs:string list, n:int) =
    if null strs
       orelse n = 1
    then (hd strs)
    else
	get_nth (tl strs, n - 1)

		
fun date_to_string (y:int, m:int, d: int) =
    let val ms =
	    ["January", "February", "March", "April", "May", "June",
	     "July", "August", "September", "October", "November",
	     "December"]
    in
	get_nth (ms, m) ^ " " ^ Int.toString (d) ^ ", " ^ Int.toString (y)
    end


fun number_before_reaching_sum (sum:int, ns:int list) =
    if sum < (hd ns)
       orelse sum = (hd ns)
    then 0
    else 1 + number_before_reaching_sum (sum - (hd ns), tl ns)
					
    
fun what_month (d:int) =
    let val ms = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    in number_before_reaching_sum (d, ms) + 1
    end


fun month_range (day1:int, day2:int) =
    if day1 > day2
    then []
    else
	what_month (day1) :: month_range (day1 + 1, day2)
	    
	     
fun oldest (ds:(int * int * int) list) =
    if null ds
    then NONE
    else
	let val tl_ans = oldest (tl ds)
	in
	    if isSome tl_ans
	       andalso is_older((#1 (valOf tl_ans), #2 (valOf tl_ans), #3 (valOf tl_ans)), (#1 (hd ds), #2 (hd ds), #3 (hd ds)))
            then tl_ans
            else SOME(hd ds)
        end
