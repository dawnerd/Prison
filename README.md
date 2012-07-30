#Prison

Prevent users from scrolling

### Usage:

    <script src="../lib/prison.js"></script>
    <script>
      //locks the user down
      Prison.enable();

      //frees the user
      Prison.disable();
    </script>

Prison should work cross browser. Please report any issues with compatibility [to the Github prject page](https://github.com/dawnerd/Prison/issues).

### Building:

Prison is written in coffeescript. All code is compiled before checkin and can be found in the ./lib directory. If you wish to manually build your own version, simply run from the project directory.

    coffee --compile --output lib/ src/