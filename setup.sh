echo "Clone and install boost"
git clone https://github.com/MicroShed/boost.git ./boost
cd ./boost && git pull && cd boost-common && mvn install -Dinvoker.streamLogs=true && cd ../boost-maven && mvn install -Dinvoker.streamLogs=true && cd ../..
