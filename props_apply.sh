printf "y\nn\n" | props -r
PROPS_STRING="
# This version is fully stable and tested on Realme Q5 Pro and Motorola Edge 30 Ultra
# Carefully tested props tweaks for clean, immersive, correctly positioned audio and extras.
# It would fix cheap DACs sounding harsh. Or grainy vocal you usually find from your phone speakers.
# Also bring bluetooth audio very closed to wired bit-perfect audio. Fixed issues with the AAC sounding worse than SBC. LDAC also will be spicy and lack bass no more. Also with less latency now!
# This mod gain me trust with the Harman target. Turn out the shoutiness was never from the target itself.
# That said it doesn't come without one bug is that changing codec or connecting bluetooth while a track is playing causes the audio to leak to the phone speaker for some reason.
# Inspired by Audio Misc Settings and Audio Resamplerate Magisk modules. This mod is easy to control and with using Android's factory's flags, it's pretty much compatible with any devices.
# For details on how this mod works, it's recommend that you read my test reports carefully before making any changes. Be responsible.
# Most of the descriptions are for what the props does when they're set to true.

# The result is finalize with AB testing with a group of 4 audiophile friends of mine. Proven with tremendous impression and enjoyments! They do feel like in the luxury!
# I've experiences with audio devices at 500$ grade, broke quite a lot of IEMs and speakers while modding and tinkering for credits haha. That amount of money cannot brings this kind of experience.
# I've spent 20 total hours to exhaustive test these flags. However I couldn't test all of the combinations and cases. However, this's a very stable implementation of it.
# Words are just words until you try this out for yourself!

# Guide
# Gain root access with \"su\" then paste the entire script in Termux after installing the MagiskHidePropsConf module
# In case of wanting to fallback, use \"props -r\"

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
# Not officially documented.
persist.sys.sf.gamma=1

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
# Disable compression
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

# May not be supported at all. Intuitively, resampling at such resolution should cause less artifacts. Felt like better but could be placebo. I didn't a/b enough but no harm done.
ro.audio.samplerate=768000
ro.audio.pcm.samplerate=768000
af.resample=768000
# Try preserving multi-channel instead of downsampling to stereo
audio.playback.mch.downsample=false
vendor.audio.playback.mch.downsample=false
persist.vendor.audio.playback.mch.downsample=false

# Don't add 16 or 24-bit configuration here. They override.
vendor.audio.flac.sw.decoder.32bit=true
flac.sw.decoder.32bit.support=true
vendor.audio.aac.sw.decoder.32bit=true
persist.vendor.audio.format.32bit=true
persist.vendor.audio_hal.dsp_bit_width_enforce_mode=32

# Offload means passing audio processing to DSP instead of CPU, potentially saving power though may not be noticeable. Require testing
# In my case, disabling offloading gives me slightly purer sound and less of the vague and foggy sound.
# If you intend to change offloading flags, be aware of A2DP offloading as well. Bluetooth might be broken and very muddy if you mess things up.
# Offload true, sf hw 1=> EQ works on all apps, some weird old games would crash
# Offload true, sf hw 0 => EQ only works with music player. Stable.
# Offload false, sf hw 1 => EQ works on all apps, some weird old games would crash
# Offload false, sf hw 0 => EQ works on all apps, no apps crash, clean sound
debug.sf.hw=0
audio.offload.enable=false
vendor.audio.offload.enable=false
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
# Variable frame control. No idea no harm done.
persist.vendor.bt.aac_vbr_frm_ctl.enabled=true
persist.vendor.qcom.bluetooth.aac_frm_ctl.enabled=true
persist.vendor.qcom.bluetooth.aac_vbr_ctl.enabled=true
# The standard TWSP allows passing audio to 2 channels at the same time instead of one earbud to another. It's on by default. Disable to avoid interferences.
persist.vendor.qcom.bluetooth.twsp_state.enabled=false

