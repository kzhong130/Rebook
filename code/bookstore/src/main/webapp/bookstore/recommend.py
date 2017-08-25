#coding=utf-8
import MySQLdb

conn = MySQLdb.connect(
    host = 'localhost',
    port = 3307,
    user = 'root',
    passwd = 'zcx0605',
    db = 'bookstore',
    )
cur = conn.cursor()

#basetb的数据量
basetb_cnt = cur.execute("select buyerName,ISBN from bookin join buyorder using (bookRecordID) union select lenderName as buyerName,ISBN from bookin join lendorder using (bookRecordID)")

#basetb的具体表格内容
basetb = cur.fetchmany(basetb_cnt)

#booktb的数据量
booktb_cnt = cur.execute("select ISBN from book");

#booktb的具体表格内容
booktb = cur.fetchmany(booktb_cnt)
for ii in booktb:
    ISBN = ii[0]
    userSet = set()     #存了买过/借过ISBN这本书的用户
    recommendDict = dict()
    for jj in basetb:
        if jj[1] == ISBN:
            userSet.add(jj[0])
    if len(userSet) != 0:    #有用户买了/借了书的ISBN为变量ISBN的书籍
        for userName in userSet:
            for kk in basetb:
                if kk[0] == userName and kk[1] != ISBN:
                    if kk[1] not in recommendDict:
                        recommendDict[kk[1]] = 1
                    else:
                        recommendDict[kk[1]] += 1
    if len(recommendDict) != 0:
        if len(recommendDict) == 1:
            cur.execute("update book set recommend1='" + sorted(recommendDict.items(),key = lambda x:x[1], reverse = True)[0][0] + "',recommend2=null,recommend3=null where ISBN=" + ISBN)
        elif len(recommendDict) == 2:
            cur.execute("update book set recommend1='" + sorted(recommendDict.items(),key = lambda x:x[1], reverse = True)[0][0] + "',recommend2='" + sorted(recommendDict.items(), key = lambda x:x[1], reverse = True)[1][0] + "',recommend3=null where ISBN="+ISBN)
        else:
            cur.execute("update book set recommend1='" + sorted(recommendDict.items(),key = lambda x:x[1], reverse = True)[0][0] + "',recommend2='" + sorted(recommendDict.items(), key = lambda x:x[1], reverse = True)[1][0] + "',recommend3='" + sorted(recommendDict.items, key = lambda x:x[1], reverse = True)[2][0] + "' where ISBN=" + ISBN)
    print "Book " + ISBN + " has been updated. "+str(len(recommendDict))+" book(s) has(have) been recommended."
cur.close()
conn.commit()
conn.close()
