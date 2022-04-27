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


(*
Write a function date_to_string that takes a date and returns a string o	f the form January 20, 2013 (for example). 
Use the operator ^ for concatenating strings and the library function Int.toString for converting an int to a string. 
For producing the month part, do not use a bunch of conditionals.
Instead, use a list holding 12 strings and your answer to the previous problem. For consistency, put a comma following the day and use capitalized English month names: January, February, March, April, May, June, July, August, September, October, November, December.

Correct Bindings:
	val date_to_string = fn : int * int * int -> string

Test Case:
	val test7 = date_to_string (2013, 6, 1) = "June 1, 2013"
*)


		
