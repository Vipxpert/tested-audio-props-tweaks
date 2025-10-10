printf "y\nn\n" | props -r
PROPS_STRING="
vm.laptop_mode=1
vm.swapiness=0
debug.sf.nobootanimation=0
windowsmgr.max_events_per_sec=0
view.scroll_friction=0
# Measure rendering time in adb shell dumpsys gfxinfo
#debug.egl.profiler=1
debug.hwui.renderer.disable_vsync=true
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

# 8 is dull. 1 narrow and dry. 0 luxurious open sound-stage more.
vendor.audio.cpu.sched.cpus=0
# Sibilant
#vendor.audio.cpu.sched=31
# 248 means 0-3
# 255 means 0-7
# Very good one
vendor.audio.cpu.sched.cpuset=255
# Maybe not
#vendor.audio.cpu.sched.cpuset.at=248
# Tasteless. No other trade-off though.
#vendor.audio.cpu.sched.cpuset.af=248
# Dull, muddy
#vendor.audio.cpu.sched.cpuset.hb=248
# Dull, muddy
#vendor.audio.cpu.sched.cpuset.hso=248
# Wide. Slightly more sibilant and tasteless.
#vendor.audio.cpu.sched.cpuset.he=248
# Similarly
#vendor.audio.cpu.sched.cpuset.binder=255
# 0 is tasteless. 23 peak upper mid, narrow sound-stage. 1 narrow sound-stage but extend treble and expand mid imaging (could be placebo).
#vendor.audio.rt.mode=1

# These 2 together with PSD props get rid of the digital-ish sound/noises/artifacts which make the audio sound very real
# Less grainy, smooth, better micro details.
vendor.audio.rt.mode.onlyfast=false
# Smooth, crystal clear, instruments separation and accurate positioning.
vendor.audio.cpu.sched.onlyfast=false

# Enhance low ultra sound (human inaudible frequencies expansion)
# All instruments became more obvious and appear altogether.
ro.vendor.audio.elus.enable=true
# Fuller stereo dynamics (Stereo sound much more obvious for some reasons but it gets warmer and slightly unpleasant when listening with one ear)
vendor.audio.feature.receiver_aided_stereo.enable=true
# Custom stereo effect by vendor (Expand stereo but in a very unnatural way, everything are further away. Didn't test it being alone. Maybe synergy.)
#vendor.audio.feature.custom_stereo.enable=true

# Power Spectral Density (PSD) describes how the total power of a signal is distributed across different frequencies, showing how much power is concentrated at each frequency
#ro.audio.resampler.psd.enable_at_samplerate=768000
# No cut off (hmm)
# 110 is the mod's value. The idea seems to be push cut-off over the limit.
# However 110 drops the dynamic range
# 0 does it better, extend dynamic range
ro.audio.resampler.psd.cutoff_percent=0
# Extend and add sweetness
ro.audio.resampler.psd.tbwcheat=0
# How much unwanted frequencies are suppressed beyond the 179 db cutoff.
# Sound dull maybe because 179 db isn't a good number
#ro.audio.resampler.psd.stopband=179
#ro.vendor.audio.frame_count_needed_constant=32768
#ro.audio.resampler.psd.halfflength=408

# Passing raw format directly to audio outputs. Default value is empty. Other values are compressed formats like aac.
audio.usb.default.format=pcm
persist.audio.flinger.bypass=true
vendor.audio.usb.pcm.direct=true
# Sound brighter. Not a great idea. Settings to 0 make it sounds more raw.
effect.reverb.pcm=0
# Disable dynamic range compression. The trade-off is that phone speakers cannot handle such dynamic range, resulting in limiter kicking in.
audio.drc.enabled=0
# Disable limiter kicking in caused by DRC disabling
vendor.audio.matrix.limiter.enable=0
# Disable compression
vendor.audio.feature.compress_meta_data.enable=false
vendor.audio.feature.compress_in.enable=false
vendor.audio.feature.compr_cap.enable=false
vendor.audio.feature.compr_voip.enable=false
# More treble extension but more dull
vendor.audio.feature.compressed_audio.enable=false
# Enable the compensation step inside the audio HAL / DSP. False for raw. (Having it false sound dull, true then harsh)
#ro.vendor.audio.ce.compensation.need=true
# Codec gain offset. Can only be integers.
# 7 or above will cause a lot of upper mid peaks and lower overall volume a lot.
# 6 is the most lively. Feel like a stadium. The most realistic sound-stage.
# 5 is dull.
# 1, 2, 3, 4 is warmer, thicker.
ro.vendor.audio.ce.compensation.value=6
# Said to increase volume without distortion. MY FKIN EARS AHHHH. Upper mid peaks + nausea.
#persist.audio.hifi.volume=200
# May have done nothing to the sound
#vendor.audio.volume.headset.gain.depcal=true
# Sound-stage is smaller but oddly pleasant. The sound-stage is narrowed down to where exactly the IEM's drivers is.
#vendor.audio.feature.external_dsp.enable=true

