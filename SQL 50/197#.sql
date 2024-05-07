select w1.Id
from Weather w1 JOIN Weather w2
on w1.recordDate = w2.recordDate + INTERVAL 1 DAY
where w2.temperature < w1.temperature