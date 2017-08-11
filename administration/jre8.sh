# http://ask.xmodulo.com/set-java_home-environment-variable-linux.html

# install java
yum install -y java-1.8.0-openjdk.x86_64

echo "" ~/.bashrc
echo "" ~/.bashrc
echo "# Set Java" >> ~/.bashrc
export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))

source ~/.bashrc