# Enable A2DP (this part will do wonders to your bluetooth audio)
audio.effect.a2dp.enable=1
vendor.audio.effect.a2dp.enable=1
Vendor specific. Required to fully enable A2DP.
vendor.audio.feature.a2dp_offload.enable=false
# Expand A2DP to all codec. AAC sounds especially good and even better than LDAC now.
persist.bt.a2dp.aptx_disable=false
persist.bt.a2dp.aptx_hd_disable=false
persist.bt.a2dp.aac_disable=false
# Required for AAC to sound like magic
persist.vendor.bt.a2dp.aac_whitelist=false
persist.vendor.bt.a2dp_offload_cap=sbc-aptx-aptxtws-aptxhd-aac-ldac
# The same settings can be found in developer option \"Disable A2DP hardware offload\"
# If you have the master switch audio offload enabled. Don't disable a2dp offload. It'll make the audio to be insanely muddy and unbearable. Or else having offload disabled all together makes the sound to be extremely clean.
# Changing codec or connecting bluetooth when a track is playing will cause audio to leak to the phone speakers. You'll just need to replay they song so they come back to bluetooth.
# You can prevent that by pausing the song before reconnecting.
persist.bluetooth.a2dp_offload.disabled=true

# These seem to only work in vendor build.prop
# Remove silly volume warning
audio.safemedia.bypass=true
persist.speaker.prot.enable=false
# Protect the phone speakers from damages. Settings to 0 is susected to distort bass.
#persist.config.speaker_protect_enabled=0
vendor.audio.feature.spkr_prot.enable=false
# Volume steps
ro.config.media_vol_steps=50
# Enable hardware volume control volume. Said to avoid clipping and distortion. Unable to test.
ro.vendor.audio.gain.support=true

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
# Tied to vendor HAL. Defaults to false. Allows high-resolution audio playback. (More instrument seperation)
vendor.audio.feature.hifi_audio.enable=true
# May increase CPU load if not hardware-accelerated. It makes the sounds tasteless I don't like it.
persist.audio.hifi.int_codec=false
# I thought it's supposed to do the same thing but it makes the overall sound sweet and pleasant for some reasons.
persist.vendor.audio.hifi.int_codec=true
# Higher sample rates and reducing jitter (Crisp and clean highs)
ro.hardware.hifi.support=true
# Reduce latency, distortion for wired. Has no direct tie to official HiFi standards. (Crisp and clean highs)
audio.feature.hifi_audio.enable=true
# Supports high-res formats (I find this to add a tons more instrument seperation to the sound)
ro.audio.hifi=true
ro.vendor.audio.hifi=true
persist.audio.hifi=true
persist.vendor.audio.hifi=true







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





# Ignored
PLACE_HOLDER="
# Adaptive bit-rate, disable for highest quality connection always.
persist.bluetooth.a2dp_aac_abr.enable=false
# Wide-band speech for voice and assistance
#vendor.media.audiohal.btwbs=true

# Recently added, not fully tested

# Disables or minimizes SBC (fallback codec) bitpool allocation, forcing the stack to prefer high-bitrate LDAC instead of dropping to SBC during negotiation. This indirectly locks LDAC at 990 kbps by reducing fallback incentives.
persist.bluetooth.a2dp.sbc_bitpool=0
# Enables split A2DP processing, which separates codec handling and can stabilize high-bitrate LDAC by optimizing packet transmission. Helps maintain 990 kbps even under moderate interference.
persist.vendor.btstack.enable.splita2dp=true




# Use more DSP power for voice recognition
persist.vendor.audio.sva.conc.enabled=true
persist.vendor.audio.okg_hotword_ext_dsp=true
# Keeps the voice-activation engine active even when other audio sessions are running
persist.vendor.audio.va_concurrency_enabled=true

# For LE audio to treat TWS as one single devices
ro.vendor.bluetooth.csip_qti=true

# Enable TWS plus for TWS devices
persist.vendor.btstack.enable.twsplussho=true
persist.vendor.btstack.enable.twsplus=true

