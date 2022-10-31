# Godot reprojection demo

Proof of concept for reprojecting low framerate viewports into a
high-framerate output. See [this video](https://www.youtube.com/watch?v=f8piCZz0p-Y)
for what this is all about.

**The code here is hacky and not intended to be used as-is.** The math for
compensating horizontal view angle changes is incorrect when looking up or down –
feel free to open a pull request to fix this. Also, to be useful in most real
world projects, this needs to have depth-based reprojection added, so that
reprojection also works when the camera moves.

This demo uses Godot 3.x and GLES3, but the same technique can be applied
to any rendering backend and Godot version.

## License

Copyright © 2022 Hugo Locurcio and contributors

Unless otherwise specified, files in this repository are licensed under the
MIT license. See [LICENSE.md](LICENSE.md) for more information.
