SELECT
    a.SubscriberKey,
    b.MobileNumber,
    b.Undeliverable,
    b.BounceCount,
    b.FirstBounceDate,
    b.HoldDate
FROM SMSmessagetracking_backup_exclusao a
    INNER JOIN _UndeliverableSms b 
        ON a.Mobile = b.MobileNumber