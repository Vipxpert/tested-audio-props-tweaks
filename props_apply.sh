PROPS_STRING="
# Gain root access with "su" then paste the entire script in Termux after installing the MagiskHidePropsConf module
# In case of wanting to fallback, use "props -r"

vm.laptop_mode=1
vm.swapiness=0
debug.sf.nobootanimation=0
windowsmgr.max_events_per_sec=0
view.scroll_friction=0
# Measure rendering time in adb shell dumpsys gfxinfo
#debug.egl.profiler=1
debug.hwui.renderer.disable_vsync = true
debug.hwui.disable_vsync=true
hwui.disable_vsync=true
debug.cpurend.vsync=false
debug.hwc.force_gpu_vsync=0
debug.egl.swapinterval=0
debug.enabletr=false
hwui.render_dirty_regions=true
debug.gr.swapinterval=0
#3
debug.gr.numframebuffers=0
#framebuffer
ro.fb.mode=0
#hw
debug.composition.type=mdp
persist.sys.composition.type=mdp
persist.hwc.mdpcomp.enable=true
hw3d.force=1
hw2d.force=1
persist.sys.ui.hw=1
ro.config.disable.hw_accel=false
video.accelerate.hw=1
#0 all layer go to surfaceflinger instead of direct (stable)
ro.sf.compbypass.enable=1
#ro.surface_flinger.vsync_event_phase_offset_ns=
#ro.surface_flinger.vsync_sf_event_phase_offset_ns=
debug.sf.frame_rate_multiple_threshold=120
#boost
#debug.performance.tuning=1
#debug.performance.profile=1
debug.sf.scroll_boost_refreshrate=144
debug.sf.touch_boost_refreshrate=120
persist.vendor.max.brightness=-1
ro.HOME_APP_ADJ=1
debug.hwui.profile=true
boot.fps=60
ro.config.hw_quickpoweron=true
# disable touch below =60 pixels
mot.proximity.distance=0
touch.size.bias=0
touch.size.scale=1
ro.input.resampling=0
#ro.global.block_untrusted_touches=0

# Do not change. Would cause overheat and battery drain.
debug.egl.hw=1
# Dyn CPU sampling instead of fixed sampling
persist.dev.pm.dyn_samplingrate=1
dev.pm.dyn_samplingrate=1

# Default is 2.
# 0 minimizes buffering duration, results in reduced phase shifting, removes the wobbly stereo positioning effect to make the sound positions where they should be. Overall make the audio experience much more luxurious and spacious. At risk of CPU overrun on low-end devices however.
vendor.audio.adm.buffering.ms=0
# Passing raw format directly to audio outputs. Default value is empty. Other values are compressed formats like aac.
audio.usb.default.format=pcm
persist.audio.flinger.bypass=true
vendor.audio.usb.pcm.direct=true
# Disable dynamic range compression. The trade-off is that phone speakers cannot handle such dynamic range, resulting in limiter kicking in.
audio.drc.enabled=0
# Disable limiter kicking in caused by DRC disabling
vendor.audio.matrix.limiter.enable=0
# Disable data compression
vendor.audio.feature.compress_meta_data.enable=false
vendor.audio.feature.compress_in.enable=false
vendor.audio.feature.compr_cap.enable=false
vendor.audio.feature.compr_voip.enable=false

# 0 - 2 (default) - 4 - 7. Default is 2. This one is truely wholesome.
af.resampler.quality=7
persist.af.resampler.quality=7
af.thread.throttle=0
lpa.decode=false
lpa30.decode=false
lpa.releaselock=false
lpa.use-stagefright=false
tunnel.audio.encode=false
qc.tunnel.audio.encode=false
tunnel.audiovideo.decode=false
tunnel.decode=false
vendor.audio.tunnel.encode=false
lpa.deepbuffer.enable=0

# May not be supported at all. Intuitively resampling at such resolution should cause less artifacts. Felt like better but could be placebo. I didn't a/b enough but no harm done.
ro.audio.samplerate=768000
ro.audio.pcm.samplerate=768000
af.resample=768000
audio.playback.mch.downsample=false
vendor.audio.playback.mch.downsample=false
persist.vendor.audio.playback.mch.downsample=false

