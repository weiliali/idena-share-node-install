#!/bin/bash
echo "   1.install screen      2.install/update node
    3.chmod +x idena-go     4.git idena-node-proxy
       5.npm install   6.ngrok http 80
          7.exchange env 
	     8.npm start   9.pm2 delete idena-node-proxy
	          type in your choose:"
		  read num
		  if [[ "$num" -eq 1 ]];
		  then
			  sudo apt-get update && sudo apt-get upgrade -y
			  sudo apt-get install git npm unzip curl screen -y;
			  bash -c 'echo "{\"IpfsConf\":{\"Profile\": \"server\" ,\"FlipPinThreshold\":1},\"Sync\": {\"LoadAllFlips\": true}}" > config.json'
			  wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
			  unzip ngrok-stable-linux-amd64.zip
        
		  elif [[ "$num" -eq 2 ]];
		  then
			  echo Type in new node version \(eg. 0.19.3\)
			  read version
			  wget https://github.com/idena-network/idena-go/releases/download/v$version/idena-node-linux-$version
			  cp idena-* idena-go

		  elif [[ "$num" -eq 3 ]];
		  then
			  chmod +x idena-go
			  screen -d -m ./idena-go --config=config.json --apikey=123

		  elif [[ "$num" -eq 4 ]];
		  then
			  git clone https://github.com/idena-network/idena-node-proxy
			  npm i -g pm2
			  cd idena-node-proxy

			  bash -c 'echo "AVAILABLE_KEYS=[\"api1\",\"api2\"]
			  IDENA_URL=\"http://localhost:9009\"
			  IDENA_KEY=\"123\"
			  PORT=80" > .env'

		  elif [[ "$num" -eq 5 ]];
		  then
			  cd idena-node-proxy
			  npm install
			  npm start

		  elif [[ "$num" -eq 6 ]];
		  then
			  screen ./ngrok http 80

		  elif [[ "$num" -eq 7 ]];
		  then
			  nano idena-node-proxy/.env

		  elif [[ "$num" -eq 8 ]];
		  then
			  cd idena-node-proxy && npm start

		  elif [[ "$num" -eq 9 ]];
		  then
			  pm2 delete idena-node-proxy
		  fi