#vendor.audio.compress_capture.enabled=false
#vendor.audio.compress_capture.aac=false

# These seem to only work in vendor build.prop
# Remove silly volume warning
audio.safemedia.bypass=true
persist.speaker.prot.enable=false
# Protect the phone speakers from damages. Having it 0 makes the treble spiky.
#persist.config.speaker_protect_enabled=0
#
vendor.audio.feature.spkr_prot.enable=false
# Volume steps
# *preference*
ro.config.media_vol_steps=100
# Enable hardware volume control. Said to avoid clipping and distortion. (Ice-picking treble)
#ro.vendor.audio.gain.support=true

# Seem dry and dull
#vendor.audio.lowpower=false
# Also more dry and dull but less
#vendor.audio.feature.power_mode.enable=true
# A bit more sibilant
#vendor.audio.powerop=true

# Extend dynamic range
#ro.platform.disable.audiorawout=false
ro.vendor.platform.disable.audiorawout=false
# No idea
#persist.audio.uhqa=1
#persist.vendor.audio.uhqa=1


# Idk what this does but it sounds great, maybe placebo
vendor.audio.feature.ext_hw_plugin=true
# HW noise suppression (thinner mid but doesn't ruin the sweetness)
#vendor.audio.feature.dynamic_ecns.enable=true
# Still sweet but there's something else I don't like about it
#vendor.audio.feature.external_qdsp.enable=true
# Still sweet but is it more harsh or it's already it like that before? Not worth anyways
#vendor.audio.feature.source_track_enabled=true
# No idea
#vendor.audio.feature.devicestate_listener.enable=true
# No idea
#vendor.audio.feature.dsm_feedback.enable=true
# Crystal clear
vendor.audio.feature.dmabuf.cma.memory.enable=true
# It's fine
vendor.audio.read.wsatz.type=true
# No idea
vendor.usb.analog_audioacc_disabled=false
# Another crystal clear thing
vendor.audio.sys.init=true
# No idea
#vendor.audio.trace.enable=true
# Mid emphasized too much
#vendor.audio.powerhal.power.ul=true
#vendor.audio.powerhal.power.dl=true
# Not really change the sound
vendor.audio.feature.battery_listener.enable=false
# It tones down the treble. Not entirely tasteless but it gets there.
#vendor.audio.LL.coeff=100
# Unsure
#vendor.audio.caretaker.at=true
# It seems to have unextended my treble lol. Cure the peak in the highs in my IEM though.
#vendor.audio.capture.enforce_legacy_copp_sr=true
# Seem not affect anything
vendor.audio.snd_card.open.retries=50


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
# It's kinda doing nothing? Output remain very clean but it's tasteless
#ro.audio.soundtrigger.lowpower=false
vendor.audio.feature.thermal_listener.enable=false
# Battery current level ignore
persist.vendor.audio.bcl.enabled=false

# May not be supported at all. Intuitively, resampling at such resolution should cause less artifacts. Felt like better but could be placebo. I didn't a/b enough but no harm done.
ro.audio.samplerate=768000
ro.audio.pcm.samplerate=768000
af.resample=768000
# Try preserving multi-channel instead of downsampling to stereo
audio.playback.mch.downsample=false
vendor.audio.playback.mch.downsample=false
persist.vendor.audio.playback.mch.downsample=false