# Don't add 16 or 24-bit configuration here. They override.
vendor.audio.flac.sw.decoder.32bit=true
flac.sw.decoder.32bit.support=true
vendor.audio.aac.sw.decoder.32bit=true
persist.vendor.audio.format.32bit=true
persist.vendor.audio_hal.dsp_bit_width_enforce_mode=32

# Try preserving multi-channel instead of downsampling to stereo
persist.vendor.audio.playback.mch.downsample=false

# Offload means passing audio processing to DSP instead of CPU, potentially saving power though may not be noticeable. Require testing
# Offload true, sf hw 1=> EQ works on all apps, some weird old games would crash
# Offload true, sf hw 0 => EQ only works with music player. Stable
# Offload false, sf hw 1 => EQ works on all apps, no apps crash
# Offload false, sf hw 0 => EQ works on all apps, no apps crash, clean sound
debug.sf.hw=0
audio.offload.enable=false
vendor.audio.offload.enable=false
# Don't change. Settings it to 1 with either offload enabled or disabled causes narrow sound-stage and shrills.
mpq.audio.decode=0
# Redundant safeguard
audio.offload.disable=true
# PCM offload. Don't add 16 or 24-bit configuration here. They override 32-bit and causes terrible peaks and shout.
audio.offload.32bit.enable=false
vendor.audio.offload.32bit.enable=false

# Offload settings, only take effect if offload is enabled in my tests. Flipping these switches don't make any changes.
# Generally these flags settings to true is approved in most mods and community. If offloading's important to you, test for me. The DSP processing on my phone's just isn't my cup of tea maybe. I have a lot better sound-stage and pureness in the sound with the CPU doing it.
# Video/audio offload (test with YouTube, Netflix,...)
audio.offload.video=true
# Passthrough (disable decode before HDMI/USB)
audio.offload.passthrough=true
# Mutiple sound sessions (like notification + music) offload. If set to false, the DSP processes only one stream at a time.
audio.offload.multiple.enabled=true
# Enables multiple concurrent AAC streams in offload mode. Useful for systems mixing AAC tracks or picture-in-picture video.
audio.offload.multiaac.enable=true
# Gapless in offload (no effect since offload is disabled anyway)
audio.offload.gapless.enabled=true
# Offload metadata/track handling
audio.offload.track.enable=true

# Higher quality and does not have extra processing compared to the deep_buffer output (didn't a/b, did no harm anyways)
audio.deep_buffer.media=false
vendor.audio.deep_buffer.media=false
vendor.audio.feature.deepbuffer_as_primary.enable=false
qc.audio.deep_buffer.media=false
ro.qc.audio.deep_buffer.media=false
persist.vendor.audio.deep_buffer.media=false
media.stagefright.audio.deep=false

# SBC HD. Useless but does no harm anyways.
persist.bt.sbc_hd_enabled=1
persist.bluetooth.sbc_hd_higher_bitrate=1
# AAC frame control. Similar stuffs.
persist.vendor.bt.aac_frm_ctl.enabled=true
# A source warned me about this props breaking something but currently doing no harm?
persist.vendor.bt.aac_vbr_frm_ctl.enabled=true
persist.vendor.qcom.bluetooth.aac_frm_ctl.enabled=true
persist.vendor.qcom.bluetooth.aac_vbr_ctl.enabled=true
# Disables true wireless stereo plus state. Reduces interference in multi-device setups. (I didn't test this on my TWS yet. Might not so important eh?)
persist.vendor.qcom.bluetooth.twsp_state.enabled=false

# Remove silly volume warning
audio.safemedia.bypass=true
persist.speaker.prot.enable=false
vendor.audio.feature.spkr_prot.enable=false
# 100 volume steps
ro.config.media_vol_steps=100

# VR capability
persist.audio.vr.enable=true
debug.enable-vr-mode=0

# Gain is adapted to impedence and regions
#vendor.audio.volume.headset.gain.depcal=true
# HAL suspended instead of full restart for effieciency
vendor.audio.hal.output.suspend.supported=true
vendor.audio.feature.keep_alive.enable=true
vendor.audio.feature.thermal_listener.enable=false

