#use challenges;
#select * from sample_dataset1;
#select `<close>`-`<open>` as gain from sample_dataset1;

# Gain
select `<ticker>` , `<close>` , `<open>` , round((`<close>`-`<open>`)) as Gain from sample_dataset1;

# Percentage Gain after rounding off
select `<Ticker>` as Ticker , round(((`<open>` - `<close>`) / `<open>`)*100 , 2) as Percentage_Gain
	from sample_dataset1 order by Percentage_Gain desc limit 10;

