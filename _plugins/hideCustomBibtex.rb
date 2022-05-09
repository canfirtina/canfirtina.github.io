 module Jekyll
  module HideCustomBibtex
    def hideCustomBibtex(input)
	  keywords = @context.registers[:site].config['filtered_bibtex_keywords']
    montha = "montha"
	  keywords.each do |keyword|
        if keyword != "montha"
		      input = input.gsub(/^.*#{keyword}.*$\n/, '')
        else
          input = input.gsub(/#{keyword}/, 'month')
        end
	  end
      return input
    end
  end
end

Liquid::Template.register_filter(Jekyll::HideCustomBibtex)
