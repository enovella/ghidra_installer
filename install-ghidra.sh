#!/bin/sh
echo "Downloading ghidra"
export GHIDRA=`curl -s https://ghidra-sre.org | grep -o -E "ghidra_(.*).zip" | uniq`
export GHIDRAVER=`echo $GHIDRA | grep -o -E "ghidra_(*.).(*.).(*.)"`
wget https://ghidra-sre.org/$GHIDRA
unzip $GHIDRA
./install-jdk.sh
./install-scaling.sh
cp ghidra $GHIDRAVER/
cp ghidra4K $GHIDRAVER/
cp run_scaled $GHIDRAVER/
sudo rm -rf /opt/ghidra
sudo mv $GHIDRAVER /opt/ghidra
cp ghidra.desktop ~/Desktop/ghidra.desktop
cp ghidra.desktop ~/Schreibtisch/ghidra.desktop
cp ghidra4K.desktop ~/Desktop/ghidra4K.desktop
cp ghidra4K.desktop ~/Schreibtisch/ghidra4K.desktop
sudo ln -s /opt/ghidra/ghidra /usr/bin/ghidra
sudo ln -s /opt/ghidra/ghidra4K /usr/bin/ghidra4K
rm $GHIDRA
echo "Successfully installed Ghidra to /opt/ghidra."
echo "Run using: ghidra or ghidra4K"
echo "Edit /opt/ghidra/ghidra4K for other scaling factors than 1.4."

