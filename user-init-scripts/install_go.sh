set +x
set +e

# install go
pixi global install go
echo "export PATH=~/go/bin:\$PATH" | tee -a ~/.bashrc
