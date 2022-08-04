# use challenges;

# Stored Procedure calculating Volume Weighted Average Prices
delimiter //
create procedure vwap1(in userdate varchar(20))
begin
	select `<ticker>` as Ticker , str_to_date(`<date>` , '%Y%m%d%H%i') as real_datetime , sum((`<vol>` * `<close>`)) / sum(`<vol>`) as vwap
		from (
			select * from sample_dataset2 where str_to_date(`<date>` , '%Y%m%d%H%i') between
				str_to_date(@userdate , '%Y%m%d%H%i') and 
                date_add(str_to_date(@userdate , '%Y%m%d%H%i') , interval 5 hour)
        ) as temp
	group by Ticker;
end //
 
delimiter ;

# Calling the stored procedure 
# Enter the date and time in 'YYYYMMDDHHMM' format
call vwap1('201010111000');

drop procedure vwap1;

################################################################################################################################################

# Stored Procedure calculating Volume Weighted Average Prices
# StartDate and StartTime entered as separate inputs
delimiter //
create procedure vwap2(in s_date date, in s_time time)
begin
	set @userdate = cast(s_date as datetime) + cast(s_time as time);
    select `<ticker>` as Ticker , str_to_date(`<date>` , '%Y%m%d%H%i') as real_datetime, sum((`<vol>` * `<close>`)) / sum(`<vol>`) as vwap
		from (
			select * from sample_dataset2 where str_to_date(`<date>` , '%Y%m%d%H%i') between
				str_to_date(@userdate , '%Y%m%d%H%i') and 
                date_add(str_to_date(@userdate , '%Y%m%d%H%i') , interval 5 hour)
        ) as temp1
	group by Ticker;
end //
 
delimiter ;

# Calling the stored procedure 
# Enter date and time separately
call vwap2('2010-10-11' , '10:00');

drop procedure vwap2;
