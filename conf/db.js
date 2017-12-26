use admin;

db.createUser(
	{
		user: "db_admin",
		pwd: "123456",
		roles: [ { role: "userAdminAnyDatabase", db: "admin" } ]
	}
);

use test_db;

db.createUser(
	{
		user: "db_user",
		pwd: "123456",
		roles: [ { role: "userAdminAnyDatabase", db: "test_db" } ]
	}
);