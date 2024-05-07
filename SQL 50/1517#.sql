select user_id, name, mail 
from Users
having regexp_like (mail, '^[A-Za-z]+[A-Za-z0-9\_\.\-]*@leetcode\\.com$')