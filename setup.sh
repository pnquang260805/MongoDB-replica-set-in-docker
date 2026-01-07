#/bin/bash
until mongosh --host $PRIMARY_HOST --port $PRIMARY_PORT --eval "db.runCommand({ ping: 1 })" --quiet; do
    echo "Waiting for MongoDB primary to be available..."
    sleep 5
done
echo ============================================
echo Starting setup replica set
echo ============================================

echo $PRIMARY_HOST
mongosh "mongodb://$PRIMARY_HOST:$PRIMARY_PORT" -u "$MONGO_USERNAME" -p "$MONGO_PASSWORD" <<EOF
var config = {
  "_id": "rs0",
  "version": 1,
  "members": [
    {
      "_id": 1,
      "host": "$PRIMARY_HOST:$PRIMARY_PORT",
      "priority": 3
    },
    {
      "_id": 2,
      "host": "$SECONDARY_1_HOST:$SECONDARY_1_PORT",
      "priority": 2
    },
    {
      "_id": 3,
      "host": "$SECONDARY_2_HOST:$SECONDARY_2_PORT",
      "priority": 1
    }
  ]
};

rs.initiate(config, { force: true });
rs.status();
EOF

echo ============================================