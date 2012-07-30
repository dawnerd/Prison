echo "Building your prison, master...."

coffee --compile --output lib/ src/

echo "Compile complete."

echo "Uglifying"

uglifyjs -v -o lib/prison.min.js lib/prison.js

echo "All done!"