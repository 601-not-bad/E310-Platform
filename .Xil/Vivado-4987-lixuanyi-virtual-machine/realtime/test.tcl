# 
# Synthesis run script generated by Vivado
# 

namespace eval rt {
    variable rc
}
set rt::rc [catch {
  uplevel #0 {
    set ::env(BUILTIN_SYNTH) true
    source $::env(HRT_TCL_PATH)/rtSynthPrep.tcl
    rt::HARTNDb_resetJobStats
    rt::HARTNDb_resetSystemStats
    rt::HARTNDb_startSystemStats
    rt::HARTNDb_startJobStats
    set rt::cmdEcho 0
    rt::set_parameter writeXmsg true
    rt::set_parameter enableParallelHelperSpawn true
    set ::env(RT_TMP) "./.Xil/Vivado-4987-lixuanyi-virtual-machine/realtime/tmp"
    if { [ info exists ::env(RT_TMP) ] } {
      file delete -force $::env(RT_TMP)
      file mkdir $::env(RT_TMP)
    }

    rt::delete_design

    set rt::partid xc7a35ticsg324-1L
     file delete -force synth_hints.os

    set rt::multiChipSynthesisFlow false
    source $::env(SYNTH_COMMON)/common_vhdl.tcl
    set rt::defaultWorkLibName xil_defaultlib

    set rt::useElabCache false
    if {$rt::useElabCache == false} {
      rt::read_verilog -sv -include /home/lixuanyi/int_cir_comp/vivado-proj/E310/E310.srcs/sources_1/ip/mmcm /disk_2/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv
      rt::read_verilog -include /home/lixuanyi/int_cir_comp/vivado-proj/E310/E310.srcs/sources_1/ip/mmcm {
      /home/lixuanyi/int_cir_comp/vivado-proj/E310/E310.srcs/sources_1/ip/mmcm/mmcm_clk_wiz.v
      /home/lixuanyi/int_cir_comp/vivado-proj/E310/E310.srcs/sources_1/ip/mmcm/mmcm.v
      /home/lixuanyi/int_cir_comp/vivado-proj/E310/E310.srcs/sources_1/imports/int_cir_comp/rocket-chip/src/main/resources/vsrc/AsyncResetReg.v
      /home/lixuanyi/int_cir_comp/vivado-proj/E310/E310.srcs/sources_1/imports/e300artydevkit/PowerOnResetFPGAOnly.v
      /home/lixuanyi/int_cir_comp/vivado-proj/E310/E310.srcs/sources_1/imports/int_cir_comp/freedom/sifive-blocks/vsrc/SRLatch.v
      /home/lixuanyi/int_cir_comp/vivado-proj/E310/E310.srcs/sources_1/imports/int_cir_comp/rocket-chip/src/main/resources/vsrc/plusarg_reader.v
      /home/lixuanyi/int_cir_comp/vivado-proj/E310/E310.srcs/sources_1/imports/int_cir_comp/freedom/builds/e300artydevkit/sifive.freedom.everywhere.e300artydevkit.E300ArtyDevKitConfig.rom.v
      /home/lixuanyi/int_cir_comp/vivado-proj/E310/E310.srcs/sources_1/imports/int_cir_comp/freedom/builds/e300artydevkit/sifive.freedom.everywhere.e300artydevkit.E300ArtyDevKitConfig.v
      /home/lixuanyi/int_cir_comp/vivado-proj/E310/E310.srcs/sources_1/imports/e300artydevkit/sifiveTestbench.v
    }
      rt::read_vhdl -lib lib_cdc_v1_0_2 /home/lixuanyi/int_cir_comp/vivado-proj/E310/E310.srcs/sources_1/ip/reset_sys/hdl/lib_cdc_v1_0_rfs.vhd
      rt::read_vhdl -lib proc_sys_reset_v5_0_13 /home/lixuanyi/int_cir_comp/vivado-proj/E310/E310.srcs/sources_1/ip/reset_sys/hdl/proc_sys_reset_v5_0_vh_rfs.vhd
      rt::read_vhdl -lib xil_defaultlib /home/lixuanyi/int_cir_comp/vivado-proj/E310/E310.srcs/sources_1/ip/reset_sys/synth/reset_sys.vhd
      rt::read_vhdl -lib xpm /disk_2/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd
      rt::filesetChecksum
    }
    rt::set_parameter usePostFindUniquification false
    set rt::top test
    rt::set_parameter enableIncremental true
    set rt::reportTiming false
    rt::set_parameter elaborateOnly true
    rt::set_parameter elaborateRtl true
    rt::set_parameter eliminateRedundantBitOperator false
    rt::set_parameter elaborateRtlOnlyFlow true
    rt::set_parameter writeBlackboxInterface true
    rt::set_parameter merge_flipflops true
    rt::set_parameter srlDepthThreshold 3
    rt::set_parameter rstSrlDepthThreshold 4
# MODE: 
    rt::set_parameter webTalkPath {}
    rt::set_parameter enableSplitFlowPath "./.Xil/Vivado-4987-lixuanyi-virtual-machine/"
    set ok_to_delete_rt_tmp true 
    if { [rt::get_parameter parallelDebug] } { 
       set ok_to_delete_rt_tmp false 
    } 
    if {$rt::useElabCache == false} {
        set oldMIITMVal [rt::get_parameter maxInputIncreaseToMerge]; rt::set_parameter maxInputIncreaseToMerge 1000
        set oldCDPCRL [rt::get_parameter createDfgPartConstrRecurLimit]; rt::set_parameter createDfgPartConstrRecurLimit 1
        $rt::db readXRFFile
      rt::run_rtlelab -module $rt::top
        rt::set_parameter maxInputIncreaseToMerge $oldMIITMVal
        rt::set_parameter createDfgPartConstrRecurLimit $oldCDPCRL
    }

    set rt::flowresult [ source $::env(SYNTH_COMMON)/flow.tcl ]
    rt::HARTNDb_stopJobStats
    if { $rt::flowresult == 1 } { return -code error }


  set hsKey [rt::get_parameter helper_shm_key] 
  if { $hsKey != "" && [info exists ::env(BUILTIN_SYNTH)] && [rt::get_parameter enableParallelHelperSpawn] } { 
     $rt::db killSynthHelper $hsKey
  } 
  rt::set_parameter helper_shm_key "" 
    if { [ info exists ::env(RT_TMP) ] } {
      if { [info exists ok_to_delete_rt_tmp] && $ok_to_delete_rt_tmp } { 
        file delete -force $::env(RT_TMP)
      }
    }

    source $::env(HRT_TCL_PATH)/rtSynthCleanup.tcl
  } ; #end uplevel
} rt::result]

if { $rt::rc } {
  $rt::db resetHdlParse
  set hsKey [rt::get_parameter helper_shm_key] 
  if { $hsKey != "" && [info exists ::env(BUILTIN_SYNTH)] && [rt::get_parameter enableParallelHelperSpawn] } { 
     $rt::db killSynthHelper $hsKey
  } 
  source $::env(HRT_TCL_PATH)/rtSynthCleanup.tcl
  return -code "error" $rt::result
}
