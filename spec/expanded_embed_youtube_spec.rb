require "spec_helper"

RSpec.describe MarkdownMedia do
  describe "#expanded_embed for youtube" do
    it "finds an youtube embed with a standard YouTube video URL" do
      result = MarkdownMedia.expanded_embed("https://www.youtube.com/watch?v=YX40hbAHx3s")

      expected_result = %q{<figure class="video-container " id=""><iframe credentialless allowfullscreen referrerpolicy="no-referrer-when-downgrade" sandbox="allow-scripts allow-same-origin" allow="accelerometer 'none'; ambient-light-sensor 'none'; autoplay 'none'; battery 'none'; bluetooth 'none'; browsing-topics 'none'; camera 'none'; ch-ua 'none'; display-capture 'none'; domain-agent 'none'; document-domain 'none'; encrypted-media 'none'; execution-while-not-rendered 'none'; execution-while-out-of-viewport 'none'; gamepad 'none'; geolocation 'none'; gyroscope 'none'; hid 'none'; identity-credentials-get 'none'; idle-detection 'none'; keyboard-map 'none'; local-fonts 'none'; magnetometer 'none'; microphone 'none'; midi 'none'; navigation-override 'none'; otp-credentials 'none'; payment 'none'; picture-in-picture 'none'; publickey-credentials-create 'none'; publickey-credentials-get 'none'; screen-wake-lock 'none'; serial 'none'; speaker-selection 'none'; sync-xhr 'none'; usb 'none'; web-share 'none'; window-management 'none'; xr-spatial-tracking 'none'" csp="sandbox allow-scripts allow-same-origin;" src="https://www.youtube-nocookie.com/embed/YX40hbAHx3s" frameborder="0" loading="lazy" ></iframe></figure>}
      expect(strip_html_whitespace(result)).to eq(expected_result)
    end

    it "finds an youtube embed with an embed YouTube video URL" do
      result = MarkdownMedia.expanded_embed("https://www.youtube.com/embed/YX40hbAHx3s")

      expected_result = %q{<figure class="video-container " id=""><iframe credentialless allowfullscreen referrerpolicy="no-referrer-when-downgrade" sandbox="allow-scripts allow-same-origin" allow="accelerometer 'none'; ambient-light-sensor 'none'; autoplay 'none'; battery 'none'; bluetooth 'none'; browsing-topics 'none'; camera 'none'; ch-ua 'none'; display-capture 'none'; domain-agent 'none'; document-domain 'none'; encrypted-media 'none'; execution-while-not-rendered 'none'; execution-while-out-of-viewport 'none'; gamepad 'none'; geolocation 'none'; gyroscope 'none'; hid 'none'; identity-credentials-get 'none'; idle-detection 'none'; keyboard-map 'none'; local-fonts 'none'; magnetometer 'none'; microphone 'none'; midi 'none'; navigation-override 'none'; otp-credentials 'none'; payment 'none'; picture-in-picture 'none'; publickey-credentials-create 'none'; publickey-credentials-get 'none'; screen-wake-lock 'none'; serial 'none'; speaker-selection 'none'; sync-xhr 'none'; usb 'none'; web-share 'none'; window-management 'none'; xr-spatial-tracking 'none'" csp="sandbox allow-scripts allow-same-origin;" src="https://www.youtube-nocookie.com/embed/YX40hbAHx3s" frameborder="0" loading="lazy" ></iframe></figure>}
      expect(strip_html_whitespace(result)).to eq(expected_result)
    end

    it "finds an youtube embed with a caption" do
      result = MarkdownMedia.expanded_embed(
        "https://www.youtube.com/watch?v=YX40hbAHx3s",
        caption: "youtube caption"
      )

      expected_result = %q{<figure class="video-container " id=""><iframe credentialless allowfullscreen referrerpolicy="no-referrer-when-downgrade" sandbox="allow-scripts allow-same-origin" allow="accelerometer 'none'; ambient-light-sensor 'none'; autoplay 'none'; battery 'none'; bluetooth 'none'; browsing-topics 'none'; camera 'none'; ch-ua 'none'; display-capture 'none'; domain-agent 'none'; document-domain 'none'; encrypted-media 'none'; execution-while-not-rendered 'none'; execution-while-out-of-viewport 'none'; gamepad 'none'; geolocation 'none'; gyroscope 'none'; hid 'none'; identity-credentials-get 'none'; idle-detection 'none'; keyboard-map 'none'; local-fonts 'none'; magnetometer 'none'; microphone 'none'; midi 'none'; navigation-override 'none'; otp-credentials 'none'; payment 'none'; picture-in-picture 'none'; publickey-credentials-create 'none'; publickey-credentials-get 'none'; screen-wake-lock 'none'; serial 'none'; speaker-selection 'none'; sync-xhr 'none'; usb 'none'; web-share 'none'; window-management 'none'; xr-spatial-tracking 'none'" csp="sandbox allow-scripts allow-same-origin;" src="https://www.youtube-nocookie.com/embed/YX40hbAHx3s" frameborder="0" loading="lazy" ></iframe><figcaption class="caption video-caption video-caption-youtube"><p>youtube caption</p></figcaption></figure>}
      expect(strip_html_whitespace(result)).to eq(expected_result)
    end

    it "finds an youtube embed with a caption and link" do
      result = MarkdownMedia.expanded_embed(
        "https://www.youtube.com/watch?v=YX40hbAHx3s",
        caption: "youtube caption",
        link:    "http://example.com/linked-destination"
      )

      expected_result = %q{<figure class="video-container " id=""><iframe credentialless allowfullscreen referrerpolicy="no-referrer-when-downgrade" sandbox="allow-scripts allow-same-origin" allow="accelerometer 'none'; ambient-light-sensor 'none'; autoplay 'none'; battery 'none'; bluetooth 'none'; browsing-topics 'none'; camera 'none'; ch-ua 'none'; display-capture 'none'; domain-agent 'none'; document-domain 'none'; encrypted-media 'none'; execution-while-not-rendered 'none'; execution-while-out-of-viewport 'none'; gamepad 'none'; geolocation 'none'; gyroscope 'none'; hid 'none'; identity-credentials-get 'none'; idle-detection 'none'; keyboard-map 'none'; local-fonts 'none'; magnetometer 'none'; microphone 'none'; midi 'none'; navigation-override 'none'; otp-credentials 'none'; payment 'none'; picture-in-picture 'none'; publickey-credentials-create 'none'; publickey-credentials-get 'none'; screen-wake-lock 'none'; serial 'none'; speaker-selection 'none'; sync-xhr 'none'; usb 'none'; web-share 'none'; window-management 'none'; xr-spatial-tracking 'none'" csp="sandbox allow-scripts allow-same-origin;" src="https://www.youtube-nocookie.com/embed/YX40hbAHx3s" frameborder="0" loading="lazy" ></iframe><figcaption class="caption video-caption video-caption-youtube"><p>youtube caption</p></figcaption></figure>}
      expect(strip_html_whitespace(result)).to eq(expected_result)
    end

    it "finds an youtube embed with a caption, link and id" do
      result = MarkdownMedia.expanded_embed(
        "https://www.youtube.com/watch?v=YX40hbAHx3s",
        caption: "youtube caption",
        link:    "http://example.com/linked-destination",
        id:      "youtube"
      )

      expected_result = %q{<figure class="video-container " id="youtube"><iframe credentialless allowfullscreen referrerpolicy="no-referrer-when-downgrade" sandbox="allow-scripts allow-same-origin" allow="accelerometer 'none'; ambient-light-sensor 'none'; autoplay 'none'; battery 'none'; bluetooth 'none'; browsing-topics 'none'; camera 'none'; ch-ua 'none'; display-capture 'none'; domain-agent 'none'; document-domain 'none'; encrypted-media 'none'; execution-while-not-rendered 'none'; execution-while-out-of-viewport 'none'; gamepad 'none'; geolocation 'none'; gyroscope 'none'; hid 'none'; identity-credentials-get 'none'; idle-detection 'none'; keyboard-map 'none'; local-fonts 'none'; magnetometer 'none'; microphone 'none'; midi 'none'; navigation-override 'none'; otp-credentials 'none'; payment 'none'; picture-in-picture 'none'; publickey-credentials-create 'none'; publickey-credentials-get 'none'; screen-wake-lock 'none'; serial 'none'; speaker-selection 'none'; sync-xhr 'none'; usb 'none'; web-share 'none'; window-management 'none'; xr-spatial-tracking 'none'" csp="sandbox allow-scripts allow-same-origin;" src="https://www.youtube-nocookie.com/embed/YX40hbAHx3s" frameborder="0" loading="lazy" ></iframe><figcaption class="caption video-caption video-caption-youtube"><p>youtube caption</p></figcaption></figure>}
      expect(strip_html_whitespace(result)).to eq(expected_result)
    end
  end
end
