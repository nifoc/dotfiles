{ pkgs, lib, ... }:

let
  mas = pkgs.mas;
in
{
  environment.systemPackages = [ mas ];

  system.activationScripts.postUserActivation.text =
    let
      applications = [
        "870330316" /* Clear Clipboard */
        # "1354318707" /* Core Tunnel */
        # "1055511498" /* Day One */
        "640199958" /* Developer */
        "1355679052" /* Dropover */
        "1547121417" /* HomeControl */
        "470158793" /* Keka */
        "1567970985" /* MacFamilyTree 10 */
        "1621800675" /* Mercury */
        "1659154653" /* Mona */
        "1094255754" /* Outbank */
        "639968404" /* Parcel */
        "1554235898" /* Peek */
        # "1289583905" /* Pixelmator Pro */
        # "1444636541" /* Photomator */
        "1615798039" /* ReadKit */
        "1663047912" /* Screens 5 */
        "1475387142" /* Tailscale */
        # "1538878817" /* UTM */
      ];
    in
    ''
      echo "setting up App Store applications..."
      ${mas}/bin/mas install ${lib.concatStringsSep " " applications}
    '';
}
