echo "Clone and install ci.ant"
git clone https://github.com/OpenLiberty/ci.ant.git 
cd ci.ant && git pull && mvn clean install -DskipTests && cd ..

echo "Clone and install ci.common"
git clone https://github.com/wasdev/ci.common.git ./ci.common
cd ./ci.common && git pull && mvn clean install && cd ..

echo "Clone and install ci.maven"
git clone https://github.com/OpenLiberty/ci.maven.git
cd ci.maven && git pull && mvn clean install && cd ..

echo "Clone and install boost"
git clone https://github.com/MicroShed/boost.git ./boost
cd ./boost && git pull && cd boost-common && mvn install -Dinvoker.streamLogs=true && cd ../boost-maven && mvn install -Dinvoker.streamLogs=true && cd ../..