# Don't add 16 or 24-bit configuration here. They override.
# No need of the encoding props here. They simply produce muddy and dark sound in my testings. I don't exactly understand the mechanism behind.
vendor.audio.flac.sw.decoder.32bit=true
vendor.audio.aac.sw.decoder.32bit=true
vendor.audio.mp3.sw.decoder.32bit=true
vendor.audio.raw.sw.decoder.32bit=true
vendor.audio.ac3.sw.decoder.32bit=true
vendor.audio.eac3.sw.decoder.32bit=true
vendor.audio.eac3_joc.sw.decoder.32bit=true
vendor.audio.ac4.sw.decoder.32bit=true
vendor.audio.opus.sw.decoder.32bit=true
vendor.audio.qti.sw.decoder.32bit=true
vendor.audio.dsp.sw.decoder.32bit=true
vendor.audio.dsd.sw.decoder.32bit=true

persist.vendor.audio.format.32bit=true
persist.vendor.audio_hal.dsp_bit_width_enforce_mode=32
# Seem doing nothing
#ro.mediaserver.64b.enable=true

# If true sound like 128 kbps who even
#audio.decoder_override_check=false

# sound dull on both, better set to false
#vendor.audio.use.sw.alac.decoder=false
#vendor.audio.use.sw.ape.decoder=false

# Offload means passing audio processing to DSP instead of CPU, potentially saving power though may not be noticeable. Require testing
# In my case, disabling offloading gives me slightly purer sound and less of the vague and foggy sound.
# If you intend to change offloading flags, be aware of A2DP offloading as well. Bluetooth might be broken and very muddy if you mess things up.
# Offload true, sf hw 1=> EQ works on all apps, some weird old games would crash
# Offload true, sf hw 0 => EQ only works with music player. Stable.
# Offload false, sf hw 1 => EQ works on all apps, no apps crash
# Offload false, sf hw 0 => EQ works on all apps, clean sound
debug.sf.hw=0
audio.offload.enable=false
# Layering this addition offload props cause the treble to sound very broken idk why
# Tried this singly. Seems to be tasteless.
#vendor.audio.offload.enable=false
# Redundant safeguard
audio.offload.disable=true
# Low power audio, theoretically is offload. Set it true and it sounds tasteless. 
persist.vendor.btstack.enable.lpa=false
# Don't change. Settings it to 1 with either offload enabled or disabled causes narrow sound-stage and shrills.
mpq.audio.decode=0
# PCM offload. Don't add 16 or 24-bit configuration here. They override 32-bit and causes terrible peaks and shout.
audio.offload.32bit.enable=false
vendor.audio.offload.32bit.enable=false

# Settings all to true with offload enabled is approved in most mods and community. If offloading's important to you, test for me. The DSP processing on my phone's just isn't my cup of tea maybe. I have a lot better sound-stage and pureness in the sound with the CPU doing it.
# Video/audio offload (test with YouTube, Netflix,...)
audio.offload.video=false
# Mutiple sound sessions (like notification + music) offload. If set to false, the DSP processes only one stream at a time. (Certainly sure this should be off)
audio.offload.multiple.enabled=false
# Enables multiple concurrent AAC streams in offload mode. Useful for systems mixing AAC tracks or picture-in-picture video. Take effect even if offload is disabled. Sound much better if true.
audio.offload.multiaac.enable=true
# Gapless playback. Basically stop the DSP from turning off instantly. Would consume a bit more battery. Doesn't seem to affect the sound.
audio.offload.gapless.enabled=true
# Offload metadata/track handling (it would override offload)
audio.offload.track.enable=false
# Passthrough instead of decoding into PCM before HDMI/USB (it shrills after decoding please keep it true)
audio.offload.passthrough=true
# HAL or DSP update audio calibration/tuning values on the fly (gain tables, EQ filters, speaker protection data) without needing a full audio path restart (warmer but dull)
#persist.vendor.audio.delta.refresh=true
# Unsure
vendor.audio.av.streaming.offload.enable=false

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
# Increase thread priorities for bluetooth
ro.vendor.af.raise_bt_thread_prio=true
# AAC frame control. (Not sure enabling this change anything)
persist.vendor.bt.aac_frm_ctl.enabled=true
# Variable frame control. (Make AAC sounds different. I think this is fine for a codec that does just have worse implementation on Android than IOS)
persist.vendor.bt.aac_vbr_frm_ctl.enabled=true
# No aac compression
vendor.audio.compress_capture.aac.cut_off_freq=0
# Simply add treble, dull
#persist.vendor.qcom.bluetooth.aac_frm_ctl.enabled=true
#persist.vendor.qcom.bluetooth.aac_vbr_ctl.enabled=true
# Adaptive bit-rate, disable for highest quality connection always. (badly increase upper mid peaks a lot, dull)
#persist.bluetooth.a2dp_aac_abr.enable=false
# The standard TWSP allows passing audio to 2 channels at the same time instead of one earbud to another. Consider 2 devices as one.
# Enable TWSP (expand the sound-stage but unnatural)
#persist.vendor.btstack.enable.twsplus=true
# Single/secondary headset operation? Idk  (the mid and high are much more clean but hurt my ears, less natural as well)
# Should be enabled along with TWSP enabler
#persist.vendor.btstack.enable.twsplussho=true
# State management. Disable to avoid TWSP interferences. (Lose bass and sound-stage if set to true even when non-TWS devices)
persist.vendor.qcom.bluetooth.twsp_state.enabled=false
# Not part of the standard Android AOSP or Qualcomm documented flags (ice-picking treble)
#persist.vendor.bluetooth.connection_improve=yes
# Master – the phone controls the timing of the connection and the piconet.
# Slave – the phone follows the master’s clock/timing.
#persist.vendor.bluetooth.prefferedrole=master

