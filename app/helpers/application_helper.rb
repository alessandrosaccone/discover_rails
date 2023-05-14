module ApplicationHelper
    def language_options
      [
        ['English', 'en'],
        ['Italiano', 'it'],
        # add more languages here as needed
      ]
    end

    def t_locale(key, options = {})
      options[:locale] ||= I18n.locale
      I18n.t(key, options)
    end
  end