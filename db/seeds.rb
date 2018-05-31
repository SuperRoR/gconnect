# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'superadmin@gconnect.com', password: 'password123', password_confirmation: 'password123', is_super_admin: true) if Rails.env.development?
hotel_1 = Hotel.create!(name: "Hotel 1", description: "example hotel one")
hotel_2 = Hotel.create!(name: "Hotel 2", description: "example hotel two")
[hotel_1, hotel_2].each_with_index do |hotel, index|
  hotel.rooms.create!([
                        {room_number: "101", sub_number: 1, status: "checkout", code: SecureRandom.uuid},
                        {room_number: "102", sub_number: 1, status: "checkout", code: SecureRandom.uuid},
                      ])
  hotel.departments.create!([
                            {name: "HouseKeeping"},
                            {name: "Resturant"},
                           ])
  hotel.departments.find_by(name: "HouseKeeping").products.create!([
                      {name: "Shampoo", category_id: 1, price: 6, amount: 100},
                      {name: "Soup", category_id: 1, price: 2, amount: 65},
                      {name: "Towel", category_id: 1, price: 2, amount: 200},
                      {name: "Rinse", category_id: 1, price: 7, amount: 30},
                      {name: "Tissue", category_id: 1, price: 4, amount: 87}
                  ])
  wevo_user1 = WevoUser.create!(wevo_server_id: 1, email: 'test1@gmail.com', user_display_name: 'user1', phone_number: '+85590748240', is_verified: true, extension: '901', auth_token: '1MgQjYCMLPspDZiMKmqjfuF7ojuV7yD3Mb', wevopbx_domain: '113.23.226.22:26060', wevopbx_local_domain: '113.23.226.22:26060', remember_token: '2103', room: hotel.rooms.first)
  wevo_user2 = WevoUser.create!(wevo_server_id: 1, email: 'test2@gmail.com', user_display_name: 'user2', phone_number: '+855977941907', is_verified: true, extension: '900', auth_token: '7E9WOspDZojuV7yD3MbP0T7iMKmqjfuF7', wevopbx_domain: '113.23.226.22:26060', wevopbx_local_domain: '113.23.226.22:26060', remember_token: '2103', room: hotel.rooms.last)

  WevoDevice.create!(device_type: 'ios', device_token: 'eFmREvZ5cms:APA91bFHbngwVHzMePLszRW2n8xpz23kmW5FVtlZrpZ848iJG6ny6BXLdSoZe6qKgpiHiwRx89SFxu8zneY2kYN5N0yhjeH8976E8irr8vyIumivuOdUt-r8JFwTjrRFo_bjNFvm_byg', acc_uname: '15915283125a36c96139', acc_secret: '12289222185a36c96139', acc_auth: '', acc_transport: 'tcp', acc_proxy: '', acc_proxy_enable: '0', acc_reg_expire: '3600', acc_prefix: '', acc_avpf_enable: '0', acc_avpf_interval: '0', acc_plus_00: '0', acc_disableac: '0', audio_eco_can_enable: '0', audio_adp_rate_enable: '1', audio_codec_rate_lim: '36', audio_codec: 'speex16k-speex8k-g7298k', video_enable: '0', video_always_initiate: '1', video_always_accept: '1', video_preset: 'default', video_size: 'qvga', video_overlay: '1', video_codec: 'h264', call_use_internal_ringtone: '1', call_media_encryption: 'None', call_dtmf_sipinfo_enable: '0', call_dtmf_rfc2833_enable: '1', call_auto_answer_enable: '1', call_vm_uri: '*97', chat_encrypt_enable: '0', chat_share_server: 'https://www.linphone.org:444/lft.php', net_wifi_only: '0', net_dmode_enable: '1', net_stun_turn_server: '', net_ice_enable: '0', net_turn_enable: '0', net_stun_turn_uname: '', net_stun_turn_pass: '', net_rnd_ports_enable: '1', net_sip_port: '', net_push_notify_enable: '1', net_ipv6_allow: '1', adv_flist_subs_enable: '0', adv_bg_enable: '1', adv_svc_notify_enable: '1', adv_boot_start: '1', adv_pa_dname: '', adv_pa_uname: '', device_token2: '123123123', wevo_user: wevo_user1)
  WevoDevice.create!(device_type: 'ios', device_token: 'f22554af0944bafe9e9e087368dab04907571017b56361006e74080401163812', acc_uname: '92357975359f26334684', acc_secret: '29355095959f26334686', acc_auth: '', acc_transport: 'tcp', acc_proxy: '', acc_proxy_enable: '0', acc_reg_expire: '3600', acc_prefix: '', acc_avpf_enable: '0', acc_avpf_interval: '0', acc_plus_00: '0', acc_disableac: '0', audio_eco_can_enable: '0', audio_adp_rate_enable: '1', audio_codec_rate_lim: '36', audio_codec: 'g7298k', video_enable: '0', video_always_initiate: '1', video_always_accept: '1', video_preset: 'default', video_size: 'qvga', video_overlay: '1', video_codec: 'h264', call_use_internal_ringtone: '1', call_media_encryption: 'None', call_dtmf_sipinfo_enable: '0', call_dtmf_rfc2833_enable: '1', call_auto_answer_enable: '1', call_vm_uri: '*97', chat_encrypt_enable: '0', chat_share_server: 'https://www.linphone.org:444/lft.php', net_wifi_only: '0', net_dmode_enable: '1', net_stun_turn_server: '', net_ice_enable: '0', net_turn_enable: '0', net_stun_turn_uname: '', net_stun_turn_pass: '', net_rnd_ports_enable: '0', net_sip_port: '25060', net_push_notify_enable: '1', net_ipv6_allow: '1', adv_flist_subs_enable: '0', adv_bg_enable: '0', adv_svc_notify_enable: '1', adv_boot_start: '1', adv_pa_dname: '', adv_pa_uname: '', device_token2: 'c023c178a14e5ad25a61ed1e38abb9656601586a9fe916f871e2103bc0b1281a', wevo_user: wevo_user2)

  hotel.admin_users.create!(email: "hoteladmin_#{index+1}@gconnect.com", password: 'password123', password_confirmation: 'password123') if Rails.env.development?
end
