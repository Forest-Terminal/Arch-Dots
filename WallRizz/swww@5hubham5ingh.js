/*
 For:            swww, https://github.com/LGFae/swww
 Author:         https://github.com/5hubham5ingh
 Prerequisite:   swww daemon should be running
*/

export async function setWallpaper(wallpaperPath) {
  const command = createSwwwCommand(
    wallpaperPath,
  );
  await execAsync(command);
  OS.exec(["wal", "-i", `${wallpaperPath}`]);
  //OS.exec(["notify-send", "wal_image_sent"])
}

function createSwwwCommand(imagePath) {
  const command = ["swww", "img", imagePath,"--transition-type", "wipe"];
  return command;
}