# Enable A2DP (this part will do wonders to your bluetooth audio)
audio.effect.a2dp.enable=1
vendor.audio.effect.a2dp.enable=1
# Vendor specific. Required to fully enable A2DP.
vendor.audio.feature.a2dp_offload.enable=false
# Expand A2DP to all codec. AAC sounds especially good and even better than LDAC now.
persist.bt.a2dp.aptx_disable=false
persist.bt.a2dp.aptx_hd_disable=false
persist.bt.a2dp.aac_disable=false
# Required for AAC to sound like magic
persist.vendor.bt.a2dp.aac_whitelist=false
# What's mac? (possibly sound very bad)
#persist.vendor.bt.a2dp.mac_whitelist=false
# Putting codecs that are not supported in here somehow cause a2dp to not work
#persist.vendor.btstack.a2dp_offload_cap=sbc-aptx-aptxtws-aptxhd-aptxadaptiver2-aac-ldac-lhdc
persist.vendor.bt.a2dp_offload_cap=sbc-aptx-aptxtws-aptxhd-aac-ldac
# The same settings can be found in developer option \"Disable A2DP hardware offload\"
# If you have the master switch audio offload enabled. Don't disable a2dp offload. It'll make the audio to be insanely muddy and unbearable. Or else having offload disabled all together makes the sound to be extremely clean.
# Changing codec or connecting bluetooth when a track is playing will cause audio to leak to the phone speakers. You'll just need to replay they song so they come back to bluetooth.
# You can prevent that by pausing the song before reconnecting.
persist.bluetooth.a2dp_offload.disabled=true
# Enables split A2DP processing, which separates codec handling. There might be some ice-picking treble added, also sound slightly dull and unnatural.
#persist.vendor.btstack.enable.splita2dp=true
# Work-around (war) for 44.1 which basically EQ to migitate the weird ice-picking treble mentioned. Which happens without split A2DP enabled as well? (Even more dull sadly)
#persist.vendor.bt.splita2dp.44_1_war=true
# Communicate with \"Wireless Speaker Amplifier\" (sound dull)
#vendor.audio.feature.wsa.enable=true
# For LE audio to treat TWS as one single devices (Add tons of head spaces but a bit more dull.)
#ro.vendor.bluetooth.csip_qti=true
# The modern AIDL instead of HIDL for modern codecs. It's already default nowadays. (More details without obvious trade-off, not my preference though)
#persist.vendor.qcom.bluetooth.aidl_hal=true
# Cross-Channel monitors R/L channels to adjust for avoiding issues like imbalance or distortion (dull)
#persist.vendor.audio.cca.enabled=false
# Disables or minimizes SBC (fallback codec) bitpool allocation. Maybe more dull but can be placebo.
#persist.bluetooth.a2dp.sbc_bitpool=0
# LDAC adaptive bit-rate (doesn't work)
#vendor.bluetooth.ldac.abr=false

# VR capability
persist.audio.vr.enable=true
debug.enable-vr-mode=0