# Quality recording
# Device allows DSD hi-res audio playback at the same time as voice/VoIP calls.
vendor.voice.dsd.playback.conc.disabled=false
vendor.audio.hdr.record.enable=true
vendor.audio.3daudio.record.enable=true
ro.vendor.audio.recording.hd=true
ro.ril.enable.amr.wideband=1
persist.audio.lowlatency.rec=true
vendor.audio.feature.audiozoom.enable=true

# Enables internal codec for HiFi in core audio.
# May increase CPU load if not hardware-accelerated. It makes the sounds tasteless I don't like it.
persist.audio.hifi.int_codec=false
# I thought it's supposed to do the same thing but it makes the overall sound sweet and pleasant for some reasons.
persist.vendor.audio.hifi.int_codec=true
# Higher sample rates and reducing jitter (Unsure if it took effect but apparently no harm done)
ro.hardware.hifi.support=true
# Reduce latency, distortion for wired. Has no direct tie to official HiFi standards. (Neither did this)
audio.feature.hifi_audio.enable=true
# Supports high-res formats (I find this to add a tons more instrument seperation to the sound)
ro.audio.hifi=true
ro.vendor.audio.hifi=true
persist.audio.hifi=true
persist.vendor.audio.hifi=true
# Tied to vendor HAL. Defaults to false. Allows high-resolution audio playback. (Additional instrument seperation)
vendor.audio.feature.hifi_audio.enable=true


# No test no trust or just better leave default


# Said to increase volume without distortion.
#persist.audio.hifi.volume=100
# Minimum track length (in seconds) for offload. Short sounds (notifications, ringtones) stay on CPU to avoid DSP overhead.
#audio.offload.min.duration.secs=15
# Size of DSP buffer for offload streams. Larger buffer = smoother playback but more latency.
#audio.offload.buffer.size.kb=64
# 192 256 480 1024 4096. Buffering size.
#audio_hal.period_size=192

# Expansion of the capabilities of the DSP module.
#vendor.audio.capture.enforce_legacy_copp_sr=true
#vendor.audio.feature.dynamic_ecns.enable=true
#vendor.audio.feature.external_dsp.enable=true
#vendor.audio.feature.external_qdsp.enable=true
#vendor.audio.feature.external_speaker.enable=true
#vendor.audio.feature.external_speaker_tfa.enable=true
#vendor.audio.feature.receiver_aided_stereo.enable=true
#vendor.audio.feature.ext_hw_plugin=true
#vendor.audio.feature.source_track_enabled=true
#
#vendor.audio.feature.devicestate_listener.enable=false
#vendor.audio.feature.power_mode.enable=true
# Hot words activation
#ro.vendor.audio.soundtrigger.adjconf=true
# Hot words DSP
#ro.audio.soundtrigger.lowpower=false
#vendor.audio.snd_card.open.retries=50
# HAL or DSP update audio calibration/tuning values on the fly (gain tables, EQ filters, speaker protection data) without needing a full audio path restart
#persist.vendor.audio.delta.refresh=true
# Noise supression
#ro.vendor.audio.ns.support=true
#ro.vendor.audio.enhance.support=true
#ro.vendor.audio.gain.support=true
# Low latency
#persist.vendor.audio.ll_playback_bargein=true
# Battery current level ignore
#persist.vendor.audio.bcl.enabled=false


#ro.config.hw_dts=true
#ro.config.hw_dolby=true
#audio.dolby.ds2.enabled=true

# Microsoft smooth streaming. Deprecated.
#mm.enable.smoothstreaming=true
#vendor.mm.en.sec.smoothstreaming=true

persist.camera.HAL3.enabled=1
camera.HAL3.enabled=1
persist.camera.is_mode=4
#camera.eis.enable=1
burn_in_protection=1

dalvik.vm.lockprof.threshold=8192
#ENFORCE_PROCESS_LIMIT=false
#increase RAM usage
dalvik.vm.jmiopts=forcecopy
ro.config.dha_tunnable=1
#compromise security
dalvik.vm.check-dex-sum=false
dalvik.vm.verify-bytecode=false
ro.config.low_ram=false
ro.config.small_battery=true


