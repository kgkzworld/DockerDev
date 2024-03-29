# Resolve the full path as ~ may not be expanded in scripts
ANACONDA_PATH="$(echo ~/anaconda3/bin)"

# Check if the path is already in the PATH environment variable
if ! echo "$PATH" | grep -q "$ANACONDA_PATH"; then
    # Check if the export command is already in .bashrc
    if ! grep -q "export PATH=\"$ANACONDA_PATH:\$PATH\"" ~/.bashrc; then
        # Append the export command to .bashrc
        echo "export PATH=\"$ANACONDA_PATH:\$PATH\"" >> ~/.bashrc
        echo "Added $ANACONDA_PATH to PATH in .bashrc."
    else
        echo "$ANACONDA_PATH is already in the PATH in .bashrc."
    fi
else
    echo "$ANACONDA_PATH is already in the current PATH."
fi