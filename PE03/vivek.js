conn = new Mongo("localhost:27017");
db = conn.getDB("SampleSocial");
coll = db.getCollection("Tweets");

//Query 1
print("Task 1:Inserting a record");
result = coll.insert({id:20150910, fromUser:"Vivek Panchal", text:"This is a test of insert",cnt:1});
printjson(result); 

//Query 2
print("Task 2:Displaying result in JSON format");
qresult = coll.find({id:20150910});
printjson(qresult.next());

//Query 3
print("Task 3:Updating a record");
result = coll.update({id:20150910}, {$set:{text:"This is the updated text"}}); 
print(result);

//Query 4
print("Task 4:Displaying id and text of updated record");
cursor = coll.find({id:20150910});
doc = cursor.next();
print(doc.id,doc.text);

//Query 5
print("Task 5:Incrementing count by 1");
result=coll.update({id:20150910},{$inc:{cnt:1}});
printjson(result);

//Query 6
print("Task 6:Rerun Query 2");
qresult = coll.find({id:20150910});
printjson(qresult.next());

//Query 7
print("Task 7:Tweets that have an id between 129745 and 129756");
cursor=coll.find({$and:[{id:{$gte:129745}},{id:{$lte:129756}}]});
while(cursor.hasNext()){
	doc=cursor.next();
	print(doc.text);
}

//Query 8
print("Task 8:Removing Record");
result = coll.remove({id:{$eq:20150910}});
print(result);
