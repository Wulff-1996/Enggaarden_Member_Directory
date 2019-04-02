###############################
######### VIEW SCRIPTS ########
###############################

DROP VIEW IF EXISTS statistics;
DROP VIEW IF EXISTS sumOfAmount;
DROP VIEW IF EXISTS partialMember;
DROP VIEW IF EXISTS logView;

### FOR STATISTICS_OVERVIEW_HTML 
CREATE VIEW sumOfAmount
AS
SELECT SUM(amount) as sum
FROM contributions;

CREATE VIEW statistics
AS
SELECT 
	c.activityType AS 'aktivitetstype', 
    ROUND(SUM(c.amount), 0) AS 'sum af udbetalt støtte', 
    count(c.contributionid) AS 'antal udbetalinger', 
    ROUND(AVG(c.amount), 0) AS 'gns pr. aktivitet', 
    ROUND(SUM(c.amount)/sm.sum*100, 0) AS 'del af samlet støtte'
FROM contributions c
JOIN sumOfAmount sm
GROUP BY activitytype;

### FOR MEMBERS_OVERVIEW.HTML
CREATE VIEW partialMember 
AS
SELECT * FROM members
JOIN subscriptions USING (memberId);

### FOR SUBLOG
CREATE VIEW logView
AS
SELECT CONCAT(firstName,' ', lastName) AS fullName, edit, username, editDate, subLogId
FROM sublogs
JOIN members USING(memberId)
ORDER BY subLogId DESC;