# Master – the phone controls the timing of the connection and the piconet.
# Slave – the phone follows the master’s clock/timing.
persist.vendor.bluetooth.prefferedrole=master

# Not part of the standard Android AOSP or Qualcomm documented flags
persist.vendor.bluetooth.connection_improve=yes

# A fix invented (not by me) to prevent weird high pitch when using A2DP with 44.1kHz
persist.vendor.bt.splita2dp.44_1_war=true
# The modern AIDL instead of HIDL for modern codecs. It's already default nowadays.
#persist.vendor.qcom.bluetooth.aidl_hal=true

# HAL or DSP update audio calibration/tuning values on the fly (gain tables, EQ filters, speaker protection data) without needing a full audio path restart
#persist.vendor.audio.delta.refresh=true
# Adds a fixed delay so that the Bluetooth stack has more “headroom” to avoid audio dropouts / stutter, underrun pops or clicks
#persist.vendor.audio.sys.a2h_delay_for_a2dp=50

#
vendor.audio.av.streaming.offload.enable=false
vendor.audio.offload.track.enable=false
vendor.audio.offload.multiple.enabled=false
# Disable recording and playback run at the same time.
vendor.audio.rec.playback.conc.disabled=true

vendor.audio.usb.super_hifi=true
ro.config.hifi_config_state=1
ro.config.hifi_enhance_support=1
persist.audio.hifi_adv_support=1
persist.audio.hifi_dac=ON
persist.vendor.audio.hifi_enabled=true

# Cross-Channel monitors R/L channels to adjust for avoiding issues like imbalance or distortion
persist.vendor.audio.cca.enabled=false
# Enable the compensation step inside the audio HAL / DSP. False for raw.
ro.vendor.audio.ce.compensation.need=true
# Gain offset
#ro.vendor.audio.ce.compensation.value=5




# AAC is processed in DSP
#qcom.hw.aac.encoder=false
#qcom.hw.aac.decoder=false
#ro.vendor.audio.hw.aac.encoder=false
#ro.vendor.audio.hw.aac.decoder=false
#vendor.audio.hw.aac.encoder=true
#persist.service.btui.use_aptx=1
#persist.bt.enableAptXHD=true

vendor.voice.path.for.pcm.voip=
vendor.voice.playback.conc.disabled=
vendor.voice.record.conc.disabled=
vendor.voice.voip.conc.disabled=

vendor.audio.use.sw.alac.decoder=true
vendor.audio.use.sw.ape.decoder=true
aac_adts_offload_enabled=false
alac_offload_enabled=false
ape_offload_enabled=false
flac_offload_enabled=false
qti_flac_decoder=false
vorbis_offload_enabled=false
wma_offload_enabled=false

ro.vendor.af.raise_bt_thread_prio=true
audio.decoder_override_check=true
vendor.qc2audio.suspend.enabled=false
vendor.qc2audio.per_frame.flac.dec.enabled=true
media.stagefright.thumbnail.prefer_hw_codecs=true

vendor.audio.feature.dsm_feedback.enable=true
vendor.audio.feature.ext_hw_plugin.enable=true
vendor.audio.feature.compress_meta_data.enable=false
vendor.audio.feature.compr_cap.enable=false
vendor.audio.feature.devicestate_listener.enable=false
vendor.audio.feature.thermal_listener.enable=false
vendor.audio.feature.power_mode.enable=true
vendor.audio.feature.keep_alive.enable=true
vendor.audio.feature.deepbuffer_as_primary.enable=false
vendor.audio.feature.dmabuf.cma.memory.enable=true
vendor.audio.feature.compress_in.enable=false
vendor.audio.feature.battery_listener.enable=false
vendor.audio.feature.custom_stereo.enable=true
vendor.audio.feature.wsa.enable=true

