# modules/pipewire-tuning.nix
# Fine-tuning PipeWire settings for smoother audio 🎶
{ pkgs, ... }:

{
  # Tell PipeWire to load our custom settings
  services.pipewire.configPackages = [
    (pkgs.writeTextDir "share/pipewire/pipewire.conf.d/99-latency-tuning.conf" ''
      # Increase buffer sizes (quantum) to reduce xruns
      context.properties = {
        default.clock.quantum = 1024      # Default is often 512 or lower
        default.clock.min-quantum = 1024  # Force a minimum size
        # default.clock.max-quantum = 2048 # Optional: set a max if needed
      }

      # You might also need to adjust ALSA periods if the above isn't enough
      # context.modules = [
      #   { name = "libpipewire-module-protocol-native" args = { } }
      #   { name = "libpipewire-module-profiler" args = { } }
      #   { name = "libpipewire-module-settings" args = { } }
      #   { name = "libpipewire-module-metadata" args = { } }
      #   { name = "libpipewire-module-protocol-pulse" args = { } }
      #   {
      #     name = "libpipewire-module-alsa-sink"
      #     args = {
      #       # Increase ALSA period size
      #       node.latency = "1024/48000" # Try 1024 first, maybe 2048 if needed
      #       # api.alsa.period-size = 1024
      #     }
      #   }
      # ]
    '')
  ];
} 