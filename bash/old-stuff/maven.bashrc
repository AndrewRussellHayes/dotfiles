#-----------------------
#maven commands
#-----------------------
#maven build, skip tests
mst() { mvn clean install -D maven.test.skip=true -f ~/workspace/data-storage/parent/pom.xml $@; }

#maven generate sources
mgs() { mvn clean generate-sources -f ~/workspace/data-storage/parent/pom.xml $@; }

#maven build clean install
mci() { mvn clean install -f ~/workspace/data-storage/parent/pom.xml $@; }

#maven build, skip tests -with error logging
mste() { mvn clean install -e -D maven.test.skip=true -f ~/workspace/data-storage/parent/pom.xml $@; }

#maven generate sources -with error logging
mgse() { mvn clean generate-sources -e -f ~/workspace/data-storage/parent/pom.xml $@; }

#maven build clean install -with error logging
mcie() { mvn clean install -e -f ~/workspace/data-storage/parent/pom.xml $@; }
