select f.carrier, b.name,(select count(*) from flights.flights as a where a.dep_delay<15 and (a.carrier=f.carrier))/count(*) *100 as "On-time Performance" from flights.flights as f
inner join flights.airlines as b on b.carrier = f.carrier
group by f.carrier
INTO outfile 'C:/wamp64/tmp/on-time-performance.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';