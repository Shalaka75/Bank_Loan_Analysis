
select * from bank_loan_data

select count(id) as Total_Loan_Applications from bank_loan_data

select count(id) as MTD_Total_Loan_Applications from bank_loan_data
where month(issue_date) = 12

select count(id) as PMTD_Total_Loan_Applications from bank_loan_data
where month(issue_date) = 11

select sum(loan_amount) as Total_Funding_Amount from bank_loan_data

select sum(loan_amount) as MTD_Total_Funding_Amount from bank_loan_data
where month(issue_date) =12

select sum(loan_amount) as PMTD_Total_Funding_Amount from bank_loan_data
where month(issue_date) =11

select sum(total_payment) as Total_Amount_Recieved from bank_loan_data

select sum(total_payment) as MTD_Total_Amount_Recieved from bank_loan_data
where month(issue_date) =12

select sum(total_payment) as PMTD_Total_Amount_Recieved from bank_loan_data
where month(issue_date) =11

select round(avg(int_rate), 4)* 100 as Average_Interest_Rate from bank_loan_data

select round(avg(int_rate), 4)* 100 as MTD_Average_Interest_Rate from bank_loan_data
where month(issue_date) = 12

select round(avg(int_rate), 4)* 100 as PMTD_Average_Interest_Rate from bank_loan_data
where month(issue_date) = 11

select round(avg(dti), 4) * 100 as MTD_Avg_DTI from bank_loan_data 
where month(issue_date) = 12

select round(avg(dti), 4) * 100 as PMTD_Avg_DTI from bank_loan_data 
where month(issue_date) = 11

select 
	(count(case when loan_status = 'Fully Paid' or loan_status= 'Current' then id end) * 100) 
	/
	count(id) as Good_Loan_Applications
from bank_loan_data

select count(id) as Good_Loan_Application from bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'Current'

select sum(loan_amount) As Good_Loan_Funded_Amount from bank_loan_data
where loan_status in('Fully Paid', 'Current')

select sum(total_payment) As Good_Loan_Recieved_Amount from bank_loan_data
where loan_status in('Fully Paid', 'Current')

select 
	(count(case when loan_status = 'Charged Off' then id end) * 100.0) 
	/
	count(id) as Bad_Loan_Applications
from bank_loan_data

select count(id) from bank_loan_data
where loan_status = 'Charged Off'

select sum(loan_amount) As Bad_Loan_Funded_Amount from bank_loan_data
where loan_status in('Charged Off')

select sum(total_payment) As Bad_Loan_Recieved_Amount from bank_loan_data
where loan_status in('Charged Off')

select 
	loan_status,
	count(id) as Toatal_Loan_Applications,
	sum(total_payment) as total_Amount_Recieved,
	sum(loan_amount) as Total_Funded_Amount,
	avg(int_rate * 100.0) as Interest_Rate,
	avg(dti * 100.0) as DTI
from bank_loan_data
group by loan_status

select 
	loan_status,
	count(id) as Toatal_Loan_Applications,
	sum(total_payment) as MTD_Total_Amount_Recieved,
	sum(loan_amount) as MTD_Total_Funded_Amount
from bank_loan_data
where month(issue_date) =12
group by loan_status

select 
	month(issue_date) as Month_Number,
	datename(month, issue_date) as Month_Name,
	count(id) as Total_Loan_Applications,
	sum(loan_amount) as Total_Funded_Amount,
	sum(total_payment) as Total_Amount_Recieved
from bank_loan_data
group by month(issue_date), datename(month, issue_date)
order by month(issue_date) desc

select 
	address_state,
	count(id) as Total_Loan_Applications,
	sum(loan_amount) as Total_Funded_Amount,
	sum(total_payment) as Total_Amount_Recieved
from bank_loan_data
group by address_state
order by sum(loan_amount) desc


select 
	emp_length,
	count(id) as Total_Loan_Applications,
	sum(loan_amount) as Total_Funded_Amount,
	sum(total_payment) as Total_Amount_Recieved
from bank_loan_data
group by emp_length
order by emp_length

select 
	purpose,
	count(id) as Total_Loan_Applications,
	sum(loan_amount) as Total_Funded_Amount,
	sum(total_payment) as Total_Amount_Recieved
from bank_loan_data
group by purpose
order by sum(loan_amount) desc


select 
	home_ownership,
	count(id) as Total_Loan_Applications,
	sum(loan_amount) as Total_Funded_Amount,
	sum(total_payment) as Total_Amount_Recieved
from bank_loan_data
group by home_ownership
order by sum(loan_amount) desc



