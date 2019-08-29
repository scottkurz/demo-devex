echo 'Installing ci.common lib ....'
git clone https://github.com/wasdev/ci.common.git ./ci.common
cd ./ci.common
mvn clean install
cd ..
git clone https://github.com/dev-tools-for-enterprise-java/boost.git ./boost
cd ./boost
cd boost-common
mvn install -Dinvoker.streamLogs=true
cd ../boost-maven
mvn install -Dinvoker.streamLogs=true
cd ../..