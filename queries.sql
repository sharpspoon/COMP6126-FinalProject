/*1A*/
select r.roomNumber, concat(p.firstname,' ', p.lastname) as Name, r.admitdate from room r
inner join patients p on r.pid=p.pid
where r.exitdate is null
/*2A*/
select r.roomnumber from room r
where r.exitdate is not null 
/*3A*/
select  concat(p.firstname,' ', p.lastname) as Name, r.roomnumber, r.admitdate from patients p 
 join room r on p.pid=r.pid
where r.exitdate is null
/*1B*/
select * from patients
/*2B*/
select p.pid, concat(p.firstname,' ', p.lastname) as Name from patients p
inner join room r on r.pid=p.pid
where r.exitdate is null
/*3B*/
select r.*, p.pid, concat(p.firstname,' ', p.lastname) as Name from patients p
inner join room r on r.pid=p.pid
where (r.exitdate between 20170101 and 20170401)
or (r.admitdate between 20170101 and 20170401)
/*2C*/
select d.diagnosiscode, d.diagnosisname, d.totaloccurrences from patients p
join diagnosis d on d.did=p.did
where p.admittingdoctor is null
order by d.totaloccurrences desc
/*2D*/
select * from volunteers 
where tuesday=1 and service='Information Desk'