audio.spatializer.effect.util_clamp_min=300
effect.reverb.pcm=1
sys.vendor.atmos.passthrough=enable
ro.vendor.audio.elus.enable=true
ro.vendor.audio.3d.audio.support=true
ro.vendor.audio.surround.support=true
ro.vendor.audio.dolby.eq.half=true
ro.vendor.audio.dolby.surround.enable=true
ro.vendor.audio.dolby.fade_switch=true
ro.vendor.media.video.meeting.support=true

vendor.usb.analog_audioacc_disabled=false
vendor.audio.sys.init=true
vendor.audio.trace.enable=true
vendor.audio.powerop=true
vendor.audio.read.wsatz.type=true
vendor.audio.powerhal.power.ul=true
vendor.audio.powerhal.power.dl=true
vendor.audio.hal.boot.timeout.ms=5000
vendor.audio.LL.coeff=100
vendor.audio.caretaker.at=true
vendor.audio.matrix.limiter.enable=0
vendor.audio.capture.enforce_legacy_copp_sr=true
vendor.audio.hal.output.suspend.supported=false
vendor.audio.snd_card.open.retries=50
vendor.audio.volume.headset.gain.depcal=true
vendor.audio.camera.unsupport_low_latency=false
vendor.audio.lowpower=false
vendor.audio.compress_capture.enabled=false
vendor.audio.compress_capture.aac=false
vendor.audio.rt.mode=23
vendor.audio.rt.mode.onlyfast=false
vendor.audio.cpu.sched=31
vendor.audio.cpu.sched.cpuset=248
vendor.audio.cpu.sched.cpuset.binder=255
vendor.audio.cpu.sched.cpuset.at=248
vendor.audio.cpu.sched.cpuset.af=248
vendor.audio.cpu.sched.cpuset.hb=248
vendor.audio.cpu.sched.cpuset.hso=248
vendor.audio.cpu.sched.cpuset.he=248
vendor.audio.cpu.sched.cpus=8
vendor.audio.cpu.sched.onlyfast=false

vendor.media.audio.ms12.downmixmode=on
ro.audio.resampler.psd.enable_at_samplerate=192000
ro.audio.resampler.psd.cutoff_percent=110
ro.audio.resampler.psd.stopband=179
ro.audio.resampler.psd.halfflength=408
ro.audio.resampler.psd.tbwcheat=110
ro.audio.soundtrigger.lowpower=false
ro.vendor.audio_tunning.dual_spk=1
ro.vendor.audio_tunning.nr=1
ro.vendor.audio.frame_count_needed_constant=32768
ro.vendor.audio.soundtrigger.wakeupword=5

# Enhancement effects like DTS
ro.vendor.audio.enhance.support=true

ro.vendor.audio.spk.clean=true
ro.vendor.audio.pastandby=true
ro.vendor.audio.dpaudio=true
ro.vendor.audio.spk.stereo=true
ro.vendor.audio.dualadc.support=true
ro.vendor.audio.meeting.mode=true
ro.vendor.media.support.omx2=true
ro.vendor.platform.disable.audiorawout=false
ro.vendor.platform.has.realoutputmode=true
ro.vendor.usb.support_analog_audio=true
ro.mediaserver.64b.enable=true
persist.audio.hp=true
persist.sys.audio.source=true

persist.vendor.audio.misoundasc=true

persist.vendor.audio.speaker.stereo=true

