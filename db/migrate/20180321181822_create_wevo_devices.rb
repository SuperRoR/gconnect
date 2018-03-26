class CreateWevoDevices < ActiveRecord::Migration[5.0]
  def change
    create_table :wevo_devices do |t|
      t.integer :wevo_user_id, null: false
      t.string :device_type
      t.string :device_token
      t.string :acc_uname
      t.string :acc_secret
      t.string :acc_auth
      t.string :acc_transport
      t.string :acc_proxy
      t.string :acc_proxy_enable, default: 0
      t.string :acc_reg_expire
      t.string :acc_prefix
      t.string :acc_avpf_enable, default: 0
      t.string :acc_avpf_interval
      t.string :acc_plus_00
      t.string :acc_disableac
      t.string :audio_eco_can_enable
      t.string :audio_adp_rate_enable
      t.string :audio_codec_rate_lim
      t.string :audio_codec
      t.string :video_enable
      t.string :video_always_initiate
      t.string :video_always_accept
      t.string :video_preset
      t.string :video_size
      t.string :video_overlay
      t.string :video_codec
      t.string :call_use_internal_ringtone
      t.string :call_media_encryption
      t.string :call_dtmf_sipinfo_enable
      t.string :call_dtmf_rfc2833_enable
      t.string :call_auto_answer_enable
      t.string :call_vm_uri
      t.string :chat_encrypt_enable
      t.string :chat_share_server
      t.string :net_wifi_only
      t.string :net_dmode_enable
      t.string :net_stun_turn_server
      t.string :net_ice_enable
      t.string :net_turn_enable
      t.string :net_stun_turn_uname
      t.string :net_stun_turn_pass
      t.string :net_rnd_ports_enable
      t.string :net_sip_port
      t.string :net_push_notify_enable
      t.string :net_ipv6_allow
      t.string :adv_flist_subs_enable
      t.string :adv_bg_enable
      t.string :adv_svc_notify_enable
      t.string :adv_boot_start
      t.string :adv_pa_dname
      t.string :adv_pa_uname
      t.string :device_token2

      t.timestamps
    end
  end
end
