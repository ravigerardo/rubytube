#!/usr/bin/ruby

require 'gtk3'

class RubyApp < Gtk::Window

    def initialize
        super
        init_ui
    end

    def init_ui

        fixed = Gtk::Fixed.new

        image = Gtk::Image.new(".b.png")
        fixed.put image, 50, 20

        label_link = Gtk::Label.new "Link del video:"
        fixed.put label_link, 60, 110

        link = Gtk::Entry.new
        fixed.put link, 60, 140

        button = Gtk::Button.new :label => "Descargar"
        button.set_size_request 70, 30

        label_ravi = Gtk::Label.new "by Ravi Gerardo"
        fixed.put label_ravi, 90, 350

        button.signal_connect "clicked" do
          puts(%x{cd ~; youtube-dl #{link.text}})
          puts(%x{cd ~; ls})
        end

        fixed.put button, 135, 210

        add fixed

        set_title "RubyTube"
        signal_connect "destroy" do
            Gtk.main_quit
        end

        set_default_size 300, 400
        set_window_position :center

        show_all
    end

    def on_key_release sender, event, label
        label.set_text sender.text
    end
end

#Gtk.init
window = RubyApp.new
Gtk.main