#vendor.audio.aac.sw.decoder.32bit=true
#vendor.audio.flac.sw.decoder.32bit=true
vendor.audio.mp3.sw.decoder.32bit=true
vendor.audio.ac3.sw.decoder.32bit=true
vendor.audio.eac3.sw.decoder.32bit=true
vendor.audio.eac3_joc.sw.decoder.32bit=true
vendor.audio.ac4.sw.decoder.32bit=true
vendor.audio.opus.sw.decoder.32bit=true
vendor.audio.qti.sw.decoder.32bit=true
vendor.audio.dsp.sw.decoder.32bit=true
vendor.audio.dsd.sw.decoder.32bit=true
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
vendor.audio.flac.complexity.default=10
vendor.audio.flac.quality=100
vendor.audio.aac.complexity.default=10
vendor.audio.aac.quality=100
vendor.audio.mp3.complexity.default=10
vendor.audio.mp3.quality=100
vendor.audio.qti.complexity.default=10
vendor.audio.qti.quality=100
vendor.audio.ac3.complexity.default=10
vendor.audio.ac3.quality=100
vendor.audio.eac3.complexity.default=10
vendor.audio.eac3.quality=100
vendor.audio.eac3_joc.complexity.default=10
vendor.audio.eac3_joc.quality=100
vendor.audio.ac4.complexity.default=10
vendor.audio.ac4.quality=100
vendor.audio.opus.complexity.default=10
vendor.audio.opus.quality=100
vendor.audio.dsp.complexity.default=10
vendor.audio.dsp.quality=100
vendor.audio.dsd.complexity.default=10
vendor.audio.dsd.quality=100
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
use.non-omx.flac.encoder=false
use.non-omx.aac.encoder=false
use.non-omx.mp3.encoder=false
use.non-omx.raw.encoder=false
use.non-omx.qti.encoder=false
use.non-omx.ac3.encoder=false
use.non-omx.ac4.encoder=false
use.non-omx.opus.encoder=false
use.non-omx.dsp.encoder=false
use.non-omx.dsd.encoder=falsevendor.audio.mp3.sw.decoder.32bit=true
vendor.audio.ac3.sw.decoder.32bit=true
vendor.audio.eac3.sw.decoder.32bit=true
vendor.audio.eac3_joc.sw.decoder.32bit=true
vendor.audio.ac4.sw.decoder.32bit=true
vendor.audio.opus.sw.decoder.32bit=true
vendor.audio.qti.sw.decoder.32bit=true
vendor.audio.dsp.sw.decoder.32bit=true
vendor.audio.dsd.sw.decoder.32bit=true
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
vendor.audio.flac.complexity.default=10
vendor.audio.flac.quality=100
vendor.audio.aac.complexity.default=10
vendor.audio.aac.quality=100
vendor.audio.mp3.complexity.default=10
vendor.audio.mp3.quality=100
vendor.audio.qti.complexity.default=10
vendor.audio.qti.quality=100
vendor.audio.ac3.complexity.default=10
vendor.audio.ac3.quality=100
vendor.audio.eac3.complexity.default=10
vendor.audio.eac3.quality=100
vendor.audio.eac3_joc.complexity.default=10
vendor.audio.eac3_joc.quality=100
vendor.audio.ac4.complexity.default=10
vendor.audio.ac4.quality=100
vendor.audio.opus.complexity.default=10
vendor.audio.opus.quality=100
vendor.audio.dsp.complexity.default=10
vendor.audio.dsp.quality=100
vendor.audio.dsd.complexity.default=10
vendor.audio.dsd.quality=100
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
use.non-omx.flac.encoder=false
use.non-omx.aac.encoder=false
use.non-omx.mp3.encoder=false
use.non-omx.raw.encoder=false
use.non-omx.qti.encoder=false
use.non-omx.ac3.encoder=false
use.non-omx.ac4.encoder=false
use.non-omx.opus.encoder=false
use.non-omx.dsp.encoder=false
use.non-omx.dsd.encoder=false

# No test no trust, just better leave default

# Said to increase volume without distortion.
#persist.audio.hifi.volume=100
#persist.audio.hifi.volume=1
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
# Noise supression
#ro.vendor.audio.ns.support=true
# Low latency
#persist.vendor.audio.ll_playback_bargein=true
# Battery current level ignore
#persist.vendor.audio.bcl.enabled=false
# Expose Surround Sound Recording
#ro.vendor.audio.sdk.ssr=false
#ro.qc.sdk.audio.ssr=false
# Lock LDAC to highest bit-rate (doesn't work)
vendor.bluetooth.ldac.abr=false"


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
