# Gain is adapted to impedence and regions
#vendor.audio.volume.headset.gain.depcal=true
# HAL suspended instead of full restart for effieciency
vendor.audio.hal.output.suspend.supported=true
vendor.audio.feature.keep_alive.enable=true

# Quality recording
#audio.record.delay=0
# Device allows DSD hi-res audio playback at the same time as voice/VoIP calls.
vendor.voice.dsd.playback.conc.disabled=false
# HDR recording
vendor.audio.hdr.record.enable=true
#vendor.audio.hdr.spf.record.enable=true
vendor.audio.3daudio.record.enable=true
ro.vendor.audio.recording.hd=true
ro.ril.enable.amr.wideband=1
persist.audio.lowlatency.rec=true
vendor.audio.feature.audiozoom.enable=true
# 360 audio recording
persist.vendor.audio.ambisonic.capture=true
persist.vendor.audio.ambisonic.auto.profile=true
persist.vendor.audio.endcall.delay=0
#persist.vendor.audio.record.ull.support=true
#vendor.audio.chk.cal.us=1





# Enables internal codec for HiFi in core audio.
# These interact with each other in a very weird way. Some don't have good synergy with another.
# 1,2,3 is a good start for sweet and magical sound

# May increase CPU load if not hardware-accelerated. It makes the sounds tasteless I don't like it. (1)
persist.audio.hifi.int_codec=false
# I thought it's supposed to do the same thing but it makes the overall sound sweet and pleasant for some reasons. (2)
persist.vendor.audio.hifi.int_codec=true
# Sweet and clean (add a bit of upper mid peak though) (3)
audio.feature.hifi_audio.enable=true

# Tied to vendor HAL. Defaults to false. Allows high-resolution audio playback. (Expand sound-stage, does not have good synergy with 1,2,3,12) (4)
vendor.audio.feature.hifi_audio.enable=true

# Higher sample rates and reducing jitter (Cleaner signal) (5)
ro.hardware.hifi.support=true

# (I find these to add a tons more instrument seperation to the sound) (6)
#ro.audio.hifi=true
# (7)
persist.audio.hifi=true
# (8)
#ro.vendor.audio.hifi=true
# (9)
persist.vendor.audio.hifi=true

# 67 bad, 78 ok, 89 ok, 789 bad
# 68 is good, sweet and clean, 689 not as much, 69 is better than the rest for now, very spacious
# 679 is also sweet, spacious, but a bit peaky
# 79 solve the peaky. It's perfect.

# Sound darn analytic but tasteless (10)
# Shrilling af when combined with 1,2,3,4,5,7,9
#ro.config.hifi_enhance_support=1
# Expand sound-stage and tasteless. (11) 11 and 12 has very good synergy together create very separated mid but narrow sound-stage.
#persist.vendor.audio.hifi_enabled=true
# Every instruments sound focused on the mix at the same time. The mid is very thin and on top of the head however. (12)
#ro.config.hifi_config_state=1
# Balance out 1,2,3,12 quite a lot, fresh mid if 10 and 11 weren't enabled (13)
# With 1, 2, 3, 4, 5, 6, 7, 8, 9, 12 then thin mid
#persist.audio.hifi_adv_support=1
# Too thin
#vendor.audio.usb.super_hifi=true
# Ruined the sweetness, dull sound
#persist.audio.hifi_dac=ON

# Use more DSP power for voice recognition (no idea maybe fine)
persist.vendor.audio.sva.conc.enabled=true
# Why's this very dull? Lol
#persist.vendor.audio.okg_hotword_ext_dsp=true
# Keeps the voice-activation engine active even when other audio sessions are running
# Sound more dull but the treble details are kinda nuts
#persist.vendor.audio.va_concurrency_enabled=true
# Wide-band speech for voice and assistance (im unsure but it doesnt feel right)
#vendor.media.audiohal.btwbs=true
# Can't pin point the differences maybe placebo. Commented out.
#ro.vendor.audio.enhance.support=true
# Same
#ro.vendor.audio.spk.clean=true
# Seem fine
ro.vendor.audio.pastandby=true
# Dynamic platform for DTS? (dull, tasteless)
#ro.vendor.audio.dpaudio=true
# Why?
#ro.vendor.audio.spk.stereo=true
# Analog to digital. I can't hear the effects. Better leave default.
#ro.vendor.audio.dualadc.support=false
# Honestly no idea
#ro.vendor.audio.meeting.mode=true
# No idea
#persist.audio.hp=true
# Did nothing
#ro.vendor.platform.has.realoutputmode=true
# Not sure if changed anything. NR noise reduction? NS noise suppression?
#ro.vendor.audio_tunning.nr=1
# Do no harm
ro.vendor.audio.ns.support=true
# No idea. Seem to darken the treble.
#ro.vendor.media.support.omx2=true
# Probaly ok (or placebo)
#persist.sys.audio.source=true
# Why?
#persist.vendor.audio.speaker.stereo=true
# Seem to work? Or maybe placebo. Seem to have more resolution.
ro.vendor.usb.support_analog_audio=true

