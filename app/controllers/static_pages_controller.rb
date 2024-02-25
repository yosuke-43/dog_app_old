class StaticPagesController < ApplicationController
    skip_before_action :require_login, only: [:top]
    def top; end

    def test; end

    def terms_of_service; end

    def privacy_policy; end
end
