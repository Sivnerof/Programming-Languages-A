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
	
(*
10. Write a function month_range that takes two days of the year day1 and day2 and returns an int list [m1,m2,...,mn] where m1 is the month of day1, m2 is the month of day1+1, ..., and mn is the month of day day2. Note the result will have length day2 - day1 + 1 or length 0 if day1>day2.

val test10 = month_range (31, 34) = [1,2,2,2]
val month_range = fn : int * int -> int list
*)

(*
11. Write a function oldest that takes a list of dates and evaluates to an (int*int*int) option. It evaluates to NONE if the list has no dates and SOME d if the date d is the oldest date in the list.

val test11 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)
val oldest = fn : (int * int * int) list -> (int * int * int) option
*)


(*
12. Challenge Problem: Write functions number_in_months_challenge and dates_in_months_challenge that are like your solutions to problems 3 and 5 except having a month in the second argument multiple times has no more effect than having it once. (Hint: Remove duplicates, then use previous work.)
*)


(*
13. Challenge Problem: Write a function reasonable_date that takes a date and determines if it describes a real date in the common era. A “real date” has a positive year (year 0 did not exist), a month between 1 and 12, and a day appropriate for the month. Solutions should properly handle leap years. Leap years are years that are either divisible by 400 or divisible by 4 but not divisible by 100.
(Do not worry about days possibly lost in the conversion to the Gregorian calendar in the Late 1500s.
*)			
	