# Idk
vendor.qc2audio.suspend.enabled=false
# Dull
#vendor.qc2audio.per_frame.flac.dec.enabled=true
media.stagefright.thumbnail.prefer_hw_codecs=true
ro.vendor.audio_tunning.dual_spk=1
# Low latency (unsure)
#persist.vendor.audio.ll_playback_bargein=true

# Hot words activation
ro.vendor.audio.soundtrigger.adjconf=true
# Ok google with DSP if true
#ro.audio.soundtrigger.lowpower=false

# Expose Surround Sound Recording
ro.vendor.audio.sdk.ssr=false
ro.qc.sdk.audio.ssr=false
persist.camera.HAL3.enabled=1
camera.HAL3.enabled=1
persist.camera.is_mode=4
#camera.eis.enable=1
burn_in_protection=1
vendor.audio.camera.unsupport_low_latency=false
# Disable recording and playback run at the same time.
vendor.audio.rec.playback.conc.disabled=false
vendor.voice.record.conc.disabled=false
# Disable call and playback run at the same time
vendor.voice.playback.conc.disabled=false
vendor.voice.voip.conc.disabled=false
#vendor.voice.path.for.pcm.voip=primary

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
persist.sys.sf.native_mode=1
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









# Ignored
PLACE_HOLDER="
ro.audio.ignore_effects=true
ro.vendor.audio.ignore_effects=true
vendor.audio.ignore_effects=true
persist.audio.ignore_effects=true
persis.vendor.audio.ignore_effects=true
persist.sys.phh.disable_audio_effects=1
ro.audio.disable_audio_effects=1
vendor.audio.disable_audio_effects=1
low.pass.filter=Off
midle.pass.filter=Off
high.pass.filter=Off
band.pass.filter=Off
LPF=Off
MPF=Off
HPF=Off
BPF=Off

ro.vendor.audio.sfx.speaker=false
ro.vendor.audio.sfx.earadj=false
ro.vendor.audio.sfx.scenario=false
ro.vendor.audio.sfx.audiovisual=false
ro.vendor.audio.sfx.independentequalizer=false
vendor.audio.soundfx.usb=false
ro.vendor.audio.soundfx.usb=false
ro.vendor.soundfx.type=none
ro.vendor.audio.soundfx.type=none
persist.sys_phh.disable_audio_effects=1
persist.sys.phh.disable_soundvolume_effect=1
ro.audio.spatializer_enabled=false
persist.vendor.audio.sfx.hd.eq=0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000
persist.audio.fluence.voicecomm=false
ro.vendor.audio.gain.support=false
ro.vendor.audio.soundfx.type=none
ro.vendor.audio.sfx.earadj=false
ro.vendor.audio.sfx.scenario=false
ro.vendor.audio.soundfx.usb=false
ro.vendor.audio.surround.headphone.only=false


# HW acceleration maybe (false is better and it adds a lot better instrument positioning though sound duller)
use.non-omx.flac.decoder=false
use.non-omx.aac.decoder=false
use.non-omx.mp3.decoder=false
use.non-omx.raw.decoder=false
use.non-omx.qti.decoder=false
use.non-omx.ac3.decoder=false
use.non-omx.ac4.decoder=false
use.non-omx.opus.decoder=false
use.non-omx.dsp.decoder=false
use.non-omx.dsd.decoder=false

