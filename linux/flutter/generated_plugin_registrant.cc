//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <video_player_linux/video_player_linux.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) video_player_linux_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "VideoPlayerLinux");
  video_player_linux_register_with_registrar(video_player_linux_registrar);
}
