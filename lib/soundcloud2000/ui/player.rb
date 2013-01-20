require_relative '../time_helper'

module Soundcloud2000
  module UI
    class Player < View

      def initialize(*attrs)
        super

        padding 2
      end

      def player(instance)
        @player = instance
      end

    protected

      def draw
        line '#' * (@player.play_progress * body_width).ceil
        line duration.ljust(10) + @player.title
        line track_info
      end

      def track
        @player.track
      end

      def track_info
        "#{track.playback_count} Plays | #{track.favoritings_count} Likes | #{track.comment_count} Comments | #{track.permalink_url}"
      end

      def duration
        TimeHelper.duration(@player.seconds_played.to_i * 1000)
      end

    end
  end
end
