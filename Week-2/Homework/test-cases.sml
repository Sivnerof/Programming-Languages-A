use "homework.sml";

(* Homework1 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)


val test1a = is_older ((1,2,3),(2,3,4)) = true
val test1b = is_older ((1999,1,25),(2000,1,25)) = true
val test1c = is_older ((1999,2,10),(1999,3,10)) = true
val test1d = is_older ((1999,2,10),(1999,2,11)) = true 
val test1e = is_older ((2000,1,1),(2000,1,1)) = false
val test1f = is_older ((1999,2,10),(1998,2,10)) = false
val test1g = is_older ((1999,2,10),(1999,1,10)) = false
val test1i = is_older ((1999,2,11),(1999,2,10)) = false

val test2a = number_in_month ([(2012,2,28),(2013,12,1)],2) = 1
val test2b = number_in_month ([(2012,3,28),(2013,3,1)],2) = 0
val test2c = number_in_month ([(2012,2,28),(2013,2,1)],2) = 2
val test2d = number_in_month ([(2012,2,28),(2013,12,1),(2012,3,1)],2) = 1
val test2e = number_in_month ([(2012,1,28),(2013,12,1),(2011,5,20)],2) = 0
val test2f = number_in_month ([(2012,3,28),(2013,3,1),(2011,3,20),(2010,3,10)],3) = 4
val test2g = number_in_month ([(2012,2,28)],2) = 1
val test2h = number_in_month ([],2) = 0					

								
val test3a = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3
val test3b = number_in_months ([(2012,1,28),(2013,12,1),(2011,5,31),(2011,6,28)],[2,3,4]) = 0
val test3c = number_in_months ([],[]) = 0
val test3d = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2]) = 1
val test3e = number_in_months ([(2012,2,28),(2013,2,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 4
val test3f = number_in_months ([(2012,2,28),(2013,2,1),(2011,2,31),(2011,2,28)],[2,3,4]) = 4
val test3g = number_in_months ([],[2,3,4]) = 0
val test3h = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3
val test3i = number_in_months ([(2012,2,28),(2013,12,1)],[2,3,4,2,12,2]) = 4

									       
val test4a = dates_in_month ([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)]
val test4b = dates_in_month ([(2012,2,28),(2013,12,1),(2011,2,14)],2) = [(2012,2,28),(2011,2,14)]
val test4c = dates_in_month ([],2) = []
val test4d = dates_in_month ([(2012,3,28),(2013,12,1)],2) = []
val test4e = dates_in_month ([(2012,2,28),(2013,2,1),(2014,2,20)],2) = [(2012,2,28),(2013,2,1),(2014,2,20)]
							       

val test5a = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]
val test5b = dates_in_months ([],[]) = []
val test5c = dates_in_months ([(2012,5,28),(2013,12,1),(2011,6,31),(2011,7,28)],[2,3,4]) = []
val test5d = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[]) = []
val test5e = dates_in_months ([],[2,3,4]) = []


val test6a = get_nth (["hi", "there", "how", "are", "you"], 2) = "there"
val test6b = get_nth (["hi", "there", "how", "are", "you"], 1) = "hi"
val test6c = get_nth (["hi", "there", "how", "are", "you"], 5) = "you"
		     

val test7a = date_to_string (2013, 6, 1) = "June 1, 2013"
val test7b = date_to_string (999, 2, 5) = "February 5, 999"
val test7c = date_to_string (2013, 12, 1) = "December 1, 2013"
val test7d = date_to_string (2013, 1, 1) = "January 1, 2013"
					       

val test8a = number_before_reaching_sum (10, [1,2,3,4,5]) = 3
val test8b = number_before_reaching_sum (1, [1,2,3,4,5]) = 0
val test8c = number_before_reaching_sum (0, [1,2,3,4,5]) = 0
val test8d = number_before_reaching_sum (15, [1,2,3,4,5]) = 4
							       

val test9a = what_month 70 = 3
val test9b = what_month 1 = 1
val test9c = what_month 365 = 12
val test9d = what_month 118 = 4
val test9e = what_month 100 = 4
val test9f = what_month 59 = 2
				 

val test10a = month_range (31, 34) = [1,2,2,2]
val test10b = month_range (1, 31) = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
val test10c = month_range (1, 32) = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2]
val test10d = month_range (5, 3) = []
val test10e = month_range (3, 5) = [1,1,1]
					 

val test11 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)
