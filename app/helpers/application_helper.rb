module ApplicationHelper
	def title
		base_title = "Application Manager"
		if @title.nil?
			base_title
		else
			"#{base_title} | #{@title}"
		end
	end
	
	def question1
    @question1  = "8 Rivers looks for individuals who can identify and solve important problems. What about you would indicate that you would be a good problem identifier and solver? Use anything you consider relevant, including quantitative measures (test scores, GPA, profit margins) and qualitative results (business, non-profit or other)."
	end
	
	def question2
    @question2 = "8 Rivers looks for self-starters. What can you tell us that would indicate you would be a good fit at 8 Rivers?"
	end
	
	def question3
    @quesiton3 = "If you worked for 8 Rivers on a project of your choosing, what would you hope to accomplish in 3 months? "
	end
	
	def request_from_pdfkit?
    # when generating a PDF, PDFKit::Middleware will set this flag
    request.env["Rack-Middleware-PDFKit"] == "true"
  end
end