# Indeed sound more high quality. Like it has more resolution to the air and treble but dull.
vendor.audio.flac.quality=100
vendor.audio.aac.quality=100
vendor.audio.mp3.quality=100
vendor.audio.raw.quality=100
vendor.audio.ac3.quality=100
vendor.audio.eac3.quality=100
vendor.audio.eac3_joc.quality=100
vendor.audio.ac4.quality=100
vendor.audio.opus.quality=100
vendor.audio.qti.quality=100
vendor.audio.dsp.quality=100
vendor.audio.dsd.quality=100

vendor.audio.flac.sw.encoder.32bit=true
vendor.audio.aac.sw.encoder.32bit=true
vendor.audio.mp3.sw.encoder.32bit=true
vendor.audio.raw.sw.encoder.32bit=true
vendor.audio.ac3.sw.encoder.32bit=true
vendor.audio.eac3.sw.encoder.32bit=true
vendor.audio.eac3_joc.sw.encoder.32bit=true
vendor.audio.ac4.sw.encoder.32bit=true
vendor.audio.opus.sw.encoder.32bit=true
vendor.audio.qti.sw.encoder.32bit=true
vendor.audio.dsp.sw.encoder.32bit=true
vendor.audio.dsd.sw.encoder.32bit=true

flac.sw.decoder.32bit.support=true
aac.sw.decoder.32bit.support=true
mp3.sw.decoder.32bit.support=true
raw.sw.decoder.32bit.support=true
ac3.sw.decoder.32bit.support=true
eac3.sw.decoder.32bit.support=true
eac3_joc.sw.decoder.32bit.support=true
ac4.sw.decoder.32bit.support=true
opus.sw.decoder.32bit.support=true
qti.sw.decoder.32bit.support=true
dsp.sw.decoder.32bit.support=true
dsd.sw.decoder.32bit.support=true

flac.sw.encoder.32bit.support=true
aac.sw.encoder.32bit.support=true
mp3.sw.encoder.32bit.support=true
raw.sw.encoder.32bit.support=true
ac3.sw.encoder.32bit.support=true
eac3.sw.encoder.32bit.support=true
eac3_joc.sw.encoder.32bit.support=true
ac4.sw.encoder.32bit.support=true
opus.sw.encoder.32bit.support=true
qti.sw.encoder.32bit.support=true
dsp.sw.encoder.32bit.support=true
dsd.sw.encoder.32bit.support=true

# Compression efficiency, the higher the more dense the data. Can be 10, 100, 1000,... It's always sound too analystic and tasteless
vendor.audio.flac.complexity.default=10
vendor.audio.aac.complexity.default=10
vendor.audio.mp3.complexity.default=10
vendor.audio.qti.complexity.default=10
vendor.audio.ac3.complexity.default=10
vendor.audio.eac3.complexity.default=10
vendor.audio.eac3_joc.complexity.default=10
vendor.audio.ac4.complexity.default=10
vendor.audio.opus.complexity.default=10
vendor.audio.dsp.complexity.default=10
vendor.audio.dsd.complexity.default=10

# No test no trust, just better leave default
# Minimum track length (in seconds) for offload. Short sounds (notifications, ringtones) stay on CPU to avoid DSP overhead.
audio.offload.min.duration.secs=15
# Size of DSP buffer for offload streams. Larger buffer = smoother playback but more latency.
audio.offload.buffer.size.kb=64
# 192 256 480 1024 4096. Buffering size.
audio_hal.period_size=192
vendor.audio.hal.boot.timeout.ms=5000
# Adds a fixed delay so that the Bluetooth stack has more “headroom” to avoid audio dropouts / stutter, underrun pops or clicks
persist.vendor.audio.sys.a2h_delay_for_a2dp=50

# In the dev settings
persist.vendor.btsatck.absvolfeature=false

# Microsoft smooth streaming. Deprecated.
#mm.enable.smoothstreaming=true
#vendor.mm.en.sec.smoothstreaming=true"

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

settings put global audio_safe_volume_state 0

resetprop -p --delete media.resolution.limit.16bit
resetprop -p --delete media.resolution.limit.24bit
resetprop -p --delete media.resolution.limit.32bit

resetprop -p --delete audio.resolution.limit.16bit
resetprop -p --delete audio.resolution.limit.24bit
resetprop -p --delete audio.resolution.limit.32bit

reboot
exit