# stability fix when enabling RTSP
media.stagefright.enable-record=false
media.stagefright.enable-rtsp=true
ro.ril.hsdpa.category=28
#ro.ril.hsdpa.category=14
ro.ril.hsupa.category=6
ro.ril.hsxpa=5

ro.display.brightness.brightness.mode=1
persist.sys.sf.native_mode=0
#persist.vendor.dc_backlight.enable=true

ro.config.hw_power_saving=1
persist.radio.add_power_save=1
ro.ril.sensor.sleep.control=1
qcom.bt.le_dev_pwr_class=1
power.saving.mode=1
ro.ril.fast.dormancy.rule=0
#0 idle yes
ro.ril.disable.power.collapse=''
ro.ril.power_collapse=''
#  0:Power Collapse Suspend 
#  1:Power Collapse (Provides best power savings: will totally power off the cpu);
#  2:Apps Sleep (cpu is still on, but put into low power mode)
#  3:Slow Clock and Wait for Interrupt (default): slow Clock and Wait for Interrupt (lowered frequency and voltage)
#  4:Wait for Interrupt (no change in cpu clock or voltage) 
pm.sleep_mode=''

log_datapath=0
log_audiooutput=0
log_surfaceoutput=0
log_omxmp4=0
log_ao=0
log_fps_interval=0
debug_test=0
log_mp4parsernode=0
log_basedecnode=0
log_audiodecnode=0
log_videodecnode=0
log_outputnode=0
log_outputnodeinputport=0
log.pm4mem=0
log.cffdump_with_ifh=0                 
log.cffdump_no_memzero=0       
log.dumpx=0 
log.primitives=0
log.resolves=0
log.pm4=0
log_metadatadriver=0
log_playerengine=0
log_frame_info=0
log_mp4dectime=0
log_posttime=0
log_profile=0
log_playerdriver=0
log.shaders=0
log.sc_dev=0
log.cffdump=0
persist.sys.lmk.reportkills=false
ro.lmk.debug=false
ro.lmk.log_stats=false
sys.lmk.reportkills=false
vendor.vidc.debug.level=0
vidc.debug.level=0
persist.traced_perf.enable=0
persist.traced.enable=0
ro.config.nocheckin=1
ro.kernel.android.checkjni=0
ro.kernel.checkjni=0
profiler.force_disable_ulog=true
profiler.force_disable_ulog=1
profiler.force_disable_err_rpt=1
profiler.force_disable_err_rpt=true
profiler.hung.dumpdobugreport=false
debugtool.anrhistory=0
debug.mdpcomp.logs=0
profiler.debugmonitor=false
profiler.launch=false
logcat.live=disable
persist.android.strictmode=0
debug.system.thermal=0
debug.thermal.enable=false
debug.thermal.disable=true
ro.tether.denied=false
debug.mdpcomp.logs=0
persist.android.strictmode=0"

# Loop through each line of the string
echo "$PROPS_STRING" | while IFS= read -r line; do
  # Skip lines starting with '#'
  if [[ "$line" == \#* ]]; then
    continue
  fi

  # Skip empty lines
  if [ -z "$line" ]; then
    continue
  fi

  # Check if the line contains an '=' character
  if ! echo "$line" | grep -q '='; then
    echo "Skipping invalid line (no '=' found): $line"
    continue
  fi

  # Split the line into key and value
  key=$(echo "$line" | cut -d'=' -f1)
  value=$(echo "$line" | cut -d'=' -f2-) # -f2- ensures we get the rest of the line if value itself contains '='

  # Trim whitespace (optional, but good practice)
  key=$(echo "$key" | xargs)
  value=$(echo "$value" | xargs)

  # Check if key or value is empty after splitting (e.g., line was just "=")
  if [ -z "$key" ] || [ -z "$value" ]; then
    echo "Skipping invalid line (empty key or value): $line"
    continue
  fi

  echo "Executing: resetprop \"$key\" \"$value\""
  resetprop "$key" "$value"

done

exit