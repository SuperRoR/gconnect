ActiveAdmin.register WevoDevice do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :wevo_user_id, :device_type, :device_token, :acc_uname, :acc_secret, :acc_auth, :acc_transport, :acc_proxy, :acc_proxy_enable, :acc_reg_expire, :acc_prefix, :acc_avpf_enable, :acc_avpf_interval, :acc_plus_00, :acc_disableac, :audio_eco_can_enable, :audio_adp_rate_enable, :audio_codec_rate_lim, :audio_codec, :video_enable, :video_always_initiate, :video_always_accept, :video_preset, :video_size, :video_overlay, :video_codec, :call_use_internal_ringtone, :call_media_encryption, :call_dtmf_sipinfo_enable, :call_dtmf_rfc2833_enable, :call_auto_answer_enable, :call_vm_uri, :chat_encrypt_enable, :chat_share_server, :net_wifi_only, :net_dmode_enable, :net_stun_turn_server, :net_ice_enable, :net_turn_enable, :net_stun_turn_uname, :net_stun_turn_pass, :net_rnd_ports_enable, :net_sip_port, :net_push_notify_enable, :net_ipv6_allow, :adv_flist_subs_enable, :adv_bg_enable, :adv_svc_notify_enable, :adv_boot_start, :adv_pa_dname, :adv_pa_uname, :device_token2
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
