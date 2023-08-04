import 'package:flutter/material.dart';
import 'package:music_streaming_mobile/helper/common_import.dart';

class ThemeIconWidget extends StatelessWidget {
  final ThemeIcon icon;
  final double? size;
  final Color? color;

  const ThemeIconWidget(this.icon, {Key? key, this.size, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getIcon(context);
  }

  Widget getIcon(BuildContext context) {
    switch (icon) {
      case ThemeIcon.home:
        return Icon(
          Icons.home_max_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.home1:
        return Icon(
          Icons.home_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );

      case ThemeIcon.cart:
        return Icon(
          Icons.shopping_cart_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.setting:
        return Icon(
          Icons.settings_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.search:
        return Icon(
          Icons.search,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.downArrow:
        return Icon(
          Icons.keyboard_arrow_down,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.upArrow:
        return Icon(
          Icons.keyboard_arrow_up,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.star:
        return Icon(
          Icons.star_border,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.checkMark:
        return Icon(
          Icons.check,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.edit:
        return Icon(
          Icons.edit_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.filterIcon:
        return Icon(
          Icons.filter_alt_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.sort:
        return Icon(
          Icons.sort,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.logout:
        return Icon(
          Icons.logout_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.review:
        return Icon(
          Icons.library_books_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );

      case ThemeIcon.circle:
        return Icon(
          Icons.circle,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.fav:
        return Icon(
          Icons.favorite_border_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.favFilled:
        return Icon(
          Icons.favorite,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.close:
        return Icon(
          Icons.close,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.checkMarkWithCircle:
        return Icon(
          Icons.check_circle_outline,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.security:
        return Icon(
          Icons.security,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.bike:
        return Icon(
          Icons.delivery_dining_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.clock:
        return Icon(
          Icons.timer,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.offer:
        return Icon(
          Icons.local_offer_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.orders:
        return Icon(
          Icons.list_alt_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.account:
        return Icon(
          Icons.person_outline,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.privacyPolicy:
        return Icon(
          Icons.policy_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.info:
        return Icon(
          Icons.info,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.terms:
        return Icon(
          Icons.verified_user_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.add:
        return Icon(
          Icons.add,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.addCircle:
        return Icon(
          Icons.add_circle,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.selectedRadio:
        return Icon(
          Icons.radio_button_checked,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.unSelectedRadio:
        return Icon(
          Icons.radio_button_off_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.more:
        return Icon(
          Icons.more_horiz,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.wallet:
        return Icon(
          Icons.account_balance_wallet,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.dashboard:
        return Icon(
          Icons.dashboard,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.nextArrow:
        return Icon(
          Icons.arrow_forward_ios_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.backArrow:
        return Icon(
          Icons.arrow_back_ios,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.menuIcon:
        return Icon(
          Icons.menu,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );


      case ThemeIcon.email:
        return Icon(
          Icons.email_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.reveal:
        return Icon(
          Icons.visibility_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.hide:
        return Icon(
          Icons.visibility_off_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.mobile:
        return Icon(
          Icons.phone_enabled_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );

      case ThemeIcon.name:
        return Icon(
          Icons.person_outline,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );

      case ThemeIcon.notification:
        return Icon(
          Icons.notifications_none,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );

      case ThemeIcon.discount:
        return Icon(
          Icons.local_offer_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.share:
        return Icon(
          Icons.share_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );

      case ThemeIcon.copyToClipboard:
        return Icon(
          Icons.copy_all_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.addressType:
        return Icon(
          Icons.location_city_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.plus:
        return Icon(
          Icons.add,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.minus:
        return Icon(
          Icons.remove,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );

      case ThemeIcon.addressPin:
        return Icon(
          Icons.location_on_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.avatar:
        return Icon(
          Icons.person_outline,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.card:
        return Icon(
          Icons.credit_card,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );

      case ThemeIcon.thumbsUp:
        return Icon(
          Icons.thumb_up_alt_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.mic:
        return Icon(
          Icons.mic_none_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.book:
        return Icon(
          Icons.library_books_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.helpHand:
        return Icon(
          Icons.live_help_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.about:
        return Icon(
          Icons.info_outline,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );

      case ThemeIcon.play:
        return Icon(
          Icons.play_arrow,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.pause:
        return Icon(
          Icons.pause_circle_filled,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.playNext:
        return Icon(
          Icons.skip_next_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.music:
        return Icon(
          Icons.library_music,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.addMusic:
        return Icon(
          Icons.music_note_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.playlists:
        return Icon(
          Icons.featured_play_list_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.delete:
        return Icon(
          Icons.delete_outline,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.message:
        return Icon(
          Icons.message_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.closeCircle:
        return Icon(
          Icons.highlight_remove_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );

      case ThemeIcon.bathTub:
        return Icon(
          Icons.bathtub_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.bed:
        return Icon(
          Icons.bed_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.area:
        return Icon(
          Icons.calculate_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.send:
        return Icon(
          Icons.send,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );

      case ThemeIcon.bookMark:
        return Icon(
          Icons.bookmark,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.buildings:
        return Icon(
          Icons.home_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.map:
        return Icon(
          Icons.map_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.news:
        return Icon(
          Icons.list_alt_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.whatsapp:
        return Icon(
          Icons.message_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.report:
        return Icon(
          Icons.report_problem_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.explore:
        return Icon(
          Icons.explore_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.block:
        return Icon(
          Icons.block,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );

      case ThemeIcon.moreVertical:
        return Icon(
          Icons.more_vert_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.camera:
        return Icon(
          Icons.camera_alt_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.video:
        return Icon(
          Icons.video_call_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.speaker:
        return Icon(
          Icons.volume_down_rounded,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.speakerOff:
        return Icon(
          Icons.volume_off,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.startChat:
        return Icon(
          Icons.add_circle_outline_sharp,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.calendar:
        return Icon(
          Icons.calendar_today_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.userGroup:
        return Icon(
          Icons.supervisor_account_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.verified:
        return Icon(
          Icons.verified,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.headset:
        return Icon(
          Icons.headset_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.addUser:
        return Icon(
          Icons.person_add_alt_1_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.filledCheckMark:
        return Icon(
          Icons.check_circle,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.unfilledCheckmark:
        return Icon(
          Icons.circle_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.folder:
        return Icon(
          Icons.folder_open,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );

      case ThemeIcon.lock:
        return Icon(
          Icons.lock,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );

      case ThemeIcon.public:
        return Icon(
          Icons.public,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.addToPlaylist:
        return Icon(
          Icons.post_add,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.addToQueue:
        return Icon(
          Icons.add_to_queue,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.download:
        return Icon(
          Icons.download_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.next:
        return Icon(
          Icons.skip_next,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.prev:
        return Icon(
          Icons.skip_previous,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.shuffle:
        return Icon(
          Icons.shuffle,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.repeat:
        return Icon(
          Icons.repeat,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.showPwd:
        return Icon(
          Icons.visibility_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.hidePwd:
        return Icon(
          Icons.visibility_off_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.diamond:
        return Icon(
          Icons.diamond_outlined,
          size: size ?? AppTheme.iconSize,
          color: color ?? Theme.of(context).iconTheme.color,
        );
      case ThemeIcon.noData:
        return Icon(
          Icons.no_backpack,
          size: size ?? 20,
          color: color ?? Theme.of(context).iconTheme.color,
        );

      default:
        return Icon(
          Icons.no_backpack,
          size: size ?? 20,
          color: color ?? Theme.of(context).iconTheme.color,
        );
    }
  }
}
